import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/AppBars/AppDrawer.dart';
import 'package:vendor_website/AppBars/WebAppBar.dart';
import 'package:vendor_website/Vendor/FooterSection/TermAndCondition/Reusable%20Widget/MainFooterTermWidget.dart';
import 'package:vendor_website/Vendor/FooterSection/TermAndCondition/Reusable%20Widget/NewsletterTermWidget.dart';
import 'package:vendor_website/Vendor/FooterSection/TermAndCondition/Widget/CustomBannerTermWidget.dart';
import 'package:vendor_website/Vendor/FooterSection/TermAndCondition/Widget/TermandConditionBodyWidget.dart';

class TermAndConditonWidget extends StatelessWidget {
  const TermAndConditonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TermAndConditonWidget());
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            WebAppBar(scaffoldKey: scaffoldKey),
            CustomBannerTermWidget(),
            SizedBox(height: 10,),
            TermsAndConditionsBodyWidget(),
            SizedBox(height: 80,),
            NewsletterTermWidget(),
            MainFooterTermWidget(),

          ],
        ),
      ),
    );
  }
}