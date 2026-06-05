import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/TextString.dart';
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
        "title": TextString.helpCenterSubtitle1,
        "desc": TextString.helpCenterSubtitle2,
        "onTap": () {
           context.go('/rentingGuide');

        },
      },
      {
        "number": "02",
        "title": TextString.helpCenterSubtitle3,
        "desc": TextString.helpCenterSubtitle4,
        "onTap": () {
           context.go('/requiredDocument');
        },
      },
      {
        "number": "03",
        "title": TextString.helpCenterSubtitle5,
        "desc": TextString.helpCenterSubtitle6,
        "onTap": () {
          context.go('/Pricing');
        },
      },
      {
        "number": "04",
        "title": TextString.helpCenterSubtitle7,
        "desc": TextString.helpCenterSubtitle8,
        "onTap": () {
           context.go('/troubleShooting');
        },
      },
      {
        "number": "05",
        "title": TextString.helpCenterSubtitle9,
        "desc": TextString.helpCenterSubtitle10,
        "onTap": () {
          // context.go('/pickup-return');
        },
      },
      {
        "number": "06",
        "title": TextString.helpCenterSubtitle11,
        "desc": TextString.helpCenterSubtitle12,
        "onTap": () {
          // context.go('/insurance-coverage');
        },
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
            TextString.helpCenterSubtitle13,
            textAlign: TextAlign.center,
            style: TTextTheme.h1StyleBlack(context),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 15),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Text(
              TextString.helpCenterSubtitle14,
              textAlign: TextAlign.center,
              style: TTextTheme.medium16black(context),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
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
                onTap: data["onTap"],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  /// ---------- Responsive Help Card Widget (Exact Original Design) -------- ///
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
          ],
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
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 10),
            Text(
              desc,
              style: TTextTheme.bodyRegular16(context).copyWith(
                color: AppColors.tertiaryTextColor,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
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