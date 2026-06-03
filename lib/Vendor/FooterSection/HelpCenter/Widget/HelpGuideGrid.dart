import 'package:flutter/material.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/TextTheme.dart';

class HelpGuidesGrid extends StatelessWidget {
  const HelpGuidesGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isTiny = screenWidth <= 300;

    final List<Map<String, dynamic>> helpGuidesData = [
      {
        "number": "01",
        "title": "Renting Guide",
        "desc": "Everything you need to bring to the office - ID/License, payment methods, and international permits",
      },
      {
        "number": "02",
        "title": "Required Document",
        "desc": "Everything you need to bring to the office - ID/License, payment methods, and international permits",
      },
      {
        "number": "03",
        "title": "Pricing & Billing",
        "desc": "Understand your rental costs upfront with transparent pricing and smooth, secure payment processing.",
      },
      {
        "number": "04",
        "title": "Troubleshooting",
        "desc": "Quickly resolve issues with step-by-step guidance and helpful solutions to keep your rental experience smooth.",
      },
      {
        "number": "05",
        "title": "Pickup and Return",
        "desc": "Efficient vehicle handover with flexible pickup and return options for both customers and providers, designed for maximum convenience.",
      },
      {
        "number": "06",
        "title": "Insurance and Coverage",
        "desc": "Stay protected with comprehensive insurance coverage, ensuring peace of mind throughout your rental journey.",
      },
    ];

    return Container(
      width: double.infinity,
      color: AppColors.backgroundOfScreenColor,
      padding: EdgeInsets.symmetric(
        vertical: isTiny ? 20 : 60,
        horizontal: isTiny ? 10 : 20,
      ),
      child: Column(
        children: [
          Text(
            "How Can We Help You",
            textAlign: TextAlign.center,
            style: TTextTheme.h1StyleBlack(context),
          ),
          const SizedBox(height: 15),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Text(
              "Search our guides or browse categories below to find step by step guide and answers",
              textAlign: TextAlign.center,
              style: TTextTheme.medium16black(context),
            ),
          ),
          const SizedBox(height: 50),
          Wrap(
            spacing: 25,
            runSpacing: 25,
            alignment: WrapAlignment.center,
            children: helpGuidesData.map((data) {
              return _buildHelpCard(
                context,
                number: data["number"],
                title: data["title"],
                desc: data["desc"],
                isTiny: isTiny,
                onTap: () {

                },
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  /// ---------- Responsive Help Card Widget Without Images -------- ///
  Widget _buildHelpCard(
      BuildContext context, {
        required String number,
        required String title,
        required String desc,
        required bool isTiny,
        required VoidCallback onTap,
      }) {
    final screenWidth = MediaQuery.of(context).size.width;
    double cardWidth;
    if (screenWidth > 1200) {
      cardWidth = (screenWidth / 3) - 60;
    } else if (screenWidth > 700) {
      cardWidth = (screenWidth / 2) - 50;
    } else {
      cardWidth = screenWidth - 40;
    }

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        width: cardWidth,
        constraints: const BoxConstraints(minWidth: 300),
        padding: EdgeInsets.all(isTiny ? 20 : 30),
        decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.tertiaryTextColor.withOpacity(0.15)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.02),
                blurRadius: 10,
                offset: const Offset(0, 4),
              )
            ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              number,
              style: TTextTheme.numbering(context).copyWith(
                color: AppColors.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),

            Text(
              title,
              style: TTextTheme.h5Style(context).copyWith(
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              desc,
              style: TTextTheme.bodyRegular16(context).copyWith(
                color: AppColors.tertiaryTextColor,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "View Details",
                  style: TTextTheme.bodyRegular16(context).copyWith(
                    color: AppColors.primaryColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.arrow_forward,
                  size: 16,
                  color: AppColors.primaryColor,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}