import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/AppBars/AppDrawer.dart';
import 'package:vendor_website/AppBars/WebAppBar.dart';
import 'package:vendor_website/Vendor/Services/Reusable%20Widget/MainFooterWidgetServices.dart';
import 'package:vendor_website/Vendor/Services/Reusable%20Widget/NewsLetterServiceSection.dart';
import 'package:vendor_website/Vendor/Services/ServicesController.dart';
import 'package:vendor_website/Vendor/Services/Widget/ComprehensiveServiceBanner.dart';
import 'package:vendor_website/Vendor/Services/Widget/CustomServicesBanner.dart';
import 'package:vendor_website/Vendor/Services/Widget/ResponsiveServiceGrid.dart';
import 'package:vendor_website/Vendor/Services/Widget/ResponsiveVideoSection.dart';
import 'package:vendor_website/Vendor/Services/Widget/TestimonialServicesSection.dart';
import 'package:vendor_website/Vendor/Services/Widget/WhyChooseSectionWidget.dart';


class ServicesWidget extends StatelessWidget {
  const ServicesWidget({super.key});

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
            CustomServicesBanner(),
            SizedBox(height: 20,),
            ResponsiveServicesGrid(),
            SizedBox(height: 20,),
            WhyChooseServicesSectionWidget(),
            SizedBox(height: 10,),
            ResponsiveVideoSection(),
            SizedBox(height: 30,),
            TestimonialServicesSection(),
            SizedBox(height: 30,),
            ComprehensiveServiceBanner(),
            SizedBox(height: 40,),
            NewsletterServiceSectionWidget(),
            MainFooterWidetServices(),

          ],
        ),
      ),
    );
  }
}
