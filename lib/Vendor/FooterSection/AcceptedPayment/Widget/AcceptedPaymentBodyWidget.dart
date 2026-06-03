import 'package:flutter/material.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';

class AcceptedPaymentBodyWidget extends StatelessWidget {
  const AcceptedPaymentBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isMobileOrTablet = screenWidth < 900;
    final double cardWidth = isMobileOrTablet ? double.infinity : (screenWidth - AppSizes.horizontalPadding(context) * 2 - 20) / 2;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.horizontalPadding(context),
        vertical: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
        TextString.AcceptedPaymentSubtitle1,
            style: TTextTheme.h1StyleBlack(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            TextString.AcceptedPaymentSubtitle2,
            style: TTextTheme.bodyRegular16black(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),
          _buildMainSectionHeader(context,TextString.AcceptedPaymentSubtitle3,TextString.AcceptedPaymentSubtitle4 ),
          const SizedBox(height: 15),

          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              _buildInstructionCard(
                context,
                width: cardWidth,
                title:TextString.AcceptedPaymentSubtitle5 ,
                subtitle:TextString.AcceptedPaymentSubtitle6 ,
                points: [
                TextString.AcceptedPaymentSubtitle7,
                TextString.AcceptedPaymentSubtitle8 ,
                TextString.AcceptedPaymentSubtitle9 ,
                TextString.AcceptedPaymentSubtitle10 ,
                  TextString.AcceptedPaymentSubtitle11 ,
                ],
              ),
              _buildInstructionCard(
                context,
                width: cardWidth,
                title: TextString.AcceptedPaymentSubtitle12 ,
                subtitle: TextString.AcceptedPaymentSubtitle13 ,
                points: [
                TextString.AcceptedPaymentSubtitle14 ,
                TextString.AcceptedPaymentSubtitle15,
                TextString.AcceptedPaymentSubtitle16 ,
                  TextString.AcceptedPaymentSubtitle17,
                ],
              ),
            ],
          ),

          const SizedBox(height: 40),
          _buildMainSectionHeader(context,TextString.AcceptedPaymentSubtitle18 ,TextString.AcceptedPaymentSubtitle19 ),
          const SizedBox(height: 15),

          Wrap(
            spacing: 20,
            runSpacing: 20,
            children: [
              _buildInstructionCard(
                context,
                width: cardWidth,
                title:TextString.AcceptedPaymentSubtitle20 ,
                subtitle:TextString.AcceptedPaymentSubtitle21 ,
                points: [
                TextString.AcceptedPaymentSubtitle22,
                TextString.AcceptedPaymentSubtitle23,
                TextString.AcceptedPaymentSubtitle24,
                TextString.AcceptedPaymentSubtitle25,
                  TextString.AcceptedPaymentSubtitle26 ,
                ],
              ),
              // Pay ID Receipt Card
              _buildInstructionCard(
                context,
                width: cardWidth,
                title: TextString.AcceptedPaymentSubtitle27 ,
                subtitle: TextString.AcceptedPaymentSubtitle28 ,
                points: [
                TextString.AcceptedPaymentSubtitle29,
                TextString.AcceptedPaymentSubtitle30,
                TextString.AcceptedPaymentSubtitle31 ,
                  TextString.AcceptedPaymentSubtitle32,
                ],
              ),
            ],
          ),

          const SizedBox(height: 60),
          Text(
              TextString.AcceptedPaymentSubtitle33,
            style: TTextTheme.h1StyleBlack(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
              TextString.AcceptedPaymentSubtitle34,
            style: TTextTheme.bodyRegular16black(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
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
                TextString.AcceptedPaymentSubtitle35,
                  style: TTextTheme.h5Style(context),
                ),
                const SizedBox(height: 15),
                _buildBulletPoint(context,TextString.bulletPoint1),
                _buildBulletPoint(context,TextString.bulletPoint2 ),
                _buildBulletPoint(context,TextString.bulletPoint3 ),
                _buildBulletPoint(context,TextString.bulletPoint4 ),
                _buildBulletPoint(context,TextString.bulletPoint5 ),
                _buildBulletPoint(context,TextString.bulletPoint6),
                _buildBulletPoint(context,TextString.bulletPoint7),
                _buildBulletPoint(context,TextString.bulletPoint8),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// --------- Extra Helper Widgets ------- ///

  // Main Section Container Header
  Widget _buildMainSectionHeader(BuildContext context, String title, String subtitle) {
    return Container(
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
            title,
            style: TTextTheme.h5Style(context),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: TTextTheme.tableRegular18(context).copyWith(fontSize: 14, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }

  // Side-by-Side Sub Instruction Card
  Widget _buildInstructionCard(
      BuildContext context, {
        required double width,
        required String title,
        required String subtitle,
        required List<String> points,
      }) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TTextTheme.h2PrimaryStyle(context),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TTextTheme.tableRegular18(context).copyWith(fontSize: 13, color: Colors.grey[500]),
          ),
          const SizedBox(height: 20),
          ...points.map((point) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              point,
              style: TTextTheme.tableRegular18(context).copyWith(fontSize: 14, height: 1.4),
            ),
          )),
        ],
      ),
    );
  }

  // Bullet Point
  Widget _buildBulletPoint(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
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
              style: TTextTheme.tableRegular18(context).copyWith(fontSize: 14, height: 1.5),
            ),
          ),
        ],
      ),
    );
  }
}