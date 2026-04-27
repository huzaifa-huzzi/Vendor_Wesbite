import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/AppBars/AppDrawer.dart';
import 'package:vendor_website/AppBars/WebAppBar.dart';
import 'package:vendor_website/Vendor/CarScreen/CarController.dart';
import 'package:vendor_website/Vendor/CarScreen/ResubaleWidget/MainFooterWidget.dart';
import 'package:vendor_website/Vendor/CarScreen/ResubaleWidget/NewsLetterSection.dart';
import 'package:vendor_website/Vendor/CarScreen/Widget/CarListingWidget.dart';
import 'package:vendor_website/Vendor/CarScreen/Widget/CustomCarBanner.dart';
import 'package:vendor_website/Vendor/CarScreen/Widget/PopularVehicleSection.dart';
import 'package:vendor_website/Vendor/CarScreen/Widget/RentCarCTASection.dart';


class CarScreenWidget extends StatefulWidget {
  const CarScreenWidget({super.key});

  @override
  State<CarScreenWidget> createState() => _CarScreenWidgetState();
}

class _CarScreenWidgetState extends State<CarScreenWidget> {
  @override
  Widget build(BuildContext context) {
    Get.put(CarController());
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
            children: [
            WebAppBar(scaffoldKey: scaffoldKey),
            CustomCarBanner(),
            CarListingWidget(),
              SizedBox(height: 20,),
              PopularVehiclesSection(),
              SizedBox(height: 20,),
              RentCarCTASection(),
              SizedBox(height: 20,),
              NewsletterSectionWidget(),
              MainFooterWidget(),


        ],
      ),
      ),
    );
  }

}
