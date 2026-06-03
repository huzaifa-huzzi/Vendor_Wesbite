import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/AppBars/AppDrawer.dart';
import 'package:vendor_website/AppBars/WebAppBar.dart';
import 'package:vendor_website/Vendor/FooterSection/HelpCenter/HelpCenterController.dart';
import 'package:vendor_website/Vendor/FooterSection/HelpCenter/Reusable%20Widget/MainFooterHelpWidget.dart';
import 'package:vendor_website/Vendor/FooterSection/HelpCenter/Reusable%20Widget/NewsLetterHelpWidget.dart';
import 'package:vendor_website/Vendor/FooterSection/HelpCenter/Widget/ComprehensiveHelpWidget.dart';
import 'package:vendor_website/Vendor/FooterSection/HelpCenter/Widget/ContactHelpCard.dart';
import 'package:vendor_website/Vendor/FooterSection/HelpCenter/Widget/CustomHelpBanner.dart';
import 'package:vendor_website/Vendor/FooterSection/HelpCenter/Widget/HelpGuideGrid.dart';




class HelpCenterWidget extends StatelessWidget {
  const HelpCenterWidget({super.key});

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
            CustomHelpCenterBanner(),
            SizedBox(height: 40,),
            HelpGuidesGrid(),
            SizedBox(height: 70,),
            ContactHelpCard(),
            SizedBox(height: 60,),
            ComprehensiveHelpWidget(),
            SizedBox(height: 100,),
            NewsLetterHelpWidget(),
            MainFooterHelpWidget(),



          ],
        ),
      ),
    );
  }
}