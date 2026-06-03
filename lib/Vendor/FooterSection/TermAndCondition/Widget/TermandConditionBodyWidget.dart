import 'package:flutter/material.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';

class TermsAndConditionsBodyWidget extends StatelessWidget {
  const TermsAndConditionsBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: AppSizes.horizontalPadding(context),
        vertical: 30,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text(
            TextString.termAndCondtionSubtitle1,
            style: TTextTheme.h1StyleBlack(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            TextString.termAndCondtionSubtitle1 ,
            style: TTextTheme.bodyRegular16black(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),

          _buildPolicyCard(
            context,
            title:TextString.termAndCondtionSubtitle3 ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle4),
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle5 ),
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle6 ),
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle7),
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle8),
              ],
            ),
          ),

          // 2. Eligibility
          _buildPolicyCard(
            context,
            title:TextString.termAndCondtionSubtitle9 ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle10 ),
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle11),
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle12 ),
              ],
            ),
          ),
          _buildPolicyCard(
            context,
            title:TextString.termAndCondtionSubtitle13 ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle14 ),
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle15 ),
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle16 ),
              ],
            ),
          ),
          _buildPolicyCard(
            context,
            title:TextString.termAndCondtionSubtitle17,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle18),
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle19),
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle20),
              ],
            ),
          ),
          _buildPolicyCard(
            context,
            title:TextString.termAndCondtionSubtitle21 ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle22),
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle23 ),
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle24),
              ],
            ),
          ),
          _buildPolicyCard(
            context,
            title:TextString.termAndCondtionSubtitle25,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle26),
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle27 ),
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle28 ),
              ],
            ),
          ),
          _buildPolicyCard(
            context,
            title:TextString.termAndCondtionSubtitle29,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle30 ),
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle31 ),
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle32),
              ],
            ),
          ),
          _buildPolicyCard(
            context,
            title:TextString.termAndCondtionSubtitle33 ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle34),
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle35 ),
              ],
            ),
          ),
          _buildPolicyCard(
            context,
            title:TextString.termAndCondtionSubtitle36 ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle37 ),
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle38 ),
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle39 ),
              ],
            ),
          ),
          _buildPolicyCard(
            context,
            title: TextString.termAndCondtionSubtitle40,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle41),
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle42 ),
              ],
            ),
          ),
          _buildPolicyCard(
            context,
            title: TextString.termAndCondtionSubtitle43,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle44 ),
                _buildBulletPoint(context, TextString.termAndCondtionSubtitle45),
              ],
            ),
          ),
          _buildPolicyCard(
            context,
            title:TextString.termAndCondtionSubtitle47 ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle48 ),
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle49 ),
              ],
            ),
          ),
          _buildPolicyCard(
            context,
            title:TextString.termAndCondtionSubtitle50 ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle51),
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle52 ),
              ],
            ),
          ),
          _buildPolicyCard(
            context,
            title:TextString.termAndCondtionSubtitle53 ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle54 ),
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle55),
              ],
            ),
          ),
          _buildPolicyCard(
            context,
            title:TextString.termAndCondtionSubtitle56 ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(TextString.termAndCondtionSubtitle57, style: _bodyStyle(context)),
                const SizedBox(height: 8),
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle58 ),
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle59 ),
                _buildBulletPoint(context,TextString.termAndCondtionSubtitle60 ),
              ],
            ),
          ),
          _buildPolicyCard(
            context,
            title:TextString.termAndCondtionSubtitle61 ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(TextString.termAndCondtionSubtitle62, style: _bodyStyle(context)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.phone, color: AppColors.primaryColor, size: 18),
                    const SizedBox(width: 8),
                    _buildRedTitleText(context,TextString.phone),
                    Text( TextString.returnSubtitle73, style: _bodyStyle(context)),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.email, color: AppColors.primaryColor, size: 18),
                    const SizedBox(width: 8),
                    _buildRedTitleText(context, TextString.email),
                    Text(TextString.CompanyEmail, style: _bodyStyle(context)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// --------- Extra Components Helper Widgets ------- ///

  // Policy Card Wrapper
  Widget _buildPolicyCard(BuildContext context, {required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 25),
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
          const SizedBox(height: 15),
          child,
        ],
      ),
    );
  }

  //  Circular Bullet Point Item
  Widget _buildBulletPoint(BuildContext context, String text) {
    return Padding(
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
              text,
              style: _bodyStyle(context),
            ),
          ),
        ],
      ),
    );
  }

  // Red Inline
  Widget _buildRedTitleText(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        text,
        style: TTextTheme.h2PrimaryStyle(context),
      ),
    );
  }

  TextStyle _bodyStyle(BuildContext context) {
    return TTextTheme.tableRegular18(context);
  }
}