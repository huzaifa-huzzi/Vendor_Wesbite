import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/AppBars/AppDrawer.dart';
import 'package:vendor_website/AppBars/WebAppBar.dart';
import 'package:vendor_website/Vendor/Services/AcServices/Widget/AcBanner.dart';
import 'package:vendor_website/Vendor/Services/AcServices/Widget/AcServicesGrids.dart';
import 'package:vendor_website/Vendor/Services/ServicesController.dart';


class AcServices extends StatelessWidget {
  const AcServices({super.key});

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
            AcBanner(),
            SizedBox(height: 50,),
            AcServicesGrid(),
          ],
        ),
      ),
    );
  }
}