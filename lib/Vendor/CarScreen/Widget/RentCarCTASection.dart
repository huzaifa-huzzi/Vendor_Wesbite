import 'package:flutter/material.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/ImageString.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/CarScreen/ResubaleWidget/PrimaryBtnOfCar.dart';

class RentCarCTASection extends StatelessWidget {
  const RentCarCTASection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool useVerticalLayout = screenWidth < 1000;

    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(
        horizontal: AppSizes.horizontalPadding(context),
        vertical: 60,
      ),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: AppColors.fieldsBackground.withOpacity(0.05),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          alignment: Alignment.center,
          children: [
            _buildBackgroundStripes(),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: useVerticalLayout ? 40 : 30,
                horizontal: useVerticalLayout ? 15 : 30,
              ),
              child: useVerticalLayout
                  ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildLeftContentBox(context, true),
                  const SizedBox(height: 20),
                  _buildCenterImages(true),
                  const SizedBox(height: 20),
                  _buildRightContentBox(context, true),
                ],
              )
                  : Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: _buildLeftContentBox(context, false),
                  ),
                  Expanded(
                    flex: 4,
                    child: _buildCenterImages(false),
                  ),
                  Expanded(
                    flex: 3,
                    child: _buildRightContentBox(context, false),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

    /// ---------- Extra Widgets --------- ///
  //  Background Design
  Widget _buildBackgroundStripes() {
    return Positioned.fill(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(2, (index) => Transform.rotate(
          angle: 0.5,
          child: Container(
            width: 60,
            margin: const EdgeInsets.symmetric(horizontal: 15),
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
            ),
          ),
        )),
      ),
    );
  }

  //  Left Side: Question
  Widget _buildLeftContentBox(BuildContext context, bool isMobile) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(screenWidth < 300 ? 12 : 20),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor, width: 2),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            TextString.rentSection,
            textAlign: isMobile ? TextAlign.center : TextAlign.left,
            style: TTextTheme.h6StylePrimary(context),
          ),
          const SizedBox(height: 15),
          FittedBox(
            child: PrimaryBtnOfCar(
              text: "VISIT NOW",
              onTap: () {
              },
              width: 120,
              height: 38,
            ),
          ),
        ],
      ),
    );
  }

  //  Images
  Widget _buildCenterImages(bool isMobile) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Image.asset(
        ImageString.bannerPics,
        fit: BoxFit.contain,
        height: isMobile ? 180 : null,
      ),
    );
  }

  //  Right Side
  Widget _buildRightContentBox(BuildContext context, bool isMobile) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.all(screenWidth < 300 ? 12 : 20),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.primaryColor, width: 2),
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: Text(
        TextString.rentSectionSubtitle,
        textAlign: isMobile ? TextAlign.center : TextAlign.left,
        style: TTextTheme.bannerBlack(context),
      ),
    );
  }
}