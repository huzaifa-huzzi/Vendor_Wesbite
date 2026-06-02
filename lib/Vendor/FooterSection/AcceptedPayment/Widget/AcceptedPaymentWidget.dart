import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/AppBars/AppDrawer.dart';
import 'package:vendor_website/AppBars/WebAppBar.dart';
import 'package:vendor_website/Vendor/FooterSection/AcceptedPayment/AcceptedPaymentController.dart';
import 'package:vendor_website/Vendor/FooterSection/AcceptedPayment/ReusableWidget/MainFooterAcceptedPaymentWidget.dart';
import 'package:vendor_website/Vendor/FooterSection/AcceptedPayment/ReusableWidget/NewsletterAcceptedWidget.dart';
import 'package:vendor_website/Vendor/FooterSection/AcceptedPayment/Widget/AcceptedContactBanner.dart';
import 'package:vendor_website/Vendor/FooterSection/AcceptedPayment/Widget/AcceptedPaymentBodyWidget.dart';
import 'package:vendor_website/Vendor/FooterSection/AcceptedPayment/Widget/CustomAcceptedPaymentBAnner.dart';




class AcceptedPaymentWidget extends StatelessWidget {
  const AcceptedPaymentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AcceptedPaymentController());
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            WebAppBar(scaffoldKey: scaffoldKey),
            CustomAcceptedPaymentWidet(),
            SizedBox(height: 40,),
            AcceptedPaymentBodyWidget(),
            SizedBox(height: 40,),
            AcceptedConatctBanner(),
            SizedBox(height: 80,),
            NewsletterAcceptedPAymentWidget(),
            MainFooterAcceptedPaymentWidget(),


          ],
        ),
      ),
    );
  }
}