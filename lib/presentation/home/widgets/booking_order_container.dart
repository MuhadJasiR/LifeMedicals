import 'package:flutter/material.dart';
import 'package:life_medicals/core/colors/color.dart';
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
        kWidth(10),
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
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: kGreyColor300!, width: 1),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Image.asset(
                    imageUrl,
                    height: 60,
                  )
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: kPrimaryLightColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(15),
                    bottomRight: Radius.circular(15)),
              ),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  offerTitle,
                  style: const TextStyle(
                      color: kPrimaryColor, fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
