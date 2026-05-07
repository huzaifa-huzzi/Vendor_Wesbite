import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/AppBars/AppDrawer.dart';
import 'package:vendor_website/AppBars/WebAppBar.dart';
import 'package:vendor_website/Vendor/CarScreen/ResubaleWidget/NewsLetterSection.dart';
import 'package:vendor_website/Vendor/Faqs/FaqsController.dart';
import 'package:vendor_website/Vendor/Faqs/ReusableWidget/MainFooterFaqWidget.dart';
import 'package:vendor_website/Vendor/Faqs/Widget/CustomFaqsBanner.dart';
import 'package:vendor_website/Vendor/Faqs/Widget/FaqSection1.dart';
import 'package:vendor_website/Vendor/Faqs/Widget/FaqSection2.dart';
import 'package:vendor_website/Vendor/Faqs/Widget/FaqSection3.dart';
import 'package:vendor_website/Vendor/Faqs/Widget/FaqSection4.dart';
import 'package:vendor_website/Vendor/Faqs/Widget/QuestionBanner.dart';

class FaqsScreenWidget extends StatelessWidget {
  const FaqsScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FaqsController());
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            WebAppBar(scaffoldKey: scaffoldKey),
            CustomFaqsBanner(),
            SizedBox(height: 20,),
            FAQSection1(),
            FAQSection2(),
            FAQSection3(),
            FAQSection4(),
            QuestionBanner(),
            SizedBox(height: 100,),
            NewsletterSectionWidget(),
            MainFooterFaqWidget(),



          ],
        ),
      ),
    );
  }
}