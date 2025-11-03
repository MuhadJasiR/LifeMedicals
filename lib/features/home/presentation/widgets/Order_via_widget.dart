import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:life_medicals/core/theme/color_schemes.dart';
import 'package:life_medicals/core/size/size.dart';
import 'package:life_medicals/features/home/presentation/bloc/home_screen_bloc.dart';

class OrderViaWIdget extends StatelessWidget {
  const OrderViaWIdget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<HomeScreenBloc>();
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
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
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Divider(
                  color: Colors.grey[300],
                  thickness: 1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
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
          kHeight(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildActionButton(
                icon: FontAwesomeIcons.whatsapp,
                label: "WhatsApp",
                onTap: () =>
                    bloc.add(const OpenWhatsAppEvent("+91 8590708332")),
              ),
              Container(
                width: 1,
                height: 40,
                color: kGreyColor200,
              ),
              _buildActionButton(
                icon: Icons.document_scanner,
                label: "Prescription",
                onTap: () {},
              ),
              Container(
                width: 1,
                height: 40,
                color: kGreyColor200,
              ),
              _buildActionButton(
                icon: Icons.call,
                label: "Call",
                onTap: () => bloc.add(const OpenDialerEvent("+91 8590708332")),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: kPrimaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: kPrimaryColor,
                size: 20,
              ),
            ),
            kHeight(6),
            Text(
              label,
              style: const TextStyle(
                color: kBlackColor,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
