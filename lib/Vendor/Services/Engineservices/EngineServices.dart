import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/AppBars/AppDrawer.dart';
import 'package:vendor_website/AppBars/WebAppBar.dart';
import 'package:vendor_website/Vendor/Services/Engineservices/Widget/EngineBanner.dart';
import 'package:vendor_website/Vendor/Services/Engineservices/Widget/EngineKeyBenefitSection.dart';
import 'package:vendor_website/Vendor/Services/Engineservices/Widget/EngineServiceGrid.dart';
import 'package:vendor_website/Vendor/Services/Engineservices/Widget/ResponsiveEngineVideoSection.dart';
import 'package:vendor_website/Vendor/Services/Engineservices/Widget/WhychooseEngineWidget.dart';
import 'package:vendor_website/Vendor/Services/Reusable%20Widget/MainFooterWidgetServices.dart';
import 'package:vendor_website/Vendor/Services/Reusable%20Widget/NewsLetterServiceSection.dart';
import 'package:vendor_website/Vendor/Services/ServicesController.dart';



class EngineServices extends StatelessWidget {
  const EngineServices({super.key});

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
            EngineBanner(),
            SizedBox(height: 20,),
            EngineServicesGrid(),
            SizedBox(height: 80,),
            EngineKeyBenefitsSection(),
            SizedBox(height: 80,),
            WhyChooseEngineWidget(),
            SizedBox(height: 80,),
            ResponsiveVideoEngineSection(),
            SizedBox(height: 50,),
            NewsletterServiceSectionWidget(),
            MainFooterWidetServices(),

          ],
        ),
      ),
    );
  }
}
