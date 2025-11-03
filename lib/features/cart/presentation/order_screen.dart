import 'package:flutter/material.dart';
import 'package:life_medicals/core/theme/color_schemes.dart';
import 'package:life_medicals/core/size/size.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  // Sample orders data
  final List<Order> _orders = [
    Order(
      id: '#123456',
      date: '6th April 2021',
      status: OrderStatus.pending,
      items: [
        OrderItem(
          name: 'Dabur Pudin Hara Pearls 10 Tablets',
          quantity: 1,
          price: 12.56,
        ),
        OrderItem(
          name: 'Additional items',
          quantity: 3,
          price: 0,
          isCollapsed: true,
        ),
      ],
      subtotal: 40.00,
      shippingCost: 0,
      total: 40.00,
    ),
    Order(
      id: '#123456',
      date: '6th April 2021',
      status: OrderStatus.delivered,
      items: [
        OrderItem(
          name: 'Dabur Pudin Hara Pearls 10 Tablets',
          quantity: 1,
          price: 12.56,
        ),
        OrderItem(
          name: 'Immunity Booster Complete Nutrition',
          quantity: 1,
          price: 12.56,
        ),
        OrderItem(
          name: 'Dabur Pudin Hara Pearls 10 Tablets',
          quantity: 2,
          price: 25.12,
        ),
        OrderItem(
          name: 'Magnesium Vitamin D3 & Zinc',
          quantity: 2,
          price: 25.12,
        ),
      ],
      subtotal: 75.36,
      shippingCost: 10.00,
      total: 85.36,
    ),
    Order(
      id: '#123457',
      date: '6th April 2021',
      status: OrderStatus.cancelled,
      items: [
        OrderItem(
          name: 'Dabur Pudin Hara Pearls 10 Tablets',
          quantity: 1,
          price: 12.56,
        ),
      ],
      subtotal: 12.56,
      shippingCost: 10.00,
      total: 22.56,
    ),
  ];

  final Map<String, bool> _expandedOrders = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        backgroundColor: kWhiteColor,
        elevation: 0,
        title: const Text(
          'Order',
          style: TextStyle(
            color: kBlackColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _orders.length,
        itemBuilder: (context, index) {
          final order = _orders[index];
          final isExpanded = _expandedOrders[order.id] ?? false;

          return _buildOrderCard(order, isExpanded);
        },
      ),
    );
  }

  Widget _buildOrderCard(Order order, bool isExpanded) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
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
          // Order Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    order.date,
                    style: TextStyle(
                      fontSize: 13,
                      color: kGreyColor,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  kHeight(4),
                  Text(
                    'Order ID : ${order.id}',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: kBlackColor,
                    ),
                  ),
                ],
              ),
              _buildStatusBadge(order.status),
            ],
          ),

          kHeight(16),

          // Order Items (collapsed or expanded)
          if (isExpanded) ...[
            ..._buildExpandedItems(order.items),
          ] else ...[
            ..._buildCollapsedItems(order.items),
          ],

          kHeight(16),

          // Pricing Section
          if (isExpanded && order.items.length > 1) ...[
            _buildPriceRow(
                'Subtotal', '\$${order.subtotal.toStringAsFixed(2)}', false),
            kHeight(8),
            if (order.shippingCost > 0) ...[
              _buildPriceRow('Shipping Cost',
                  '+\$${order.shippingCost.toStringAsFixed(2)}', false),
              kHeight(16),
            ],
          ],

          // Total Amount
          _buildPriceRow(
              'Total Amount', '\$${order.total.toStringAsFixed(2)}', true),

          kHeight(16),

          // Expand/Collapse Button
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _expandedOrders[order.id] = !isExpanded;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isExpanded
                      ? Icons.keyboard_arrow_up
                      : Icons.keyboard_arrow_down,
                  color: kWhiteColor,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge(OrderStatus status) {
    Color bgColor;
    Color textColor;
    String text;
    IconData icon;

    switch (status) {
      case OrderStatus.pending:
        bgColor = kYellowColor.withOpacity(0.15);
        textColor = kYellowColor;
        text = 'Pending';
        icon = Icons.info;
        break;
      case OrderStatus.delivered:
        bgColor = Colors.green.withOpacity(0.15);
        textColor = Colors.green;
        text = 'Delivered';
        icon = Icons.check_circle;
        break;
      case OrderStatus.cancelled:
        bgColor = Colors.red.withOpacity(0.15);
        textColor = Colors.red;
        text = 'Cancelled';
        icon = Icons.cancel;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: textColor),
          kWidth(6),
          Text(
            text,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildCollapsedItems(List<OrderItem> items) {
    final firstItem = items.first;
    final remainingCount = items.where((item) => !item.isCollapsed).length - 1;

    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              '${firstItem.quantity}x  ${firstItem.name}',
              style: TextStyle(
                fontSize: 14,
                color: kGreyColor,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          kWidth(8),
          Text(
            '\$${firstItem.price.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: 14,
              color: kGreyColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
      if (remainingCount > 0) ...[
        kHeight(8),
        Text(
          '...+$remainingCount',
          style: TextStyle(
            fontSize: 14,
            color: kGreyColor,
          ),
        ),
      ],
    ];
  }

  List<Widget> _buildExpandedItems(List<OrderItem> items) {
    return items
        .where((item) => !item.isCollapsed)
        .map((item) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      '${item.quantity}x  ${item.name}',
                      style: TextStyle(
                        fontSize: 14,
                        color: kGreyColor,
                      ),
                    ),
                  ),
                  kWidth(8),
                  Text(
                    '\$${item.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 14,
                      color: kGreyColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ))
        .toList();
  }

  Widget _buildPriceRow(String label, String value, bool isBold) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: isBold ? 16 : 14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w500,
            color: kBlackColor,
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isBold ? 18 : 14,
            fontWeight: isBold ? FontWeight.bold : FontWeight.w600,
            color: kBlackColor,
          ),
        ),
      ],
    );
  }
}

// Order Model
class Order {
  final String id;
  final String date;
  final OrderStatus status;
  final List<OrderItem> items;
  final double subtotal;
  final double shippingCost;
  final double total;

  Order({
    required this.id,
    required this.date,
    required this.status,
    required this.items,
    required this.subtotal,
    required this.shippingCost,
    required this.total,
  });
}

// Order Item Model
class OrderItem {
  final String name;
  final int quantity;
  final double price;
  final bool isCollapsed;

  OrderItem({
    required this.name,
    required this.quantity,
    required this.price,
    this.isCollapsed = false,
  });
}

// Order Status Enum
enum OrderStatus {
  pending,
  delivered,
  cancelled,
}
