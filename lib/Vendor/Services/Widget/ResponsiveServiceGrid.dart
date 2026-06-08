import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/IconString.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/Services/Reusable%20Widget/PrimaryBtnOServices.dart';

class ResponsiveServicesGrid extends StatelessWidget {
  const ResponsiveServicesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isTiny = screenWidth <= 300;

    return Container(
      width: double.infinity,
      color: AppColors.backgroundOfScreenColor,
      padding: EdgeInsets.symmetric(
        vertical: isTiny ? 20 : 60,
        horizontal: isTiny ? 10 : 20,
      ),
      child: Column(
        children: [
          Text(
            TextString.responsiveCarGridTitle,
            textAlign: TextAlign.center,
            style: TTextTheme.h1StyleBlack(context),
          ),
          const SizedBox(height: 15),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Text(
              TextString.responsiveCarGridSubtitle,
              textAlign: TextAlign.center,
              style: TTextTheme.medium16black(context),
            ),
          ),
          const SizedBox(height: 50),

          Wrap(
            spacing: 25,
            runSpacing: 25,
            alignment: WrapAlignment.center,
            children: [
              _buildCard(
                context,
                title: TextString.responsiveCarGridTitle1,
                desc: TextString.responsiveCarGridSubtitle2,
                icon: IconString.servicesMaintenance,
                isTiny: isTiny,
                onTap: () {
                  context.go('/generalMaintenance');
                },
              ),
              _buildCard(
                context,
                title: TextString.responsiveCarGridTitle2,
                desc: TextString.responsiveCarGridSubtitle2,
                icon: IconString.serviceEngine,
                isTiny: isTiny,
                onTap: () {
                  context.go('/engineServices');
                },
              ),
              _buildCard(
                context,
                title: TextString.responsiveCarGridTitle3,
                desc: TextString.responsiveCarGridSubtitle3,
                icon: IconString.servicesBrake,
                isTiny: isTiny,
                onTap: () {
                  context.go('/brakeService');
                },
              ),
              _buildCard(
                context,
                title: TextString.responsiveCarGridTitle4,
                desc: TextString.responsiveCarGridSubtitle4,
                icon: IconString.servicesWheel,
                isTiny: isTiny,
                onTap: () {
                  context.go('/tyreService');
                },
              ),
              _buildCard(
                context,
                title: TextString.responsiveCarGridTitle5,
                desc: TextString.responsiveCarGridSubtitle5,
                icon: IconString.servicesAc,
                isTiny: isTiny,
                onTap: () {
                  context.go('/acServices');
                },
              ),
              _buildCard(
                context,
                title: TextString.responsiveCarGridTitle6,
                desc: TextString.responsiveCarGridSubtitle6,
                icon: IconString.serviceBattery,
                isTiny: isTiny,
                onTap: () {
                  context.go('/batteryServices');
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// -------- CARD WIDGET ------ ///
  Widget _buildCard(
      BuildContext context, {
        required String title,
        required String desc,
        required String icon,
        required bool isTiny,
        required VoidCallback onTap,
      }) {
    final screenWidth = MediaQuery.of(context).size.width;

    double cardWidth;
    if (screenWidth > 1200) {
      cardWidth = (screenWidth / 3) - 60;
    } else if (screenWidth > 700) {
      cardWidth = (screenWidth / 2) - 50;
    } else {
      cardWidth = screenWidth - 40;
    }

    return Container(
      width: cardWidth,
      constraints: const BoxConstraints(minWidth: 230),
      padding: EdgeInsets.all(isTiny ? 16 : 28),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.tertiaryTextColor.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.backgroundOfScreenColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(icon, width: 20, height: 20),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: TTextTheme.h5Style(context),
          ),
          const SizedBox(height: 12),
          Text(
            desc,
            style: TTextTheme.bodyRegular16(context),
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(4),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  PrimaryBtnOfServices(
                    text: "View Service",
                    width: 140,
                    borderRadius: BorderRadius.circular(8),
                    onTap: onTap,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}