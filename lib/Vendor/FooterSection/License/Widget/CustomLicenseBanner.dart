import 'package:flutter/material.dart';
import 'package:vendor_website/Resources/AppColors.dart' show AppColors;
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Routes/AppRoutes.dart';



class CustomLicenseBanner extends StatelessWidget {
  const CustomLicenseBanner({super.key});

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
                  // Main Title
                  Text(
                    TextString.licenseTitle,
                    style: TTextTheme.h1Style(context),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () => AppNavigation.router.go('/'),
                        mouseCursor: SystemMouseCursors.click,
                        child: Text(
                            TextString.homeTitle1,
                            style: TTextTheme.bodyRegular16white(context)
                        ),
                      ),
                      Text(
                        " / ",
                        style: TTextTheme.bodyRegular16white(context).copyWith(
                          fontSize: 14,
                          color: Colors.white.withOpacity(0.8),
                        ),
                      ),
                      Text(
                          TextString.licenseTitle,
                          style: TTextTheme.bodyRegular16white(context)
                      ),
                    ],
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