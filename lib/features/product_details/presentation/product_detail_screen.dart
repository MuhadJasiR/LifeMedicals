import 'package:flutter/material.dart';
import 'package:life_medicals/core/theme/color_schemes.dart';

class ProductDetailScreen extends StatefulWidget {
  const ProductDetailScreen({super.key});

  @override
  State<ProductDetailScreen> createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<String> _images = [
    // first image is the main carousel image for the medicine
    'https://m.media-amazon.com/images/I/41mGtnvu-5L._AC_UF1000,1000_QL80_.jpg',
    'https://www.medstown.com/wp-content/uploads/2025/06/dolo-650-paracetamol-tablets-1000x1000-1.webp',
    'https://onemg.gumlet.io/l_watermark_346,w_480,h_480/a_ignore,w_480,h_480,c_fit,q_auto,f_auto/cropped/ejm9e9zlzlzl5kcbshuu.jpg?dpr=3&format=auto',
  ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  Widget _buildCarousel() {
    return Container(
      margin: const EdgeInsets.all(16),
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
        children: [
          Stack(
            children: [
              SizedBox(
                height: 280,
                child: PageView.builder(
                  controller: _pageController,
                  itemCount: _images.length,
                  onPageChanged: (index) =>
                      setState(() => _currentPage = index),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Container(
                          color: kGreyColor100,
                          child: Image.network(
                            _images[index],
                            fit: BoxFit.contain,
                            width: double.infinity,
                            loadingBuilder: (context, child, progress) {
                              if (progress == null) return child;
                              return Container(
                                color: kGreyColor100,
                                child: const Center(
                                  child: CircularProgressIndicator(
                                    color: kPrimaryColor,
                                  ),
                                ),
                              );
                            },
                            errorBuilder: (c, e, s) => Container(
                              color: kGreyColor100,
                              child: const Center(
                                child: Icon(Icons.broken_image, size: 48),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Positioned(
                top: 16,
                right: 16,
                child: Container(
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                      ),
                    ],
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border,
                      color: kPrimaryColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                _images.length,
                (i) => AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: _currentPage == i ? 24 : 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: _currentPage == i ? kPrimaryColor : Colors.grey[300],
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ExpansionTile _infoTile(String title, String content) {
    return ExpansionTile(
      tilePadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      childrenPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      backgroundColor: kWhiteColor,
      collapsedBackgroundColor: kWhiteColor,
      shape: Border(
        bottom: BorderSide(color: kGreyColor200!, width: 1),
      ),
      collapsedShape: Border(
        bottom: BorderSide(color: kGreyColor200!, width: 1),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 15,
          color: kBlackColor,
        ),
      ),
      children: [
        Text(
          content,
          style: TextStyle(
            height: 1.5,
            fontSize: 14,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    const String productName = 'Dollo 650';
    const String productSub = 'Apex Laboratories Pvt Ltd';
    const String composition = "Paracetamol 650 mg";
    const String price = '₹ 45.00';
    const String paymentInfo =
        'Get your products delivered and pay at your doorstep.';
    const String returnPolicy =
        'Easily return the product if you don\'t need it within 7 days.';
    const String expiry =
        'We only stock items that keep their quality over time.';

    const String information =
        'Dollo 650 contains paracetamol 650 mg per tablet. It is intended for short-term relief of fever and mild to moderate pain. For adults and children above 12 years.';

    const String uses =
        'Used to treat headache, toothache, muscle pain, backache, and fever associated with common cold or infections.';

    const String benefits =
        'Fast-acting pain relief, reduces fever, generally well tolerated when used as directed.';

    const String sideEffects =
        'May include nausea, allergic reactions (rash, swelling), and rarely liver problems if overdosed or taken with alcohol.';

    const String usage =
        'Adults: 1 tablet (650 mg) every 4-6 hours as needed. Do not exceed 4 g (4000 mg) of paracetamol in 24 hours. Follow doctor advice for children.';

    const String howItWorks =
        'Paracetamol works by blocking chemical messengers in the brain that signal pain and regulate temperature.';

    const String substitutes =
        'Other brands with paracetamol 500-650 mg; consult pharmacist for generic paracetamol tablets.';

    const String safety =
        'Do not combine with other paracetamol-containing products. Avoid alcohol. Consult your doctor if you have liver disease, or are pregnant/breastfeeding.';

    const String faq =
        'Q: Can I take Dollo 650 with antibiotics?\nA: Generally yes, but check with your doctor for specific combinations.\n\nQ: How soon does it act?\nA: Typically within 30-60 minutes.';

    const String other =
        'Storage: Keep in a cool, dry place away from direct sunlight. Keep out of reach of children. Pack contents may vary by manufacturer.';

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
          'Product Details',
          style: TextStyle(
            color: kBlackColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.shopping_bag_outlined,
              color: kBlackColor,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCarousel(),

            // Product Info Card
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
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
                    productName,
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: kBlackColor,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    productSub,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: kPrimaryColor.withOpacity(0.3),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Composition",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: kPrimaryColor,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          composition,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: kBlackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      const Text(
                        price,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Text(
                          '20% OFF',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  SizedBox(
                    width: double.infinity,
                    height: 48,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor,
                        foregroundColor: kWhiteColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      icon: const Icon(Icons.shopping_cart_outlined, size: 20),
                      label: const Text(
                        'Add to Cart',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Info Cards
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
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
                children: [
                  _buildInfoItem(
                    Icons.payments_outlined,
                    'Cash on Delivery',
                    paymentInfo,
                    Colors.green,
                  ),
                  Divider(height: 1, color: kGreyColor200),
                  _buildInfoItem(
                    Icons.cached,
                    '7 Days Return',
                    returnPolicy,
                    Colors.blue,
                  ),
                  Divider(height: 1, color: kGreyColor200),
                  _buildInfoItem(
                    Icons.event_available,
                    'Best Before Nov, 2028',
                    expiry,
                    Colors.orange,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Section Title
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Product Information',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: kBlackColor,
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Expandable Info Section
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: kWhiteColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: kGreyColor200!),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.04),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _infoTile('About Product', information),
                  _infoTile('Uses', uses),
                  _infoTile('Benefits', benefits),
                  _infoTile('Side Effects', sideEffects),
                  _infoTile('How to Use', usage),
                  _infoTile('How it Works', howItWorks),
                  _infoTile('Substitutes', substitutes),
                  _infoTile('Safety Advice', safety),
                  _infoTile('FAQs', faq),
                  _infoTile('Other Information', other),
                ],
              ),
            ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(
      IconData icon, String title, String description, Color color) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, size: 20, color: color),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: kBlackColor,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
