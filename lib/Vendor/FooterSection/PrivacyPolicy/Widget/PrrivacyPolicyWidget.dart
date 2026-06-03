import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/AppBars/AppDrawer.dart';
import 'package:vendor_website/AppBars/WebAppBar.dart';
import 'package:vendor_website/Vendor/FooterSection/PrivacyPolicy/PrivacyPolicyController.dart';
import 'package:vendor_website/Vendor/FooterSection/PrivacyPolicy/Reusable%20Widget/MainFooterPolicyWidget.dart';
import 'package:vendor_website/Vendor/FooterSection/PrivacyPolicy/Reusable%20Widget/NewsLetterPolicyWidget.dart';
import 'package:vendor_website/Vendor/FooterSection/PrivacyPolicy/Widget/PrivacyPolicyBodyWidget.dart';
import 'package:vendor_website/Vendor/FooterSection/PrivacyPolicy/Widget/customPolicyBanner.dart';





class PrivacyPolicyWidget extends StatelessWidget {
  const PrivacyPolicyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PrivacyPolicyController());
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            WebAppBar(scaffoldKey: scaffoldKey),
            CustomPolicyBanner(),
            SizedBox(height: 40,),
            PrivacyPolicyBodyWidget(),
            SizedBox(height: 80,),
            NewsLEtterPolicyWidget(),
            MainFooterPolicyWidget(),


          ],
        ),
      ),
    );
  }
}