import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:get/get.dart';
import 'package:vendor_website/AppBars/SidebarBinding.dart';
import 'package:vendor_website/Resources/Theme.dart';
import 'package:vendor_website/Routes/AppRoutes.dart';

void main() {
  setPathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      initialBinding: SidebarBinding(),
      theme: TAppTheme.lightTheme(context),
      routerDelegate: AppNavigation.router.routerDelegate,
      routeInformationParser: AppNavigation.router.routeInformationParser,
      routeInformationProvider: AppNavigation.router.routeInformationProvider,
    );
  }
}