import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/AppBars/AppDrawer.dart';
import 'package:vendor_website/AppBars/WebAppBar.dart';
import 'package:vendor_website/Vendor/FooterSection/HelpCenter/HelpCenterController.dart';
import 'package:vendor_website/Vendor/FooterSection/HelpCenter/Insurance/Widget/DetailGuideInsurance.dart';
import 'package:vendor_website/Vendor/FooterSection/HelpCenter/Insurance/Widget/GettingStartedInsurance.dart';
import 'package:vendor_website/Vendor/FooterSection/HelpCenter/Reusable%20Widget/ContactHelpCard.dart';
import 'package:vendor_website/Vendor/FooterSection/HelpCenter/Reusable%20Widget/MainFooterHelpWidget.dart';
import 'package:vendor_website/Vendor/FooterSection/HelpCenter/Reusable%20Widget/NewsLetterHelpWidget.dart';

class Insurance extends StatelessWidget {
  const Insurance({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HelpCenterController());
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            WebAppBar(scaffoldKey: scaffoldKey),
            DetailInsuranceGuide(),
            SizedBox(height: 80,),
            GettingStartedInsurance(),
            SizedBox(height: 50,),
            ContactHelpCard(),
            SizedBox(height: 100,),
            NewsLetterHelpWidget(),
            MainFooterHelpWidget(),


          ],
        ),
      ),
    );
  }
}
