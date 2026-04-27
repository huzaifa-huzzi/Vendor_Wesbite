import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/IconString.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';

class WhyChooseUsSection extends StatelessWidget {
  const WhyChooseUsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = AppSizes.isWeb(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.horizontalPadding(context),
        vertical: 80,
      ),
      child: Column(
        children: [
          Text(
            TextString.chooseUsTitle,
            style: TTextTheme.h4Style(context),
          ),
          const SizedBox(height: 15),
          Text(
            TextString.chooseUsSubtitle,
            textAlign: TextAlign.center,
            style: TTextTheme.medium16black(context),
          ),
          const SizedBox(height: 60),

          LayoutBuilder(builder: (context, constraints) {
            if (isDesktop) {
              return Wrap(
                spacing: 30,
                runSpacing: 30,
                children: _featureCardsList(context).map((card) => SizedBox(
                  width: (constraints.maxWidth - 30) / 2,
                  child: card,
                )).toList(),
              );
            } else {
              return Column(
                children: _featureCardsList(context).map((card) => Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: card,
                )).toList(),
              );
            }
          }),
        ],
      ),
    );
  }

  /// ---------- Extra Widget --------- ///

  //  List of Cards Data
  List<Widget> _featureCardsList(BuildContext context) {
    return [
      _buildFeatureCard(
        context,
        svgPath: IconString.quality,
        title: TextString.chooseUsTitle1,
        desc: TextString.chooseUsSubtitle1,
      ),
      _buildFeatureCard(
        context,
        svgPath: IconString.rates,
        title: TextString.chooseUsTitle2,
        desc: TextString.chooseUsSubtitle2,
      ),
      _buildFeatureCard(
        context,
        svgPath: IconString.booking,
        title: TextString.chooseUsTitle3,
        desc: TextString.chooseUsSubtitle3,
      ),
      _buildFeatureCard(
        context,
        svgPath: IconString.customer,
        title: TextString.chooseUsTitle4,
        desc: TextString.chooseUsSubtitle4,
      ),
    ];
  }

  //  Individual Card
  Widget _buildFeatureCard(
      BuildContext context, {
        required String svgPath,
        required String title,
        required String desc,
      }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.fieldsBackground.withOpacity(0.02),
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
              borderRadius: BorderRadius.circular(12),
            ),
            child: SvgPicture.asset(
              svgPath,
              colorFilter: const ColorFilter.mode(AppColors.primaryColor, BlendMode.srcIn),
              width: 24,
              height: 24,
              placeholderBuilder: (context) => const Icon(
                Icons.image_not_supported,
                color: AppColors.primaryColor,
                size: 24,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TTextTheme.h5Style(context),
                ),
                const SizedBox(height: 8),
                Text(
                  desc,
                  style: TTextTheme.bodyRegular16black(context),
                  softWrap: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}