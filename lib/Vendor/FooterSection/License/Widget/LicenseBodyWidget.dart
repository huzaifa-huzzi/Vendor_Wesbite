import 'package:flutter/material.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';

class BusinessLicenseBodyWidget extends StatelessWidget {
  const BusinessLicenseBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double horizontalPadding = AppSizes.horizontalPadding(context);

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            TextString.licenseSubtitle1,
            style: TTextTheme.h1StyleBlack(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 650),
            child: Text(
              TextString.licenseSubtitle2,
              style: TTextTheme.bodyRegular16black(context),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.check_circle, color: AppColors.completedColor, size: 22),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        TextString.licenseSubtitle3,
                        style: TTextTheme.h5Style(context).copyWith(fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
                _buildColoredMetaLine(context,TextString.licenseSubtitle4 ,TextString.licenseSubtitle5 , labelColor: AppColors.textColor, valueColor: AppColors.completedColor, isBoldValue: true),
                _buildColoredMetaLine(context,TextString.licenseSubtitle6 ,TextString.licenseSubtitle7 , labelColor: AppColors.textColor, valueColor: AppColors.primaryColor),
                _buildColoredMetaLine(context,TextString.licenseSubtitle8 ,TextString.licenseSubtitle9 , labelColor:AppColors.textColor, valueColor: AppColors.primaryColor),
              ],
            ),
          ),
          _buildTextContentCard(
            context,
            title:TextString.licenseSubtitle10 ,
            paragraphs: [
              TextString.licenseSubtitle11,
              TextString.licenseSubtitle12

            ],
          ),
          _buildCustomCardLayout(
            context,
            title:TextString.licenseSubtitle13 ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildColoredMetaLine(context,TextString.licenseSubtitle14 , "[Soft Snip]", labelColor: Colors.black87, valueColor: AppColors.primaryColor),
                _buildColoredMetaLine(context,TextString.licenseSubtitle15 , "[RG#123456]", labelColor: Colors.black87, valueColor: AppColors.primaryColor),
                _buildColoredMetaLine(context,TextString.licenseSubtitle16 , "[Soft Snip]", labelColor: Colors.black87, valueColor: AppColors.primaryColor),
              ],
            ),
          ),
          _buildTextContentCard(
            context,
            title:TextString.licenseSubtitle17 ,
            paragraphs: [
              TextString.licenseSubtitle18,
              TextString.licenseSubtitle19

            ],
          ),
          _buildBulletListCard(
            context,
            title: TextString.licenseSubtitle20 ,
            points: [
            TextString.licenseSubtitle21 ,
              TextString.licenseSubtitle22 ,
              TextString.licenseSubtitle23
            ],
          ),
          _buildBulletListCard(
            context,
            title:TextString.licenseSubtitle24 ,
            points: [
            TextString.licenseSubtitle25 ,
              TextString.licenseSubtitle26 ,
              TextString.licenseSubtitle27

            ],
          ),
          _buildTextContentCard(
            context,
            title:TextString.licenseSubtitle28 ,
            paragraphs: [
              TextString.licenseSubtitle29,
              TextString.licenseSubtitle30

            ],
          ),
          _buildCustomCardLayout(
            context,
            title:   TextString.licenseSubtitle31 ,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Wrap(
                spacing: 30,
                runSpacing: 15,
                children: [
                  _buildActionButtonLink(
                    context,
                    icon: Icons.visibility_outlined,
                    label: "View License",
                    onTap: () {

                    },
                  ),
                  _buildActionButtonLink(
                    context,
                    icon: Icons.file_download_outlined,
                    label: "Download Certificate",
                    onTap: () {

                    },
                  ),
                ],
              ),
            ),
          ),
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
                  TextString.privacyPolicySubtitle51,
                  style: TTextTheme.h5Style(context),
                ),
                const SizedBox(height: 12),
                Text(
                  TextString.privacyPolicySubtitle52,
                  style: TTextTheme.tableRegular18(context).copyWith(fontSize: 14, color: Colors.black87),
                ),
                const SizedBox(height: 12),
                _buildContactRowItem(context, icon: Icons.phone, label: TextString.privacyPolicySubtitle53, value: TextString.privacyPolicySubtitle54),
                _buildContactRowItem(context, icon: Icons.email, label:TextString.privacyPolicySubtitle55, value: TextString.privacyPolicySubtitle56),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// --------- Internal Structural Modular Sub Widgets ------- ///

  Widget _buildCustomCardLayout(BuildContext context, {required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TTextTheme.h5Style(context)),
          const SizedBox(height: 12),
          child,
        ],
      ),
    );
  }

  Widget _buildTextContentCard(BuildContext context, {required String title, required List<String> paragraphs}) {
    return _buildCustomCardLayout(
      context,
      title: title,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: paragraphs.map((text) => Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: Text(
            text,
            style: TTextTheme.tableRegular18(context).copyWith(fontSize: 14, height: 1.5, color: Colors.black87),
          ),
        )).toList(),
      ),
    );
  }
  Widget _buildBulletListCard(BuildContext context, {required String title, required List<String> points}) {
    return _buildCustomCardLayout(
      context,
      title: title,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: points.map((point) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 4),
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
                  point,
                  style: TTextTheme.tableRegular18(context).copyWith(fontSize: 14, height: 1.5, color: Colors.black87),
                ),
              ),
            ],
          ),
        )).toList(),
      ),
    );
  }

  Widget _buildColoredMetaLine(
      BuildContext context,
      String label,
      String value, {
        required Color labelColor,
        required Color valueColor,
        bool isBoldValue = false,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 8),
            width: 5,
            height: 5,
            decoration: const BoxDecoration(color: AppColors.primaryColor, shape: BoxShape.circle),
          ),
          Flexible(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: label,
                    style: TTextTheme.tableRegular18(context).copyWith(fontSize: 14, color: labelColor),
                  ),
                  TextSpan(
                    text: value,
                    style: TTextTheme.tableRegular18(context).copyWith(
                      fontSize: 14,
                      color: valueColor,
                      fontWeight: isBoldValue ? FontWeight.bold : FontWeight.w500,
                    ),
                  ),
                ],
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionButtonLink(BuildContext context, {required IconData icon, required String label, required VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 18, color: AppColors.primaryColor),
          const SizedBox(width: 6),
          Text(
            label,
            style: TTextTheme.tableRegular18(context).copyWith(
              fontSize: 14,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w500,
              decoration: TextDecoration.underline,
              decorationColor: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildContactRowItem(
      BuildContext context, {
        required IconData icon,
        required String label,
        required String value,
      }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 16, color: Colors.black54),
          const SizedBox(width: 8),
          Flexible(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: label,
                    style: TTextTheme.tableRegular18(context).copyWith(fontSize: 14, color: Colors.black87),
                  ),
                  TextSpan(
                    text: value,
                    style: TTextTheme.tableRegular18(context).copyWith(
                      fontSize: 14,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}