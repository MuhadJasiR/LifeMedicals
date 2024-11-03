import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_medicals/core/colors/color.dart';
import 'package:life_medicals/core/size/size.dart';
import 'package:life_medicals/presentation/home/home_screen.dart';

class OrderViaWIdget extends StatelessWidget {
  const OrderViaWIdget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const CustomDivider(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
            ),
            kWidth(7),
            const Text(
              "OR YOU CAN ORDER VIA",
              style: TextStyle(color: kPrimaryColor),
            ),
            kWidth(7),
            const CustomDivider(
              begin: Alignment.centerRight,
              end: Alignment.centerLeft,
            ),
          ],
        ),
        kHeight(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
                onPressed: () {},
                label: const Text(
                  "WhatsApp",
                  style: TextStyle(color: kBlackColor),
                ),
                icon: const FaIcon(
                  FontAwesomeIcons.whatsapp,
                  color: kPrimaryColor,
                )),
            TextButton.icon(
                onPressed: () {},
                label: const Text(
                  "Prescription",
                  style: TextStyle(color: kBlackColor),
                ),
                icon: const Icon(Icons.document_scanner, color: kPrimaryColor)),
            TextButton.icon(
                onPressed: () {},
                label: const Text(
                  "Call",
                  style: TextStyle(color: kBlackColor),
                ),
                icon: const Icon(
                  Icons.call,
                  color: kPrimaryColor,
                ))
          ],
        )
      ],
    );
  }
}
