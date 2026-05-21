import 'package:go_router/go_router.dart';
import 'package:vendor_website/Resources/ErrorPage.dart';
import 'package:vendor_website/Vendor/AboutUs/AboutUs.dart';
import 'package:vendor_website/Vendor/CarScreen/Car%20Detail/CarDetail.dart';
import 'package:vendor_website/Vendor/CarScreen/CarScreen.dart';
import 'package:vendor_website/Vendor/ContactUs/ContactUsScreen.dart';
import 'package:vendor_website/Vendor/ContactUs/Widget/ContactUsScreenWidget.dart';
import 'package:vendor_website/Vendor/Faqs/Faqs.dart';
import 'package:vendor_website/Vendor/HomeScreen/HomeScreen.dart';
import 'package:vendor_website/Vendor/Services/AcServices/AcServices.dart';
import 'package:vendor_website/Vendor/Services/BatteryServices/BatteryServices.dart';
import 'package:vendor_website/Vendor/Services/BrakeService/BrakeService.dart';
import 'package:vendor_website/Vendor/Services/Engineservices/EngineServices.dart';
import 'package:vendor_website/Vendor/Services/GeneralMaintenance/GeneralMaintenance.dart';
import 'package:vendor_website/Vendor/Services/Services.dart';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_website/Vendor/Services/TyreService/TyreService.dart';

class AppNavigation {
  static final router = GoRouter(
    initialLocation: '/',

    errorBuilder: (context, state) =>  ErrorPage(),

    routes: [
      ShellRoute(
        builder: (context, state, child) {
          return child;
        },
        routes: [
          GoRoute(
            path: '/',
            builder: (context, state) => const HomeScreen(),
          ),
          GoRoute(
            path: '/cars',
            builder: (context, state) => CarScreen(),
          ),
          GoRoute(
            path: '/CarDetail',
            builder: (context, state) => CarDetailScreen(),
          ),
          GoRoute(
            path: '/services',
            builder: (context, state) => ServicesScreen(),
          ),

          GoRoute(
            path: '/generalMaintenance',
            builder: (context, state) => GeneralMaintenance(),
          ),
          GoRoute(
            path: '/engineServices',
            builder: (context, state) => EngineServices(),
          ),
          GoRoute(
            path: '/brakeService',
            builder: (context, state) => BrakeService(),
          ),
          GoRoute(
            path: '/tyreService',
            builder: (context, state) => TyreServices(),
          ),
          GoRoute(
            path: '/acServices',
            builder: (context, state) => AcServices(),
          ),
          GoRoute(
            path: '/batteryServices',
            builder: (context, state) => BatteryServices(),
          ),
          GoRoute(
            path: '/About',
            builder: (context, state) => AboutUsScreen(),
          ),
          GoRoute(
            path: '/FAQs',
            builder: (context, state) => FaqsScreen(),
          ),
          GoRoute(
            path: '/contactUs',
            builder: (context, state) => ContactUsScreen(),
          ),
        ],
      ),
    ],
  );
}