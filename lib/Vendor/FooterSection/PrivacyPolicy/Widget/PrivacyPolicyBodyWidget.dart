import 'package:flutter/material.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
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
        "title": "1. Information We Collect",
        "intro": "We may collect the following information when you interact with our website:",
        "points": [
          "Name",
          "Phone Number",
          "Email Address",
          "Any information you provide through contact forms or inquiries"
        ]
      },
      {
        "title": "2. How We Use Your Information",
        "intro": "Your information is used to:",
        "points": [
          "Respond to your inquiries and requests",
          "Provide details about our car rental services",
          "Communicate regarding bookings made through phone or other channels",
          "Improve our website and customer experience"
        ]
      },
      {
        "title": "3. Website Usage (No Online Booking)",
        "intro": null,
        "points": [
          "This website is for display and informational purposes only.",
          "We do not process bookings or payments directly through the website.",
          "Any information shared is used only for communication and service support."
        ]
      },
      {
        "title": "4. Information Sharing",
        "intro": null,
        "isSpecial": true,
        "points": [
          "We do not sell, trade, or rent your personal information to third parties."
        ],
        "specialText": "Information may only be shared:",
        "specialPoints": [
          "1: When required by law",
          "2: To protect our legal rights"
        ]
      },
      {
        "title": "5. Data Security",
        "intro": null,
        "points": [
          "We implement appropriate measures to protect your personal data.",
          "Access to your information is restricted to authorized personnel only.",
          "However, no online system is completely secure, and we cannot guarantee absolute security."
        ]
      },
      {
        "title": "6. Data Retention",
        "intro": null,
        "points": [
          "We retain your personal information only for as long as necessary to fulfill the purposes outlined in this policy.",
          "Data may be retained for legal, administrative, or security reasons."
        ]
      },
      {
        "title": "7. Cookies & Website Usage",
        "intro": null,
        "points": [
          "Our website may use basic cookies to enhance user experience.",
          "Cookies help us understand how users interact with our website.",
          "You can disable cookies through your browser settings if you prefer."
        ]
      },
      {
        "title": "8. Third-Party Services",
        "intro": null,
        "points": [
          "We may use third-party platforms (such as WhatsApp or email services) to communicate with users.",
          "These platforms have their own privacy policies, and we are not responsible for their practices."
        ]
      },
      {
        "title": "9. Children's Privacy",
        "intro": null,
        "points": [
          "Our services are not intended for individuals under the age of 18.",
          "We do not knowingly collect personal information from children."
        ]
      },
      {
        "title": "10. Your Rights",
        "intro": "You have the right to:",
        "points": [
          "Access your personal information",
          "Request correction of incorrect data",
          "Request deletion of your data",
          "Withdraw consent for communication"
        ]
      },
      {
        "title": "11. Consent",
        "intro": null,
        "points": [
          "By using our website, you agree to this Privacy Policy and its terms."
        ]
      },
      {
        "title": "12. Updates to This Policy",
        "intro": null,
        "points": [
          "We may update this Privacy Policy from time to time.",
          "Any changes will be posted on this page with an updated date."
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
            "All Privacy Polices",
            style: TTextTheme.h1StyleBlack(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 650),
            child: Text(
              "Your privacy is important to us. This policy explains how we collect, use, and protect your information.",
              style: TTextTheme.bodyRegular16black(context).copyWith(fontSize: 14, color: Colors.grey[600]),
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
                  "13. Contact Information",
                  style: TTextTheme.h5Style(context),
                ),
                const SizedBox(height: 12),
                Text(
                  "For any questions or booking inquiries:",
                  style: TTextTheme.tableRegular18(context).copyWith(fontSize: 14, color: Colors.black87),
                ),
                const SizedBox(height: 12),

                _buildContactRowItem(
                    context,
                    icon: Icons.phone,
                    label: "Phone: ",
                    value: "[+6423452134]"
                ),

                _buildContactRowItem(
                    context,
                    icon: Icons.email,
                    label: "Email: ",
                    value: "[softsnip@gmail.com]"
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