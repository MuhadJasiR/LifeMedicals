import 'package:flutter/material.dart';
import 'package:life_medicals/core/colors/color.dart';
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
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        kHeight(10),
        SizedBox(
          height: 60,
          width: double.infinity,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: images.length,
            separatorBuilder: (context, index) => kWidth(10),
            itemBuilder: (context, index) {
              return Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: kGreyColor100!)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(images[index]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
