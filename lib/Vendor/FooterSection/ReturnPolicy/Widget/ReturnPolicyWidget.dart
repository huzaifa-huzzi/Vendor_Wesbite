import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/AppBars/AppDrawer.dart';
import 'package:vendor_website/AppBars/WebAppBar.dart';
import 'package:vendor_website/Vendor/FooterSection/ReturnPolicy/ReturnPolicyController.dart';
import 'package:vendor_website/Vendor/FooterSection/ReturnPolicy/ReuableWidget/MainFooterReturnWidget.dart';
import 'package:vendor_website/Vendor/FooterSection/ReturnPolicy/ReuableWidget/NewsletterReturnWidget.dart';
import 'package:vendor_website/Vendor/FooterSection/ReturnPolicy/Widget/CustomReturnPolicyWidget.dart';
import 'package:vendor_website/Vendor/FooterSection/ReturnPolicy/Widget/ReturnPolicyBodyWidget.dart';



class ReturnPolicyWidget extends StatelessWidget {
  const ReturnPolicyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ReturnPolicyController());
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            WebAppBar(scaffoldKey: scaffoldKey),
            CustomReturnPolicyWidget(),
            SizedBox(height: 10,),
            ReturnPolicyBodyWidget(),
            SizedBox(height: 80,),
            NewsletterReturnWidget(),
            MainFooterReturnWidget()

          ],
        ),
      ),
    );
  }
}