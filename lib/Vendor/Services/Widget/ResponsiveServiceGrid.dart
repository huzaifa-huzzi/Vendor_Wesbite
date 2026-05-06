

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/IconString.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';

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
                TextString.responsiveCarGridTitle1,
                TextString.responsiveCarGridSubtitle2,
                IconString.servicesMaintenance,
                isTiny,
              ),
              _buildCard(
                context,
                TextString.responsiveCarGridTitle2,
                TextString.responsiveCarGridSubtitle2,
                IconString.serviceEngine,
                isTiny,
              ),
              _buildCard(
                context,
                TextString.responsiveCarGridTitle3,
                TextString.responsiveCarGridSubtitle3,
                IconString.servicesBrake,
                isTiny,
              ),
              _buildCard(
                context,
                TextString.responsiveCarGridTitle4,
                TextString.responsiveCarGridSubtitle4,
                IconString.servicesWheel,
                isTiny,
              ),
              _buildCard(
                context,
                TextString.responsiveCarGridTitle5,
                TextString.responsiveCarGridSubtitle5,
                IconString.servicesAc,
                isTiny,
              ),
              _buildCard(
                context,
                TextString.responsiveCarGridTitle6,
                TextString.responsiveCarGridSubtitle6,
                IconString.serviceBattery,
                isTiny,
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// -------- Extra Widget ------ ///

  //  CARD WIDGET
  Widget _buildCard(BuildContext context, String title, String desc, String icon, bool isTiny) {
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
            child: SvgPicture.asset(icon,width: 20,height: 20,),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: TTextTheme.h5Style(context),
          ),
          const SizedBox(height: 12),
          Text(
            desc,
            style: TTextTheme.bodyRegular16(context)
          ),
          const SizedBox(height: 20),
          InkWell(
            onTap: () {},
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "View Services",
                  style: TTextTheme.bodySemiBold16(context)
                ),
                const SizedBox(width: 8),
                Icon(Icons.arrow_forward, size: isTiny ? 14 : 16, color: AppColors.primaryColor),
              ],
            ),
          ),
        ],
      ),
    );
  }
}