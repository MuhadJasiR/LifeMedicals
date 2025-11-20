import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:life_medicals/core/theme/color_schemes.dart';
import 'package:life_medicals/core/const/assets_name_const.dart';
import 'package:life_medicals/core/size/size.dart';

import 'package:life_medicals/features/home/search_screen.dart';

import 'package:life_medicals/features/home/presentation/widgets/Order_via_widget.dart';
import 'package:life_medicals/features/home/presentation/widgets/booking_order_container.dart';
import 'package:life_medicals/features/home/presentation/widgets/popular_product_widget.dart';
import 'package:life_medicals/features/home/presentation/widgets/top_brand_card.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late TutorialCoachMark tutorialCoachMark;
  GlobalKey creatorKey = GlobalKey();
  @override
  void initState() {
    createTutorial();

    tutorialCoachMark.show(context: context);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: _HomeAppBar(creatorKey: creatorKey),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        children: [
          kHeight(16),
          const SearchHeader(),
          kHeight(16),
          const TopBanner2(),
          kHeight(16),
          const OrderOrBookingWidgets(),
          kHeight(10),
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: Colors.grey[300],
                  thickness: 1,
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "ORDER VIA",
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontWeight: FontWeight.w600,
                    fontSize: 12,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              Expanded(
                child: Divider(
                  color: Colors.grey[300],
                  thickness: 1,
                ),
              ),
            ],
          ),
          kHeight(10),
          const OrderViaWIdget(),
          kHeight(20),
          TopBrandCardWidget(),
          kHeight(20),
          const PopularProductListWidget(),
          kHeight(20),
        ],
      ),
    );
  }

  void createTutorial() {
    log("Creating tutorial");
    tutorialCoachMark = TutorialCoachMark(
      hideSkip: true,
      targets: _createTargets(),
      colorShadow: kPrimaryColor.withValues(alpha: 0.8),
      paddingFocus: 10,
      opacityShadow: 0.5,
      imageFilter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
      onFinish: () {
        print("finish");
      },
      onClickTarget: (target) {
        print('onClickTarget: $target');
      },
      onClickTargetWithTapPosition: (target, tapDetails) {
        print("target: $target");
        print(
            "clicked at position local: ${tapDetails.localPosition} - global: ${tapDetails.globalPosition}");
      },
      onClickOverlay: (target) {
        print('onClickOverlay: $target');
      },
      onSkip: () {
        print("skip");
        return true;
      },
    );
  }

  List<TargetFocus> _createTargets() {
    List<TargetFocus> targets = [];
    targets.add(
      TargetFocus(
        identify: "creatorKey",
        keyTarget: creatorKey,
        alignSkip: Alignment.topRight,
        enableOverlayTab: true,
        contents: [
          TargetContent(
            customPosition: CustomTargetContentPosition(top: 40, right: 0),
            builder: (context, controller) {
              return const Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Hy, We MED'GO brought a new feature for you\nShow you medicine it will tell you which medicine it is and its contents",
                    style: TextStyle(
                      color: kWhiteColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
    return targets;
  }
}

class _HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final GlobalKey creatorKey;
  const _HomeAppBar({required this.creatorKey});

  @override
  Size get preferredSize => const Size.fromHeight(64);

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return AppBar(
      scrolledUnderElevation: 0,
      elevation: 0,
      titleSpacing: 0,
      leadingWidth: 56,
      leading: Padding(
        padding: const EdgeInsets.only(left: 12),
        child: Semantics(
          label: 'MedGo logo',
          child: Image.asset(assetsLogo, height: 28),
        ),
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              ' MedGo',
              style: TextStyle(
                color: kPrimaryColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            const SizedBox(height: 2),
            InkWell(
              onTap: () {
                // open address selector
              },
              borderRadius: BorderRadius.circular(16),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.location_on_outlined,
                      size: 16, color: colorScheme.onSurfaceVariant),
                  const SizedBox(width: 4),
                  Text(
                    'Deliver to Home',
                    style: TextStyle(
                      color: colorScheme.onSurfaceVariant,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(Icons.expand_more,
                      size: 16, color: colorScheme.onSurfaceVariant),
                ],
              ),
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          tooltip: 'Notifications',
          onPressed: () {},
          icon: const Icon(Icons.notifications_none_rounded),
        ),
        IconButton(
          key: creatorKey,
          tooltip: 'Scan prescription',
          icon: const Icon(Icons.document_scanner_outlined),
          onPressed: () {
            // Navigator.of(context).push(MaterialPageRoute(
            //   builder: (context) => const LiveAIScreen(),
            // ));
          },
        ),
        const SizedBox(width: 8),
      ],
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
      height: 160,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            kPrimaryLightColor,
            kPrimaryColor.withValues(alpha: 0.15),
          ],
        ),
        border: Border.all(color: kPrimaryColor.withValues(alpha: 0.2)),
        boxShadow: [
          BoxShadow(
            color: kPrimaryColor.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -10,
            top: -10,
            child: Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: kWhiteColor.withValues(alpha: 0.3),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "FLAT 30% OFF",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: kBlackColor,
                          letterSpacing: 0.5,
                        ),
                      ),
                      kHeight(6),
                      const Text(
                        "On First 3 Medicine Purchases",
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: Colors.black54,
                        ),
                      ),
                      kHeight(12),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: kPrimaryColor,
                          boxShadow: [
                            BoxShadow(
                              color: kPrimaryColor.withValues(alpha: 0.3),
                              blurRadius: 8,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: const Text(
                          "Code: FLAT30",
                          style: TextStyle(
                            color: kWhiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: kWhiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: ClipOval(
                    child: Image.asset(
                      "assets/gif/Offer animation.gif",
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
