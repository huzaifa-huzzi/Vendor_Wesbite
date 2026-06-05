import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/AppBars/AppDrawer.dart';
import 'package:vendor_website/AppBars/WebAppBar.dart';
import 'package:vendor_website/Vendor/FooterSection/HelpCenter/HelpCenterController.dart';
import 'package:vendor_website/Vendor/FooterSection/HelpCenter/Reusable%20Widget/ContactHelpCard.dart';
import 'package:vendor_website/Vendor/FooterSection/HelpCenter/Reusable%20Widget/MainFooterHelpWidget.dart';
import 'package:vendor_website/Vendor/FooterSection/HelpCenter/Reusable%20Widget/NewsLetterHelpWidget.dart';
import 'package:vendor_website/Vendor/FooterSection/HelpCenter/TroubleShooting/Widget/DetailTroubleShootingGuide.dart';
import 'package:vendor_website/Vendor/FooterSection/HelpCenter/TroubleShooting/Widget/GettingStartedTroubleShooting.dart';

class TroubleShooting extends StatelessWidget {
  const TroubleShooting({super.key});

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
            DetailTroubleShootingGuide(),
            SizedBox(height: 40,),
            SizedBox(height: 80,),
            GettingStartedTroubleShooting(),
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
