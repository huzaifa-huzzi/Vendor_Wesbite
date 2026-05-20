




import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/IconString.dart';
import 'package:vendor_website/Resources/ImageString.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';

class WhyChooseBrakeServices extends StatelessWidget {
  const WhyChooseBrakeServices({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;


    final bool isMobile = screenWidth < 850;
    final bool isTiny = screenWidth < 300;

    return Container(
      width: double.infinity,
      color: AppColors.backgroundOfScreenColor,
      padding: EdgeInsets.symmetric(
        vertical: 60,
        horizontal: isTiny ? 15 : (isMobile ? 25 : 80),
      ),
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: isMobile ? 0 : 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  TextString.chooseServiceTitle,
                  style: TTextTheme.h5Style(context),
                ),
                const SizedBox(height: 15),
                Text(
                  TextString.chooseServiceSubtitle,
                  style:  TTextTheme.medium16black(context),
                ),
                const SizedBox(height: 30),
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    ImageString.servicesImage,
                    width: double.infinity,
                    height: isMobile ? 250 : 400,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),

          if (!isMobile) const SizedBox(width: 60),
          if (isMobile) const SizedBox(height: 40),

          Expanded(
            flex: isMobile ? 0 : 5,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Wrap(
                  runSpacing: 40,
                  spacing: 20,
                  children: [
                    _buildPoint(
                      context: context,
                      title: TextString.chooseServiceTitle1,
                      desc: TextString.chooseServiceSubtitle1,
                      svgPath: IconString.servicesTechnology,
                      width: isMobile ? constraints.maxWidth : (constraints.maxWidth / 2) - 15,
                    ),
                    _buildPoint(
                      context: context,
                      title: TextString.chooseServiceTitle2,
                      desc: TextString.chooseServiceSubtitle2 ,
                      svgPath: IconString.servicePremium,
                      width: isMobile ? constraints.maxWidth : (constraints.maxWidth / 2) - 15,
                    ),
                    _buildPoint(
                      context: context,
                      title: TextString.chooseServiceTitle3,
                      desc: TextString.chooseServiceSubtitle3 ,
                      svgPath: IconString.serviceAvailable,
                      width: isMobile ? constraints.maxWidth : (constraints.maxWidth / 2) - 15,
                    ),
                    _buildPoint(
                      context: context,
                      title: TextString.chooseServiceTitle4,
                      desc: TextString.chooseServiceSubtitle4 ,
                      svgPath: IconString.serviceProfessional,
                      width: isMobile ? constraints.maxWidth : (constraints.maxWidth / 2) - 15,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  /// ---------- Extra Widget -------///

  // Points
  Widget _buildPoint({
    required BuildContext context,
    required String title,
    required String desc,
    required String svgPath,
    required double width,
  }) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(
            svgPath,
            width: 32,
            height: 32,
            colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
          ),
          const SizedBox(height: 15),
          Text(
            title,
            style: TTextTheme.h5Style(context),
          ),
          const SizedBox(height: 8),
          Text(
            desc,
            style: TTextTheme.bodyRegular16black(context),
          ),
        ],
      ),
    );
  }
}