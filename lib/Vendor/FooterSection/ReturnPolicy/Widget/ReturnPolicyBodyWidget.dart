import 'package:flutter/material.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';

class ReturnPolicyBodyWidget extends StatelessWidget {
  const ReturnPolicyBodyWidget({super.key});

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
            TextString.returnSubtitle1,
            style: TTextTheme.h1StyleBlack(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
              TextString.returnSubtitle2,
            style: TTextTheme.bodyRegular16black(context),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 40),

          _buildPolicyCard(
            context,
            title:  TextString.returnSubtitle3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(TextString.wesbiteUsage, style: _bodyStyle(context)),
                const SizedBox(height: 12),
                _buildRedTitleText(context, TextString.returnSubtitle4 ),
                _buildBulletPoint(context,  TextString.returnSubtitle5),
                const SizedBox(height: 8),
                _buildRedTitleText(context,  TextString.returnSubtitle6),
                _buildBulletPoint(context,  TextString.returnSubtitle7),
                const SizedBox(height: 8),
                _buildRedTitleText(context, TextString.returnSubtitle8),
                _buildBulletPoint(context,  TextString.returnSubtitle9),
              ],
            ),
          ),
          _buildPolicyCard(
            context,
            title: TextString.returnSubtitle10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context,TextString.returnSubtitle11 ),
                _buildBulletPoint(context,TextString.returnSubtitle12 ),
                _buildBulletPoint(context, TextString.returnSubtitle13),
              ],
            ),
          ),

          // 3. Vehicle Pickup
          _buildPolicyCard(
            context,
            title: TextString.returnSubtitle14 ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, TextString.returnSubtitle15 ),
                _buildBulletPoint(context, TextString.returnSubtitle16 ),
              ],
            ),
          ),
          _buildPolicyCard(
            context,
            title: TextString.returnSubtitle17,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, TextString.returnSubtitle18 ),
                _buildBulletPoint(context, TextString.returnSubtitle19 ),
                const SizedBox(height: 10),
                _buildRedTitleText(context, TextString.returnSubtitle20 ),
                Text( TextString.returnSubtitle21, style: _bodyStyle(context)),
              ],
            ),
          ),

          _buildPolicyCard(
            context,
            title:TextString.returnSubtitle22 ,
            child: _buildBulletPoint(context,TextString.returnSubtitle23 ),
          ),

          // 6. Fuel Policy
          _buildPolicyCard(
            context,
            title:TextString.returnSubtitle24 ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRedTitleText(context,TextString.returnSubtitle25 ),
                _buildBulletPoint(context,TextString.returnSubtitle26 ),
                _buildBulletPoint(context, TextString.returnSubtitle27),
              ],
            ),
          ),
          _buildPolicyCard(
            context,
            title:TextString.returnSubtitle28 ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context,TextString.returnSubtitle29),
                _buildBulletPoint(context, TextString.returnSubtitle30),
              ],
            ),
          ),

          // 8. Extensions
          _buildPolicyCard(
            context,
            title:TextString.returnSubtitle31 ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context,TextString.returnSubtitle32 ),
                _buildBulletPoint(context, TextString.returnSubtitle33),
              ],
            ),
          ),
          _buildPolicyCard(
            context,
            title: TextString.returnSubtitle34 ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, TextString.returnSubtitle35),
                _buildBulletPoint(context, TextString.returnSubtitle36 ),
                _buildBulletPoint(context, TextString.returnSubtitle37 ),
              ],
            ),
          ),
          _buildPolicyCard(
            context,
            title:TextString.returnSubtitle38 ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context,TextString.returnSubtitle39 ),
                _buildBulletPoint(context,TextString.returnSubtitle40 ),
                const SizedBox(height: 10),
                _buildRedTitleText(context,TextString.returnSubtitle41 ),
                _buildNumberedPoint(context, "1",TextString.returnSubtitle42),
                _buildNumberedPoint(context, "2",TextString.returnSubtitle43 ),
                _buildNumberedPoint(context, "3",TextString.returnSubtitle44 ),
              ],
            ),
          ),
          _buildPolicyCard(
            context,
            title:TextString.returnSubtitle45 ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context,TextString.returnSubtitle46 ),
                _buildBulletPoint(context,TextString.returnSubtitle47 ),
                _buildBulletPoint(context, TextString.returnSubtitle48),
              ],
            ),
          ),
          _buildPolicyCard(
            context,
            title:TextString.returnSubtitle49 ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context,TextString.returnSubtitle50),
                _buildBulletPoint(context, TextString.returnSubtitle51),
              ],
            ),
          ),
          _buildPolicyCard(
            context,
            title:TextString.returnSubtitle52 ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context,TextString.returnSubtitle53 ),
                const SizedBox(height: 10),
                _buildRedTitleText(context,TextString.returnSubtitle54 ),
                _buildNumberedPoint(context, "1",TextString.returnSubtitle55 ),
                _buildNumberedPoint(context, "2",TextString.returnSubtitle55 ),
                _buildNumberedPoint(context, "3",TextString.returnSubtitle56 ),
              ],
            ),
          ),
          _buildPolicyCard(
            context,
            title:TextString.returnSubtitle57 ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context,TextString.returnSubtitle58),
                _buildBulletPoint(context,TextString.returnSubtitle59 ),
                _buildBulletPoint(context,TextString.returnSubtitle60 ),
              ],
            ),
          ),
          _buildPolicyCard(
            context,
            title:TextString.returnSubtitle61 ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context,TextString.returnSubtitle62 ),
                _buildBulletPoint(context,TextString.returnSubtitle63 ),
              ],
            ),
          ),
          _buildPolicyCard(
            context,
            title:TextString.returnSubtitle64,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context, TextString.returnSubtitle65),
                _buildBulletPoint(context,TextString.returnSubtitle66 ),
              ],
            ),
          ),
          _buildPolicyCard(
            context,
            title: TextString.returnSubtitle67,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBulletPoint(context,TextString.returnSubtitle68 ),
                _buildBulletPoint(context,TextString.returnSubtitle69 ),
              ],
            ),
          ),

          // 18. Emergency & Support
          _buildPolicyCard(
            context,
            title:TextString.returnSubtitle71 ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(TextString.returnSubtitle72, style: _bodyStyle(context)),
                const SizedBox(height: 10),
                Row(
                  children: [
                    const Icon(Icons.phone, color: AppColors.primaryColor, size: 18),
                    const SizedBox(width: 8),
                    _buildRedTitleText(context, TextString.phone),
                    Text(TextString.returnSubtitle73, style: _bodyStyle(context)),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    const Icon(Icons.email, color: AppColors.primaryColor, size: 18),
                    const SizedBox(width: 8),
                    _buildRedTitleText(context, TextString.Email),
                    Text(TextString.CompanyEmail, style: _bodyStyle(context)),
                  ],
                ),
              ],
            ),
          ),

          // 19. Company Rights
          _buildPolicyCard(
            context,
            title:TextString.returnSubtitle74 ,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(TextString.returnSubtitle75, style: _bodyStyle(context)),
                const SizedBox(height: 8),
                _buildBulletPoint(context,TextString.returnSubtitle76 ),
                _buildBulletPoint(context,TextString.returnSubtitle77),
              ],
            ),
          ),
        ],
      ),
    );
  }

   /// --------- Extra Widget ------- ///

  // policy Card
  Widget _buildPolicyCard(BuildContext context, {required String title, required Widget child}) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 25),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color:AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TTextTheme.h5Style(context)
          ),
          const SizedBox(height: 15),
          child,
        ],
      ),
    );
  }

   // Bullet Point
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

   // Numbered Point
  Widget _buildNumberedPoint(BuildContext context, String number, String text) {
    return Padding(
      padding: const EdgeInsets.only(left: 14, top: 4, bottom: 4),
      child: Text(
        "$number: $text",
        style: _bodyStyle(context).copyWith(color: Colors.grey[700]),
      ),
    );
  }

  Widget _buildRedTitleText(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        text,
        style: TTextTheme.h2PrimaryStyle(context)
      ),
    );
  }

  TextStyle _bodyStyle(BuildContext context) {
    return TTextTheme.tableRegular18(context);
  }
}