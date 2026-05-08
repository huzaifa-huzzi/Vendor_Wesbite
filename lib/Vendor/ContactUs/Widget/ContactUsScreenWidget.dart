import 'package:flutter/material.dart';
import 'package:vendor_website/AppBars/AppDrawer.dart';
import 'package:vendor_website/AppBars/WebAppBar.dart';
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

          ],
        ),
      ),
    );
  }
}