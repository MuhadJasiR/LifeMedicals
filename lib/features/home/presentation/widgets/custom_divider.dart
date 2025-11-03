import 'package:flutter/material.dart';
import 'package:life_medicals/core/theme/color_schemes.dart';

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
