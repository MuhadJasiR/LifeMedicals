import 'package:flutter/material.dart';
import 'package:life_medicals/core/colors/color.dart';
import 'package:life_medicals/core/size/size.dart';

class PopularProductListWidget extends StatelessWidget {
  const PopularProductListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Popular Product",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
        kHeight(10),
        SizedBox(
          height: 200,
          width: double.infinity,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: 6,
            separatorBuilder: (context, index) => kWidth(10),
            itemBuilder: (context, index) {
              return Container(
                  width: 200,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      border: Border.all(color: kGreyColor100!)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                            onPressed: () {}, icon: const Icon(Icons.favorite)),
                      ),
                      Center(
                        child: Image.network(
                            height: 100,
                            "https://img2.hkrtcdn.com/30875/prd_3087491-MuscleBlaze-MBVITE-Daily-Multivitamin-for-Enhanced-Energy-Stamina-Gut-Health-30-tablets-Unflavoured_o.jpg"),
                      ),
                      kHeight(10),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text("MuscleBlaze"),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Text(
                          "₹ 499/-",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ));
            },
          ),
        ),
      ],
    );
  }
}
