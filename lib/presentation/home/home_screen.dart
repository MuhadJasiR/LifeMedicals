import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:life_medicals/core/colors/color.dart';
import 'package:life_medicals/core/size/size.dart';
import 'package:life_medicals/presentation/bottom_nav_screen.dart';
import 'package:life_medicals/presentation/home/widgets/Order_via_widget.dart';
import 'package:life_medicals/presentation/home/widgets/booking_order_container.dart';
import 'package:life_medicals/presentation/home/widgets/popular_product_widget.dart';
import 'package:life_medicals/presentation/home/widgets/top_brand_card.dart';

import 'widgets/top_banner.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Image.asset("assets/logo/lifeLogo-removebg.png"),
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_bag_outlined))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
        child: ListView(
          children: [
            kHeight(10),
            const SearBarWidget(),
            kHeight(10),
            const TopBanner(),
            // const TopBanner2(),
            kHeight(10),
            const OrderOrBookingWidgets(),
            kHeight(10),
            const OrderViaWIdget(),
            kHeight(10),
            TopBrandCardWidget(),
            kHeight(25),
            const PopularProductListWidget()
          ],
        ),
      ),
    );
  }
}

class SearBarWidget extends StatelessWidget {
  const SearBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      side: WidgetStatePropertyAll(BorderSide(color: kGreyColor300!)),
      backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
      hintText: "Search for Medicines and Health Products",
      hintStyle: const WidgetStatePropertyAll(
          TextStyle(color: Colors.grey, fontSize: 15)),
      leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.search,
            color: kPrimaryColor,
          )),
      elevation: const WidgetStatePropertyAll(0),
    );
  }
}

class TopBanner2 extends StatelessWidget {
  const TopBanner2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: kPrimaryLightColor,
          border: Border.all(color: kPrimaryColor.withOpacity(0.2))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "FLAT 30% OFF",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight(10),
              const Text(
                "On First 3 Medicine Purchases",
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kHeight(10),
              Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                  color: kPrimaryColor,
                ),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Code: FLAT30",
                    style: TextStyle(
                      color: kWhiteColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
          CircleAvatar(
            radius: 70,
            backgroundColor: kWhiteColor,
            child: Image.asset(
              "assets/gif/Offer animation.gif",
              height: 100,
            ),
          )
        ],
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({
    super.key,
    required this.begin,
    required this.end,
  });

  final AlignmentGeometry begin;
  final AlignmentGeometry end;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 1.2,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: const [
              Colors.transparent,
              kPrimaryColor,
            ],
            begin: begin,
            end: end,
          ),
        ),
      ),
    );
  }
}
