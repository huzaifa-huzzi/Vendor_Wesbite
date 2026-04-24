import 'package:flutter/material.dart';

import '../../../../Resources/AppColors.dart';
import '../../../../Resources/ImageString.dart';
import '../../../../Resources/TextTheme.dart';


class CTASectionWidget extends StatelessWidget {
  const CTASectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery
        .of(context)
        .size
        .width < 900;
    final screenWidth = MediaQuery
        .of(context)
        .size
        .width;
    double leftGridHeight = isMobile ? 350 : 380;

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.zero,
      child: Flex(
        direction: isMobile ? Axis.vertical : Axis.horizontal,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: isMobile ? double.infinity : screenWidth * 0.45,
            height: leftGridHeight,
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: _buildGridImage(ImageString.carLeft1),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: Column(
                    children: [
                      Expanded(child: _buildGridImage(ImageString.carRight1)),
                      const SizedBox(height: 8),
                      Expanded(child: _buildGridImage(ImageString.carRight2)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: isMobile ? 0 : 1,
            child: Container(
              height: isMobile ? null : leftGridHeight,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
                vertical: isMobile ? 30 : 0,
              ),
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    right: -screenWidth * 0.08,
                    bottom: -80,
                    child: Image.asset(
                      ImageString.carTyre,
                      width: 800,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: isMobile ? Alignment.center : Alignment
                        .centerLeft,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: isMobile
                          ? CrossAxisAlignment.center
                          : CrossAxisAlignment.start,
                      children: [
                        RichText(
                          textAlign: isMobile ? TextAlign.center : TextAlign
                              .start,
                          text: TextSpan(
                            style: TTextTheme.h1StyleBlack(context).copyWith(
                                height: 1.1, letterSpacing: -1.1),
                            children: [
                              const TextSpan(text: "Drive Your "),
                              TextSpan(
                                text: "Perfect Ride",
                                style: TextStyle(
                                  color: AppColors.primaryColor,
                                  fontStyle: FontStyle.italic,
                                  fontSize: isMobile ? 36 : 40,
                                ),
                              ),
                              const TextSpan(text: " Today"),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          "Discover the features, comfort, and performance of this vehicle. Explore the details and get ready for a seamless rental experience.",
                          textAlign: isMobile ? TextAlign.center : TextAlign
                              .start,
                          style: TTextTheme.bodyRegular16(context),
                        ),
                        const SizedBox(height: 25),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            foregroundColor: AppColors.whiteColor,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 32, vertical: 22),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            elevation: 0,
                          ),
                          child: Text(
                            "Visit Our Office",
                            style: TTextTheme.btnTwo(context).copyWith(
                                color: AppColors.whiteColor,
                                fontStyle: FontStyle.normal),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// ---- Extra Widget
  Widget _buildGridImage(String path) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2),
        image: DecorationImage(
          image: AssetImage(path),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}