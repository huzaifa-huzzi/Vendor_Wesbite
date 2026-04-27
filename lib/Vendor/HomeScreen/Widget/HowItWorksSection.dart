import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/IconString.dart';
import 'package:vendor_website/Resources/ImageString.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = AppSizes.isWeb(context);

    return Stack(
      children: [
        Positioned.fill(
          child: Container(
            color: AppColors.backgroundOfScreenColor,
            child: Opacity(
              opacity: 0.5,
              child: SvgPicture.asset(
                ImageString.background,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),

        Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(
            horizontal: AppSizes.horizontalPadding(context),
            vertical: 80,
          ),
          child: Column(
            children: [
              Text(
                TextString.rentACarTitle,
                style: TTextTheme.h4Style(context),
              ),
              const SizedBox(height: 15),
              Text(
                TextString.rentACarSubtitle,
                textAlign: TextAlign.center,
                style: TTextTheme.medium16black(context),
              ),
              const SizedBox(height: 60),
              isDesktop
                  ? Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: _howItWorksSteps(context),
                    ),
                  ),
                  const SizedBox(width: 50),
                  Expanded(
                    flex: 1,
                    child: Image.asset(ImageString.rentImage, fit: BoxFit.contain),
                  ),
                ],
              )
                  : Column(
                children: [
                  ..._howItWorksSteps(context),
                  const SizedBox(height: 40),
                  Image.asset(ImageString.rentImage, fit: BoxFit.contain),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

    /// --------- Extra Widget --------- ///
  //  Steps List Generator
  List<Widget> _howItWorksSteps(BuildContext context) {
    return [
      _buildStepCard(
        context,
        svgPath: IconString.rentSearch,
        title: TextString.rentACarTitle1,
        description: TextString.rentACarSubtitle1,
      ),
      const SizedBox(height: 20),
      _buildStepCard(
        context,
        svgPath: IconString.rentCalendar,
        title: TextString.rentACarTitle2,
        description: TextString.rentACarSubtitle2,
      ),
      const SizedBox(height: 20),
      _buildStepCard(
        context,
        svgPath: IconString.rideIcon,
        title: TextString.rentACarTitle3,
        description: TextString.rentACarSubtitle3,
      ),
    ];
  }

  //  Individual Step Card
  Widget _buildStepCard(
      BuildContext context, {
        required String svgPath,
        required String title,
        required String description,
      }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.fieldsBackground.withOpacity(0.03),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.backgroundOfScreenColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child: SvgPicture.asset(
              svgPath,
              colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
              width: 24,
              height: 24,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TTextTheme.h5Style(context),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TTextTheme.bodyRegular16black(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}