import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/AppBars/AppDrawer.dart';
import 'package:vendor_website/AppBars/WebAppBar.dart';
import 'package:vendor_website/Vendor/Services/BrakeService/Widget/BrakeBanner.dart';
import 'package:vendor_website/Vendor/Services/BrakeService/Widget/BrakeKeyBenefitSection.dart';
import 'package:vendor_website/Vendor/Services/BrakeService/Widget/BrakeServicesGrid.dart';
import 'package:vendor_website/Vendor/Services/BrakeService/Widget/ResponsiveVideoServiceSection.dart';
import 'package:vendor_website/Vendor/Services/BrakeService/Widget/WhyChooseBrakeSerivces.dart';
import 'package:vendor_website/Vendor/Services/Reusable%20Widget/MainFooterWidgetServices.dart';
import 'package:vendor_website/Vendor/Services/Reusable%20Widget/NewsLetterServiceSection.dart';
import 'package:vendor_website/Vendor/Services/ServicesController.dart';



class BrakeService extends StatelessWidget {
  const BrakeService({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ServicesController());
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            WebAppBar(scaffoldKey: scaffoldKey),
            BrakeBanner(),
            SizedBox(height: 30,),
            BrakeServicesGrid(),
            SizedBox(height: 50,),
            BrakeKeyBenefitsSection(),
            SizedBox(height: 50,),
            WhyChooseBrakeServices(),
            SizedBox(height: 50,),
            ResponsiveVideoBrakeSection(),
            SizedBox(height: 50,),
            NewsletterServiceSectionWidget(),
            MainFooterWidetServices(),



          ],
        ),
      ),
    );
  }
}
