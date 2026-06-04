import 'package:flutter/material.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';

class PrivacyPolicyBodyWidget extends StatelessWidget {
  const PrivacyPolicyBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobileOrTablet = screenWidth < 900;
    final double horizontalPadding = AppSizes.horizontalPadding(context);

    final List<Map<String, dynamic>> privacyPolicies = [
      {
        "title":TextString. privacyPolicySubtitle1 ,
        "intro":TextString. privacyPolicySubtitle2 ,
        "points": [
    TextString. privacyPolicySubtitle3 ,
    TextString. privacyPolicySubtitle4 ,
    TextString. privacyPolicySubtitle5  ,

        ]
      },
      {
        "title":TextString. privacyPolicySubtitle6 ,
        "intro":TextString. privacyPolicySubtitle7 ,
        "points": [
      TextString. privacyPolicySubtitle8,
      TextString. privacyPolicySubtitle9  ,
      TextString. privacyPolicySubtitle10  ,
      TextString. privacyPolicySubtitle11  ,
        ]
      },
      {
        "title":TextString. privacyPolicySubtitle12,
        "intro": null,
        "points": [
      TextString. privacyPolicySubtitle13,
          TextString. privacyPolicySubtitle14,
          TextString. privacyPolicySubtitle15

        ]
      },
      {
        "title":TextString. privacyPolicySubtitle16,
        "intro": null,
        "isSpecial": true,
        "points": [
          TextString. privacyPolicySubtitle17,
        ],
        "specialText":TextString. privacyPolicySubtitle18 ,
        "specialPoints": [
          TextString. privacyPolicySubtitle19
          ,
          TextString. privacyPolicySubtitle20
        ]
      },
      {
        "title":  TextString. privacyPolicySubtitle21,
        "intro": null,
        "points": [
      TextString. privacyPolicySubtitle22 ,
          TextString. privacyPolicySubtitle23 ,
      TextString. privacyPolicySubtitle24

        ]
      },
      {
        "title": TextString. privacyPolicySubtitle25 ,
        "intro": null,
        "points": [
          TextString. privacyPolicySubtitle26,
          TextString. privacyPolicySubtitle27

        ]
      },
      {
        "title":  TextString. privacyPolicySubtitle28 ,
        "intro": null,
        "points": [
      TextString. privacyPolicySubtitle29 ,
          TextString. privacyPolicySubtitle29
         ,
          TextString. privacyPolicySubtitle30
        ]
      },
      {
        "title":  TextString. privacyPolicySubtitle31 ,
        "intro": null,
        "points": [
          TextString. privacyPolicySubtitle32 ,
          TextString. privacyPolicySubtitle33

        ]
      },
      {
        "title": TextString. privacyPolicySubtitle35 ,
        "intro": null,
        "points": [
          TextString. privacyPolicySubtitle36,
          TextString. privacyPolicySubtitle37

        ]
      },
      {
        "title":TextString. privacyPolicySubtitle38 ,
        "intro":TextString. privacyPolicySubtitle39 ,
        "points": [
      TextString. privacyPolicySubtitle40 ,
      TextString. privacyPolicySubtitle41 ,
          TextString. privacyPolicySubtitle42 ,
          TextString. privacyPolicySubtitle33

        ]
      },
      {
        "title": TextString. privacyPolicySubtitle44 ,
        "intro": null,
        "points": [
          TextString. privacyPolicySubtitle45
        ]
      },
      {
        "title":TextString. privacyPolicySubtitle46,
        "intro": null,
        "points": [
          TextString. privacyPolicySubtitle47
          ,
          TextString. privacyPolicySubtitle48
        ]
      },
    ];

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
      TextString. privacyPolicySubtitle49,
            style: TTextTheme.h1StyleBlack(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 650),
            child: Text(
                TextString. privacyPolicySubtitle50,
              style: TTextTheme.bodyRegular16black(context),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),
          ...privacyPolicies.map((policy) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      policy["title"],
                      style: TTextTheme.h5Style(context),
                    ),
                    if (policy["intro"] != null) ...[
                      const SizedBox(height: 12),
                      Text(
                        policy["intro"],
                        style: TTextTheme.tableRegular18(context).copyWith(fontSize: 14, color: Colors.black87),
                      ),
                    ],

                    const SizedBox(height: 12),

                    ...List.generate(policy["points"].length, (index) {
                      return _buildPolicyBulletPoint(context, policy["points"][index]);
                    }),
                    if (policy["isSpecial"] == true) ...[
                      const SizedBox(height: 12),
                      Text(
                        policy["specialText"],
                        style: TTextTheme.tableRegular18(context).copyWith(
                            fontSize: 14,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      const SizedBox(height: 6),
                      ...List.generate(policy["specialPoints"].length, (spIndex) {
                        return Padding(
                          padding: const EdgeInsets.only(left: 16, right: 4),
                          child: Text(
                            policy["specialPoints"][spIndex],
                            style: TTextTheme.tableRegular18(context).copyWith(fontSize: 13, color: Colors.grey[600]),
                          ),
                        );
                      }),
                    ]
                  ],
                ),
              ),
            );
          }),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
              TextString. privacyPolicySubtitle51 ,
                  style: TTextTheme.h5Style(context),
                ),
                const SizedBox(height: 12),
                Text(
                  TextString. privacyPolicySubtitle52 ,
                  style: TTextTheme.tableRegular18(context).copyWith(fontSize: 14, color: Colors.black87),
                ),
                const SizedBox(height: 12),

                _buildContactRowItem(
                    context,
                    icon: Icons.phone,
                    label:TextString. privacyPolicySubtitle53 ,
                    value: TextString. privacyPolicySubtitle54
                ),

                _buildContactRowItem(
                    context,
                    icon: Icons.email,
                    label:TextString. privacyPolicySubtitle55 ,
                    value: TextString. privacyPolicySubtitle56
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// --------- Internal Architecture Custom Sub Helpers ------- ///


  Widget _buildPolicyBulletPoint(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 8, right: 10),
            width: 6,
            height: 6,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
              shape: BoxShape.circle,
            ),
          ),
          Expanded(
            child: Text(
              text,
              style: TTextTheme.tableRegular18(context).copyWith(fontSize: 14, height: 1.5, color: Colors.black87),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactRowItem(BuildContext context, {required IconData icon, Brewery, required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, size: 16, color: Colors.black54),
          const SizedBox(width: 8),
          Text(
            label,
            style: TTextTheme.tableRegular18(context).copyWith(fontSize: 14, color: Colors.black87),
          ),
          Text(
            value,
            style: TTextTheme.tableRegular18(context).copyWith(
                fontSize: 14,
                color: AppColors.primaryColor,
                fontWeight: FontWeight.w500
            ),
          ),
        ],
      ),
    );
  }
}