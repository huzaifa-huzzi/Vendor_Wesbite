import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/AppBars/AppDrawer.dart';
import 'package:vendor_website/AppBars/WebAppBar.dart';
import 'package:vendor_website/Vendor/Services/Reusable%20Widget/MainFooterWidgetServices.dart';
import 'package:vendor_website/Vendor/Services/Reusable%20Widget/NewsLetterServiceSection.dart';
import 'package:vendor_website/Vendor/Services/ServicesController.dart';
import 'package:vendor_website/Vendor/Services/TyreService/Widget/ResponsiveVideoTyreServices.dart';
import 'package:vendor_website/Vendor/Services/TyreService/Widget/TyreBanner.dart';
import 'package:vendor_website/Vendor/Services/TyreService/Widget/TyreServiceGrid.dart';
import 'package:vendor_website/Vendor/Services/TyreService/Widget/tyreBenefitSection.dart';
import 'package:vendor_website/Vendor/Services/TyreService/Widget/whyChoosetyreServices.dart';

class TyreServices extends StatelessWidget {
  const TyreServices({super.key});

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
            TyreBanner(),
            SizedBox(height: 30,),
            TyreServicesGrid(),
            SizedBox(height: 50,),
            TyreKeyBenefitsSection(),
            SizedBox(height: 50,),
            WhyChoosetyreServices(),
            SizedBox(height: 30,),
            ResponsiveVideoTyreSection(),
            SizedBox(height: 50,),
            NewsletterServiceSectionWidget(),
            MainFooterWidetServices(),
          ],
        ),
      ),
    );
  }
}