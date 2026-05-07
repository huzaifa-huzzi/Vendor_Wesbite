import 'package:flutter/material.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';

class ExtraordinaryDriveSection extends StatelessWidget {
  const ExtraordinaryDriveSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;


    final bool isMobile = screenWidth < 850;
    final bool isTiny = screenWidth < 350;

    return Container(
        width: double.infinity,
        color: AppColors.backgroundOfScreenColor,
        padding: EdgeInsets.symmetric(
          vertical: 80,
          horizontal: isMobile ? 20 : 80,
        ),
        child: Flex(
          direction: isMobile ? Axis.vertical : Axis.horizontal,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Expanded(
        flex: isMobile ? 0 : 4,
          child: Padding(
            padding: EdgeInsets.only(bottom: isMobile ? 40 : 0),
            child: Text(
              TextString.extraOrdinaryTitle,
              style: TTextTheme.h1StyleBlack(context),
            ),
          ),
        ),

        if (!isMobile) const SizedBox(width: 60),

    Expanded(
      flex: isMobile ? 0 : 6,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final double itemWidth = isMobile
              ? constraints.maxWidth
              : (constraints.maxWidth / 2) - 20;

          return Wrap(
            spacing: 40,
            runSpacing: 40,
            children: [
              _buildFeatureItem(
                context,
                title:TextString.extraOrdinaryTitle1 ,
                desc: TextString.extraOrdinarySubtitle1,
                width: itemWidth,
              ),
              _buildFeatureItem(
                context,
                title: TextString.extraOrdinaryTitle2,
                desc: TextString.extraOrdinarySubtitle2,
                width: itemWidth,
              ),
              _buildFeatureItem(
                context,
                title: TextString.extraOrdinaryTitle3,
                desc: TextString.extraOrdinarySubtitle3,
                width: itemWidth,
              ),
              _buildFeatureItem(
                context,
                title: TextString.extraOrdinaryTitle4,
                desc: TextString.extraOrdinarySubtitle4,
                width: itemWidth,
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

  /// ------- Extra Widget --------- ///

  // Feature Item Builder
  Widget _buildFeatureItem(BuildContext context, {
    required String title,
    required String desc,
    required double width
  }) {
    return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TTextTheme.h5Style(context),
          ),
          const SizedBox(height: 15),
          Text(
            desc,
            style: TTextTheme.bodyRegular16black(context),
          ),
        ],
      ),
    );
  }
}