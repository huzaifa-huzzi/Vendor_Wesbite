import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/AppBars/AppDrawer.dart';
import 'package:vendor_website/AppBars/WebAppBar.dart';
import 'package:vendor_website/Vendor/AboutUs/AboutUsController.dart';
import 'package:vendor_website/Vendor/AboutUs/ReusableWidget/MainFooterAboutWidget.dart';
import 'package:vendor_website/Vendor/AboutUs/ReusableWidget/NewsLetterAboutSection.dart';
import 'package:vendor_website/Vendor/AboutUs/Widget/CustomAboutUsBanner.dart';
import 'package:vendor_website/Vendor/AboutUs/Widget/ExtraOrdinaryDriveSection.dart';
import 'package:vendor_website/Vendor/AboutUs/Widget/HowItWorksSection.dart';
import 'package:vendor_website/Vendor/AboutUs/Widget/ResponsiveAboutVideoSection.dart';
import 'package:vendor_website/Vendor/AboutUs/Widget/ServiceStatsSection.dart';
import 'package:vendor_website/Vendor/AboutUs/Widget/TeamSectionAbout.dart';
import 'package:vendor_website/Vendor/AboutUs/Widget/WhyChooseUsAbout.dart';

class AboutUsScreenWidget extends StatelessWidget {
  const AboutUsScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AboutUsController());
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        controller: controller.scrollController,
        child: Column(
          children: [
            WebAppBar(scaffoldKey: scaffoldKey),
            AboutUsCustomCarBanner(),
            SizedBox(height: 20,),
            ExtraordinaryDriveSection(),
            SizedBox(height: 40,),
            ResponsiveVideoSection(),
            SizedBox(height: 2,),
            ServiceStatsSection(),
            SizedBox(height: 20,),
            WhyChooseUsAbout(),
            SizedBox(height: 20,),
            HowItWorksWeb(),
            SizedBox(height: 20,),
            TeamSection(),
            SizedBox(height: 20,),
            NewsletterAboutWidget(),
            MainFooterAboutWidget(),

          ],
        ),
      ),
    );
  }
}
