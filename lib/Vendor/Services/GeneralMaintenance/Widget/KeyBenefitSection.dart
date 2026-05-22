import 'package:flutter/material.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/ImageString.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';

class KeyBenefitsSection extends StatelessWidget {
  const KeyBenefitsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isMobileOrTablet = screenWidth < 950;
    final bool isTiny = screenWidth <= 300;

    return Container(
      width: double.infinity,
      color: AppColors.backgroundOfScreenColor,
      padding: EdgeInsets.symmetric(
        vertical: isTiny ? 20 : 60,
        horizontal: isTiny ? 15 : 40,
      ),
      child: Column(
        children: [
          Text(
            TextString.tyreKeyBenefitTitle,
            textAlign: TextAlign.center,
            style: TTextTheme.h1StyleBlack(context),
          ),
          const SizedBox(height: 15),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Text(
              TextString.tyreKeyBenefitSubtitle,
              textAlign: TextAlign.center,
              style: TTextTheme.medium16black(context),
            ),
          ),
          const SizedBox(height: 50),
          if (isMobileOrTablet)
            Column(
              children: [
                _buildBenefitsList(context),
                const SizedBox(height: 40),
                _buildBenefitImage(screenWidth),
              ],
            )
          else
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 5,
                  child: _buildBenefitsList(context),
                ),
                const SizedBox(width: 50),
                Expanded(
                  flex: 5,
                  child: _buildBenefitImage(screenWidth),
                ),
              ],
            ),
        ],
      ),
    );
  }

   /// ----------- Extra Widget ------- ///
  // Benefit List
  Widget _buildBenefitsList(BuildContext context) {
    return Column(
      children: [
        _buildBenefitCard(
          context,
          title: "Improved Engine Performance",
          subtitle: "Keep your engine running smoothly and efficiently.",
        ),
        const SizedBox(height: 16),
        _buildBenefitCard(
          context,
          title: "Fuel Efficiency Boost",
          subtitle: "Regular maintenance helps your car save fuel.",
        ),
        const SizedBox(height: 16),
        _buildBenefitCard(
          context,
          title: "Reduced Breakdowns",
          subtitle: "Prevent costly surprises with routine check-ups.",
        ),
        const SizedBox(height: 16),
        _buildBenefitCard(
          context,
          title: "Extended Vehicle Lifespan",
          subtitle: "Proper care keeps your car lasting longer.",
        ),
      ],
    );
  }

   // Benefit Card
  Widget _buildBenefitCard(BuildContext context, {required String title, required String subtitle}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: AppColors.backgroundOfScreenColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Icon(
              Icons.check_box,
              color: AppColors.completedColor,
              size: 20,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TTextTheme.h5Style(context)
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: TTextTheme.bodyRegular16(context).copyWith(
                    color: AppColors.tertiaryTextColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

   // BenefitImage
  Widget _buildBenefitImage(double screenWidth) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Image.asset(
        ImageString.keyBenefitPic,
        width: double.infinity,
        height: screenWidth < 600 ? 250 : 420,
        fit: BoxFit.cover,
      ),
    );
  }
}