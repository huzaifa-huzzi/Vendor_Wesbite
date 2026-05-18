import 'package:flutter/material.dart';
import 'package:vendor_website/AppBars/AppDrawer.dart';
import 'package:vendor_website/AppBars/WebAppBar.dart';
import 'package:vendor_website/Vendor/ContactUs/Reusable%20Widget/MainFooterContactWidget.dart';
import 'package:vendor_website/Vendor/ContactUs/Reusable%20Widget/NewsletterContactWidget.dart';
import 'package:vendor_website/Vendor/ContactUs/Widget/ContactInformationCardWidget.dart';
import 'package:vendor_website/Vendor/ContactUs/Widget/ContactUsCustomBanner.dart';
import 'package:vendor_website/Vendor/ContactUs/Widget/ContactUsFormCard.dart';


class ContactUsScreenWidget extends StatelessWidget {
  const ContactUsScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            WebAppBar(scaffoldKey: scaffoldKey),
            ContactUsCustomBanner(),
            SizedBox(height: 50,),
            ContactUsFormCard(),
            SizedBox(height: 80,),
            ContactInformationCard(),
            SizedBox(height: 80,),
           // OurLocationCard(),
            SizedBox(height: 80,),
            NewsletterContactWidget(),
            MainFooterContactWidget(),

          ],
        ),
      ),
    );
  }
}