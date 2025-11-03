import 'package:flutter/material.dart';
import 'package:life_medicals/core/theme/color_schemes.dart';
import 'package:life_medicals/core/size/size.dart';

class OrderOrBookingWidgets extends StatelessWidget {
  const OrderOrBookingWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const OrderOrBookingContainer(
          title: 'Order\nMedicines',
          imageUrl: 'assets/image/medical-report.png',
          offerTitle: 'UPTO 24% OFF',
        ),
        kWidth(12),
        const OrderOrBookingContainer(
          title: 'Doctor\nAppointments',
          imageUrl: 'assets/image/health-report.png',
          offerTitle: 'UPTO 50% OFF',
        ),
      ],
    );
  }
}

class OrderOrBookingContainer extends StatelessWidget {
  const OrderOrBookingContainer({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.offerTitle,
  });
  final String title;
  final String imageUrl;
  final String offerTitle;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: kWhiteColor,
          border: Border.all(color: kGreyColor200!, width: 1),
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
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        height: 1.3,
                      ),
                    ),
                  ),
                  kWidth(8),
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: kPrimaryColor.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.asset(
                      imageUrl,
                      height: 40,
                      width: 40,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                offerTitle,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: kWhiteColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
