import 'package:flutter/material.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/ImageString.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';

class QuestionBanner extends StatelessWidget {
  const QuestionBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    bool isMobile = width < 900;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
          vertical: isMobile ? 40 : 60,
          horizontal: width > 1200 ? 100 : 20
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        image: DecorationImage(
          image: AssetImage(ImageString.serviceTyre),
          fit: BoxFit.cover,
          alignment: Alignment.centerLeft,
        ),
      ),
      child: isMobile
          ? Column(children: _buildContent(context, true))
          : Row(children: _buildContent(context, false)),
    );
  }

  /// ------- Extra Widget -----///

   // Build Content
  List<Widget> _buildContent(BuildContext context, bool isMobile) {
    return [
      Expanded(
        flex: isMobile ? 0 : 1,
        child: Column(
          crossAxisAlignment: isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: isMobile ? MainAxisAlignment.center : MainAxisAlignment.start,
              children: [
                const Icon(Icons.directions_car, color: AppColors.primaryColor, size: 24),
                const SizedBox(width: 10),
                 Text("Car Rental", style: TTextTheme.h2Style(context)),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              TextString.stillQuestion,
              textAlign: isMobile ? TextAlign.center : TextAlign.start,
              style: TTextTheme.h1StylePrimary(context),
            ),
            const SizedBox(height: 15),
            Text(
             TextString.stillQuestionSubtitle,
              textAlign: isMobile ? TextAlign.center : TextAlign.start,
              style: TTextTheme.bodyRegular16black(context),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child:  Text("Visit Our Office", style: TTextTheme.btnTwo(context).copyWith(color: AppColors.whiteColor)),
            ),
          ],
        ),
      ),

      if (isMobile) const SizedBox(height: 40),
      Expanded(
        flex: isMobile ? 0 : 1,
        child: Container(
          constraints: BoxConstraints(maxHeight: isMobile ? 250 : 400),
          child: Image.asset(
            ImageString.bannerPics,
            fit: BoxFit.contain,
          ),
        ),
      ),
    ];
  }
}