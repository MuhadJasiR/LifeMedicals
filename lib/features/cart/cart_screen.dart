import 'package:flutter/material.dart';
import 'package:life_medicals/core/theme/color_schemes.dart';
import 'package:life_medicals/core/size/size.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Sample cart items
  final List<CartItem> _cartItems = [
    CartItem(
      id: '1',
      name: 'Dabur Pudin Hara Pearls 10 Tablets',
      image: 'https://via.placeholder.com/100x100.png?text=Dabur',
      originalPrice: 20,
      discountedPrice: 10,
      discountPercent: 50,
      quantity: 1,
    ),
    CartItem(
      id: '2',
      name: 'Liveasy Wellness Calcium Magnesium Vitamin D3 & Zinc',
      image: 'https://via.placeholder.com/100x100.png?text=Liveasy',
      originalPrice: 20,
      discountedPrice: 18,
      discountPercent: 10,
      quantity: 1,
    ),
    CartItem(
      id: '3',
      name: 'Wow Life Science Body Cleanse 60\'s',
      image: 'https://via.placeholder.com/100x100.png?text=WOW',
      originalPrice: 20,
      discountedPrice: 10,
      discountPercent: 50,
      quantity: 1,
    ),
  ];

  double get subtotal {
    return _cartItems.fold(
        0, (sum, item) => sum + (item.discountedPrice * item.quantity));
  }

  final double shippingCost = 10.00;

  double get total => subtotal + shippingCost;

  void _updateQuantity(String id, int change) {
    setState(() {
      final index = _cartItems.indexWhere((item) => item.id == id);
      if (index != -1) {
        final newQuantity = _cartItems[index].quantity + change;
        if (newQuantity > 0) {
          _cartItems[index].quantity = newQuantity;
        }
      }
    });
  }

  void _removeItem(String id) {
    setState(() {
      _cartItems.removeWhere((item) => item.id == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kBlackColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'My Cart',
          style: TextStyle(
            color: kBlackColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Cart Items List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // Cart Items
                ..._cartItems.map((item) => _buildCartItemCard(item)),

                kHeight(20),

                // Delivery Address Section
                _buildDeliveryAddress(),

                kHeight(20),

                // Order Info Section
                _buildOrderInfo(),

                kHeight(100), // Space for checkout button
              ],
            ),
          ),

          // Checkout Button (Fixed at bottom)
          _buildCheckoutButton(),
        ],
      ),
    );
  }

  Widget _buildCartItemCard(CartItem item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: kGreyColor100,
              borderRadius: BorderRadius.circular(8),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                item.image,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: kGreyColor100,
                    child:
                        const Icon(Icons.medical_services, color: kGreyColor),
                  );
                },
              ),
            ),
          ),

          kWidth(12),

          // Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: kBlackColor,
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),

                kHeight(8),

                // Price Row
                Row(
                  children: [
                    Text(
                      '\$${item.originalPrice}',
                      style: TextStyle(
                        fontSize: 14,
                        color: kGreyColor,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    kWidth(8),
                    Text(
                      '\$${item.discountedPrice}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: kBlackColor,
                      ),
                    ),
                    kWidth(8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        '${item.discountPercent}% OFF',
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: kWhiteColor,
                        ),
                      ),
                    ),
                  ],
                ),

                kHeight(12),

                // Quantity Controls
                Row(
                  children: [
                    _buildQuantityButton(
                      icon: Icons.remove,
                      onTap: () => _updateQuantity(item.id, -1),
                    ),
                    kWidth(16),
                    Text(
                      '${item.quantity}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: kBlackColor,
                      ),
                    ),
                    kWidth(16),
                    _buildQuantityButton(
                      icon: Icons.add,
                      onTap: () => _updateQuantity(item.id, 1),
                    ),
                  ],
                ),
              ],
            ),
          ),

          kWidth(8),

          // Delete Button
          GestureDetector(
            onTap: () => _removeItem(item.id),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Icon(
                Icons.delete_outline,
                color: Colors.red,
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildQuantityButton(
      {required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: kGreyColor100,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          size: 18,
          color: kBlackColor,
        ),
      ),
    );
  }

  Widget _buildDeliveryAddress() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Delivery Address',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: kBlackColor,
            ),
          ),
          kHeight(12),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.location_on,
                  color: kPrimaryColor,
                  size: 24,
                ),
              ),
              kWidth(12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '1901 Bay Ridge PKWY',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: kBlackColor,
                      ),
                    ),
                    kHeight(4),
                    Text(
                      '11204-5761 New York',
                      style: TextStyle(
                        fontSize: 13,
                        color: kGreyColor,
                      ),
                    ),
                  ],
                ),
              ),
              TextButton(
                onPressed: () {
                  // Change address
                },
                child: const Text(
                  'Change',
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: kPrimaryColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildOrderInfo() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Order Info',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: kBlackColor,
            ),
          ),
          kHeight(16),
          _buildOrderRow('Subtotal', '\$${subtotal.toStringAsFixed(2)}', false),
          kHeight(12),
          _buildOrderRow(
              'Shipping Cost', '+\$${shippingCost.toStringAsFixed(2)}', false),
          kHeight(16),
          const Divider(height: 1),
          kHeight(16),
          _buildOrderRow('Total', '\$${total.toStringAsFixed(2)}', true),
        ],
      ),
    );
  }

  Widget _buildOrderRow(String label, String value, bool isBold) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isBold ? 16 : 14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: kBlackColor,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isBold ? 18 : 15,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
            color: kBlackColor,
          ),
        ),
      ],
    );
  }

  Widget _buildCheckoutButton() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kWhiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {
              // Proceed to checkout
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Proceeding to checkout...'),
                  backgroundColor: kPrimaryColor,
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              foregroundColor: kWhiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: Text(
              'Check Out (\$${total.toStringAsFixed(2)})',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// Cart Item Model
class CartItem {
  final String id;
  final String name;
  final String image;
  final double originalPrice;
  final double discountedPrice;
  final int discountPercent;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.image,
    required this.originalPrice,
    required this.discountedPrice,
    required this.discountPercent,
    required this.quantity,
  });
}
