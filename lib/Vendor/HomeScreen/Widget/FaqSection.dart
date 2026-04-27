import 'package:flutter/material.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';

class FAQsSection extends StatelessWidget {
  const FAQsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = AppSizes.isWeb(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.horizontalPadding(context),
        vertical: 80,
      ),
      color: AppColors.backgroundOfScreenColor,
      child: isDesktop
          ? Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 1, child: _buildFAQHeader(context)),
          const SizedBox(width: 50),
          Expanded(flex: 1, child: _buildFAQList(context)),
        ],
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFAQHeader(context),
          const SizedBox(height: 40),
          _buildFAQList(context),
        ],
      ),
    );
  }


     /// --------- Extra Widget -------///

  //  Title
  Widget _buildFAQHeader(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          TextString.faqTitle,
          style: TTextTheme.h1StyleBlack(context),
        ),
        const SizedBox(height: 20),
        Text(
          TextString.faqSubtitle,
          style: TTextTheme.medium16black(context),
        ),
      ],
    );
  }

  //  FAQ
  Widget _buildFAQList(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.signaturePadColor),
      ),
      child: Column(
        children: [
          _buildFAQItem(
            context,
            TextString.faqTitle1,
            TextString.faqSubtitle1,
            isFirst: true,
          ),
          _buildFAQItem(
            context,
            TextString.faqTitle2,
            TextString.faqSubtitle2,
          ),
          _buildFAQItem(
            context,
            TextString.faqTitle3,
            TextString.faqSubtitle3,
          ),
          _buildFAQItem(
            context,
            TextString.faqTitle4,
            TextString.faqSubtitle4,
            isLast: true,
          ),
        ],
      ),
    );
  }

  // FAQ Expansion Tile
  Widget _buildFAQItem(
      BuildContext context,
      String question,
      String answer,
      {bool isFirst = false, bool isLast = false}
      ) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: Column(
        children: [
          ExpansionTile(
            title: Text(
              question,
              style: TTextTheme.h5Style(context),
            ),
            childrenPadding: const EdgeInsets.fromLTRB(16, 0, 16, 20),
            iconColor: AppColors.primaryColor,
            collapsedIconColor: AppColors.primaryColor,
            trailing: const Icon(Icons.add),
            children: [
              Text(
                answer,
                style: TTextTheme.bodyRegular16(context),
              ),
            ],
          ),
          if (!isLast)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Divider(color: AppColors.blackColor.withOpacity(0.1), height: 1),
            ),
        ],
      ),
    );
  }
}