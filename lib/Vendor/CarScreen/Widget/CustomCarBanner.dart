import 'package:flutter/material.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';


class CustomCarBanner extends StatelessWidget {
  const CustomCarBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final double bannerHeight = screenWidth < 600 ? 190 : 230;

    return Container(
      width: double.infinity,
      height: bannerHeight,
      margin: EdgeInsets.symmetric(
        horizontal: AppSizes.horizontalPadding(context),
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    TextString.CustomCarTitle,
                    style: TTextTheme.h1Style(context),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    TextString.CustomCarSubtitle,
                    style: TTextTheme.bodyRegular16white(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}