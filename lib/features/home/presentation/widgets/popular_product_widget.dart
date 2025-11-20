import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:life_medicals/core/theme/color_schemes.dart';
import 'package:life_medicals/core/size/size.dart';

class PopularProductListWidget extends StatelessWidget {
  const PopularProductListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> medicineImage = [
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSJ4DJMU-vFrmdCqpUt72uYF6o-GJEc_uCwg&s"
          "https://tiimg.tistatic.com/fp/4/007/909/paracetamol-tablet-503.jpg",
      "https://cpimg.tistatic.com/08818136/b/4/Paracetamol-Caffeine-Anhydrous-Phenylephrine-Hydrochloride-Chlorpheniramine-Maleate-Tablets.jpg"
          "https://cpimg.tistatic.com/10590341/b/4/Paracetamol-Tablets-IP-1000mg.jpg",
      "https://cpimg.tistatic.com/09314466/b/4/Phenylephrine-Diphenhydramine-Paracetamol-Caffeine.jpeg",
      "https://cpimg.tistatic.com/10843195/b/4/650-MG-Paracetamol-Tablets-IP..jpg"
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Top Selling",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: kBlackColor,
          ),
        ),
        kHeight(12),
        SizedBox(
          height: 230,
          width: double.infinity,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: medicineImage.length,
            separatorBuilder: (context, index) => kWidth(12),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.push('/productDetail');
                },
                child: Container(
                  width: 160,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: kWhiteColor,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 130,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: kGreyColor100,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(12),
                                topRight: Radius.circular(12),
                              ),
                              child: Image.network(
                                medicineImage[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Container(
                              decoration: BoxDecoration(
                                color: kWhiteColor,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurRadius: 4,
                                  ),
                                ],
                              ),
                              child: IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(
                                  minWidth: 32,
                                  minHeight: 32,
                                ),
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.favorite_border,
                                  size: 18,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "MuscleBlaze Biozyme",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: Colors.grey[800],
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            kHeight(6),
                            Row(
                              children: [
                                const Text(
                                  "₹499",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: kBlackColor,
                                  ),
                                ),
                                kWidth(6),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 6,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.green.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: const Text(
                                    "15% OFF",
                                    style: TextStyle(
                                      fontSize: 9,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
