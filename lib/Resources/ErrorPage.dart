import 'package:flutter/material.dart';
import 'package:vendor_website/AppBars/AppDrawer.dart';
import 'package:vendor_website/AppBars/WebAppBar.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/ImageString.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/CarScreen/ResubaleWidget/MainFooterWidget.dart';
import 'package:vendor_website/Vendor/CarScreen/ResubaleWidget/NewsLetterSection.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    return Scaffold(
      key: scaffoldKey,
      drawer: const AppDrawer(),
      backgroundColor: AppColors.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            WebAppBar(scaffoldKey: scaffoldKey),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 1250,
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    bool isMobile = constraints.maxWidth < 850;
                    bool isUltraSmall = constraints.maxWidth < 320;

                    return Container(
                      constraints: BoxConstraints(
                        minHeight: isMobile ? 0 : 450,
                      ),
                      padding: EdgeInsets.symmetric(
                        horizontal: isMobile ? 20 : 60,
                        vertical: isMobile ? 40 : 60,
                      ),
                      child: isMobile
                          ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildImageSide(isUltraSmall),
                          const SizedBox(height: 40),
                          _buildTextSide(context, isUltraSmall),
                        ],
                      )
                          : Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 5,
                            child: _buildTextSide(context, false),
                          ),
                          const SizedBox(width: 60),
                          Expanded(
                            flex: 5,
                            child: _buildImageSide(false),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            MediaQuery.of(context).size.width < 850
                ? const SizedBox(height: 50)
                : const SizedBox(height: 120),
            NewsletterSectionWidget(),
            MainFooterWidget(),
          ],
        ),
      ),
    );
  }

  /// ------- Extra Widget ------- ///

   // Text side
  Widget _buildTextSide(BuildContext context, bool isUltraSmall) {
    return Column(
      crossAxisAlignment: isUltraSmall ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          TextString.errorTitle,
          style: TTextTheme.bodySemiBold16(context),
        ),
        const SizedBox(height: 12),
        Text(
          TextString.errorSubtitle,
          style: TTextTheme.hUnderMaintenance(context),
          textAlign: isUltraSmall ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 16),
        Text(
          TextString.errorSubtitle2,
          style: TTextTheme.hContactServicesSubtitle2(context),
          textAlign: isUltraSmall ? TextAlign.center : TextAlign.start,
        ),
      ],
    );
  }

  // Image Side
  Widget _buildImageSide(bool isUltraSmall) {
    return Image.asset(
      ImageString.UnderMaintenanceImage,
      height: isUltraSmall ? 180 : 320,
      fit: BoxFit.contain,
    );
  }
}