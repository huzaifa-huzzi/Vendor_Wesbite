import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/AppBars/AppDrawer.dart';
import 'package:vendor_website/AppBars/WebAppBar.dart';
import 'package:vendor_website/Vendor/Services/GeneralMaintenance/Widget/GeneralMaintenanceGrids.dart';
import 'package:vendor_website/Vendor/Services/GeneralMaintenance/Widget/KeyBenefitSection.dart';
import 'package:vendor_website/Vendor/Services/GeneralMaintenance/Widget/MaintenanceBanner.dart';
import 'package:vendor_website/Vendor/Services/GeneralMaintenance/Widget/ResponsiveGeneralVideoSectionWidget.dart';
import 'package:vendor_website/Vendor/Services/GeneralMaintenance/Widget/whyChooseGeneralServicesWidget.dart';
import 'package:vendor_website/Vendor/Services/Reusable%20Widget/MainFooterWidgetServices.dart';
import 'package:vendor_website/Vendor/Services/Reusable%20Widget/NewsLetterServiceSection.dart';
import 'package:vendor_website/Vendor/Services/ServicesController.dart';



class GeneralMaintenance extends StatelessWidget {
  const GeneralMaintenance({super.key});

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
            MaintenanceBanner(),
            SizedBox(height: 40,),
            GeneralMaintenancesGrid(),
            SizedBox(height: 30,),
            KeyBenefitsSection(),
            SizedBox(height: 30,),
            WhyChooseGeneralServicesWidget(),
            SizedBox(height: 30,),
            ResponsiveGeneralVideoSection(),
            SizedBox(height: 50,),
            NewsletterServiceSectionWidget(),
            MainFooterWidetServices(),



          ],
        ),
      ),
    );
  }
}
