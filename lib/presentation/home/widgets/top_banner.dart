import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:life_medicals/core/colors/color.dart';
import 'package:life_medicals/core/size/size.dart';

class TopBanner extends StatelessWidget {
  const TopBanner({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SvgPicture.asset(
          "assets/svg/Offer.svg",
          height: 180,
          width: double
              .infinity, // Ensures it scales horizontally within the Stack
          fit: BoxFit.fitWidth,
        ),
        Positioned(
          left: 15,
          top: 0,
          bottom: 0,
          child: Row(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "FLAT 30% OFF",
                    style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  kHeight(10),
                  const Text(
                    "On First 3 Medicine Purchases",
                    style: TextStyle(
                      color: kWhiteColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  kHeight(10),
                  const Text(
                    "Code: q234lkj",
                    style: TextStyle(
                      color: kWhiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              kWidth(50),
              Image.asset(
                "assets/gif/Offer animation.gif",
                height: 100,
              )
            ],
          ),
        ),
      ],
    );
  }
}
