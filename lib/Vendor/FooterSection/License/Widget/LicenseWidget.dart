import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/AppBars/AppDrawer.dart';
import 'package:vendor_website/AppBars/WebAppBar.dart';
import 'package:vendor_website/Vendor/FooterSection/License/LicenseController.dart';
import 'package:vendor_website/Vendor/FooterSection/License/Reusable%20Widget/MainFooterLicenseWidget.dart';
import 'package:vendor_website/Vendor/FooterSection/License/Reusable%20Widget/NewsLetterLicenseWidget.dart';
import 'package:vendor_website/Vendor/FooterSection/License/Widget/CustomLicenseBanner.dart';
import 'package:vendor_website/Vendor/FooterSection/License/Widget/LicenseBodyWidget.dart';




class LicenseWidget extends StatelessWidget {
  const LicenseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LicenseController());
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            WebAppBar(scaffoldKey: scaffoldKey),
            CustomLicenseBanner(),
            SizedBox(height: 40,),
            BusinessLicenseBodyWidget(),
            SizedBox(height: 50,),
            NewsLetterLicenseWidget(),
            MainFooterLicenseWidget(),



          ],
        ),
      ),
    );
  }
}