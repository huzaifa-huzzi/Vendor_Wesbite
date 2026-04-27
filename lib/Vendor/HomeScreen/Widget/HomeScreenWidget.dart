import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_website/AppBars/AppDrawer.dart';
import 'package:vendor_website/AppBars/WebAppBar.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/IconString.dart';
import 'package:vendor_website/Resources/ImageString.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/CarScreen/Car%20Detail/Widget/BestOfferSectionWidget.dart';
import 'package:vendor_website/Vendor/CarScreen/ResubaleWidget/MainFooterWidget.dart';
import 'package:vendor_website/Vendor/CarScreen/ResubaleWidget/NewsLetterSection.dart';
import 'package:vendor_website/Vendor/HomeScreen/HomeController.dart';
import 'package:vendor_website/Vendor/HomeScreen/ReusbaleWidget/PrimaryBtnOfHome.dart';
import 'package:vendor_website/Vendor/HomeScreen/Widget/FaqSection.dart';
import 'package:vendor_website/Vendor/HomeScreen/Widget/FeaturedCategoriesSection.dart';
import 'package:vendor_website/Vendor/HomeScreen/Widget/HeroSection.dart';
import 'package:vendor_website/Vendor/HomeScreen/Widget/HowItWorksSection.dart';
import 'package:vendor_website/Vendor/HomeScreen/Widget/TestiMonialSection.dart';
import 'package:vendor_website/Vendor/HomeScreen/Widget/WhyChooseUsSection.dart';

class HomeScreenWidget extends StatelessWidget {
  const HomeScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            WebAppBar(scaffoldKey: scaffoldKey),
            HeroSection(),
            FeaturedCategoriesSection(),
            HowItWorksSection(),
            BestOffersSectionWidget(),
            WhyChooseUsSection(),
            TestimonialsSection(),
            FAQsSection(),
            SizedBox(height: 30,),
            NewsletterSectionWidget(),
            MainFooterWidget(),
          ],
        ),
      ),
    );
  }
}