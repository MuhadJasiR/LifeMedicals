import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:life_medicals/core/colors/color.dart';
import 'package:life_medicals/presentation/home/home_screen.dart';

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ValueNotifier<int> currentIndex = ValueNotifier(0);
    return Scaffold(
      bottomNavigationBar: ValueListenableBuilder(
        valueListenable: currentIndex,
        builder: (context, value, child) => BottomNavigationBar(
            currentIndex: currentIndex.value,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: kPrimaryColor,
            onTap: (idx) {
              log("clicking $value");
              log("clicking ${currentIndex.value}");
              currentIndex.value = idx;
              ValueNotifier;
            },
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/svg/icons/home.svg",
                    color: currentIndex.value == 0 ? kPrimaryColor : kGreyColor,
                  ),
                  label: "home"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/svg/icons/shopping-cart.svg",
                    color: currentIndex.value == 1 ? kPrimaryColor : kGreyColor,
                  ),
                  label: "cart"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/svg/icons/truck.svg",
                    color: currentIndex.value == 2 ? kPrimaryColor : kGreyColor,
                  ),
                  label: "truck"),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    "assets/svg/icons/settings.svg",
                    color: currentIndex.value == 3 ? kPrimaryColor : kGreyColor,
                  ),
                  label: "settings"),
            ]),
      ),
      body: const HomeScreen(),
    );
  }
}
