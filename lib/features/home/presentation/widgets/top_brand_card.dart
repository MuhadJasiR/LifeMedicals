import 'package:flutter/material.dart';
import 'package:life_medicals/core/theme/color_schemes.dart';
import 'package:life_medicals/core/size/size.dart';

class TopBrandCardWidget extends StatelessWidget {
  TopBrandCardWidget({
    super.key,
  });

  final List images = [
    "https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Cipla_logo.svg/1920px-Cipla_logo.svg.png",
    "https://upload.wikimedia.org/wikipedia/commons/f/fe/Logo_Sun_Pharmaceutical.png",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/6/6a/Zydus_Logo.jpg/1920px-Zydus_Logo.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/f/fb/Alkem_Laboratories_logo.png",
    "https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Cipla_logo.svg/1920px-Cipla_logo.svg.png",
    "https://upload.wikimedia.org/wikipedia/commons/f/fe/Logo_Sun_Pharmaceutical.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Top Brands",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: kBlackColor,
          ),
        ),
        kHeight(12),
        SizedBox(
          height: 70,
          width: double.infinity,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            separatorBuilder: (context, index) => kWidth(12),
            itemBuilder: (context, index) {
              return Container(
                height: 70,
                width: 70,
                padding: const EdgeInsets.all(12),
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
                child: Image.network(
                  images[index],
                  fit: BoxFit.contain,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
