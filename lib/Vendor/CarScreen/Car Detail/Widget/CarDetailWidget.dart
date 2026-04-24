import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/AppBars/AppDrawer.dart';
import 'package:vendor_website/AppBars/WebAppBar.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Vendor/CarScreen/Car%20Detail/Widget/BestOfferSectionWidget.dart';
import 'package:vendor_website/Vendor/CarScreen/Car%20Detail/Widget/CTASectionWidget.dart';
import 'package:vendor_website/Vendor/CarScreen/Car%20Detail/Widget/CarDetailContentWidget.dart';
import 'package:vendor_website/Vendor/CarScreen/Car%20Detail/Widget/CarSpecificationWidget.dart';
import 'package:vendor_website/Vendor/CarScreen/Car%20Detail/Widget/DetailHEaderWidget.dart';
import 'package:vendor_website/Vendor/CarScreen/CarController.dart';
import 'package:vendor_website/Vendor/CarScreen/ResubaleWidget/MainFooterWidget.dart';
import 'package:vendor_website/Vendor/CarScreen/ResubaleWidget/NewsLetterSection.dart';

class CarDetailWidget extends StatefulWidget {
  const CarDetailWidget({super.key});

  @override
  State<CarDetailWidget> createState() => _CarDetailWidgetState();
}

class _CarDetailWidgetState extends State<CarDetailWidget> {
  final controller = Get.put(CarController());

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      backgroundColor: AppColors.backgroundOfScreenColor,
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            WebAppBar(scaffoldKey: scaffoldKey),
            DetailHeaderWidget(),
            const SizedBox(height: 50),
            CarDetailContentWidget(),
            const SizedBox(height: 50),
            CarSpecificationsWidget(),
            const SizedBox(height: 50),
            BestOffersSectionWidget(),
            const SizedBox(height: 100),
            CTASectionWidget(),
            const SizedBox(height: 300),
            NewsletterSectionWidget(),
            MainFooterWidget(),
          ],
        ),
      ),
    );
  }
}