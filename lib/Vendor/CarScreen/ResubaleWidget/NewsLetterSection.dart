import 'package:flutter/material.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/CarScreen/ResubaleWidget/PrimaryBtnOfCar.dart';

class NewsletterSectionWidget extends StatelessWidget {
  const NewsletterSectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool useDesktopLayout = screenWidth > 950;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.horizontalPadding(context),
        vertical: 60,
      ),
      color: AppColors.whiteColor,
      child: useDesktopLayout
          ? Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildNewsletterText(context),
          Flexible(child: _buildNewsletterInput(context)),
        ],
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNewsletterText(context),
          const SizedBox(height: 30),
          _buildNewsletterInput(context),
        ],
      ),
    );
  }


      /// Extra Widgets
  Widget _buildNewsletterInput(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Wrap(
      spacing: 15,
      runSpacing: 15,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: [
        SizedBox(
          width: screenWidth < 400 ? screenWidth * 0.8 : 350,
          height: 50,
          child: TextField(
            cursorColor: AppColors.blackColor,
            style: TTextTheme.textFieldWrittenText(context),
            decoration: InputDecoration(
              hintText: "Enter your email",
              hintStyle: TTextTheme.bodyRegular16secondary(context),
              filled: true,
              fillColor: AppColors.whiteColor,
              contentPadding: const EdgeInsets.symmetric(horizontal: 20),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: AppColors.quadrantalTextColor.withOpacity(0.7)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide:
                const BorderSide(color: AppColors.primaryColor, width: 1.5),
              ),
            ),
          ),
        ),
        PrimaryBtnOfCar(
          text: "Subscribe",
          onTap: () {},
          height: 50,
          width: 120,
          borderRadius: BorderRadius.circular(8),
        ),
      ],
    );
  }
  Widget _buildNewsletterText(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            TextString.newsLetterTitle,
            style: TTextTheme.hNews(context)
        ),
        const SizedBox(height: 10),
        Text(
          TextString.newsLetterSubtitle,
          style: TTextTheme.medium16black(context),
        ),
      ],
    );
  }
}