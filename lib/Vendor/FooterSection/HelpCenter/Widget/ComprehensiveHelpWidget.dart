import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/ImageString.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/Services/Reusable%20Widget/PrimaryBtnOServices.dart';



class ComprehensiveHelpWidget extends StatelessWidget {
  const ComprehensiveHelpWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobile = screenWidth < 800;
    final bool isTiny = screenWidth < 300;

    return Container(
      width: double.infinity,
      color: AppColors.whiteColor,
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: isMobile ? 0 : 1,
            child: Stack(
              children: [

                Positioned.fill(
                  child:  SvgPicture.asset(
                    ImageString.background,
                    fit: BoxFit.cover,
                  ),

                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 20 : 60,
                    vertical: 40,
                  ),
                  child: Column(
                    crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.directions_car, color: AppColors.primaryColor, size: 24),
                          const SizedBox(width: 10),
                          Text(
                            "Car Rental",
                            style: TTextTheme.h2Style(context),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(
                        TextString.ServicesComprehensivetitle,
                        textAlign: isMobile ? TextAlign.center : TextAlign.start,
                        style: TTextTheme.h1StylePrimary(context),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        TextString.ServicesComprehensiveSubtitle,
                        textAlign: isMobile ? TextAlign.center : TextAlign.start,
                        style: TTextTheme.bodyRegular16black(context),
                      ),
                      const SizedBox(height: 30),
                      PrimaryBtnOfServices(
                        text: "Visit Now",
                        onTap: () {},
                        width: 100,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: isMobile ? 0 : 1,
            child: SizedBox(
              width: double.infinity,
              height: isMobile ? 300 : 450,
              child: Image.asset(
                ImageString.comprehensiveService,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}