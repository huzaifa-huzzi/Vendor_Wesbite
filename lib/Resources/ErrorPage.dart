

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vendor_website/AppBars/AppDrawer.dart';
import 'package:vendor_website/AppBars/WebAppBar.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/ImageString.dart';
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

  // Text Side
  Widget _buildTextSide(BuildContext context, bool isUltraSmall) {
    return Column(
      crossAxisAlignment: isUltraSmall ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        Text(
          "404 error",
          style: TTextTheme.bodySemiBold16(context),
        ),
        const SizedBox(height: 12),
        Text(
          "Under maintenance",
          style: TTextTheme.hUnderMaintenance(context),
          textAlign: isUltraSmall ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 16),
        Text(
          "Sorry, the page you are looking for doesn’t exist or has been moved. Try searching our site:",
          style: TTextTheme.hContactServicesSubtitle2(context),
          textAlign: isUltraSmall ? TextAlign.center : TextAlign.start,
        ),
        const SizedBox(height: 30),
        LayoutBuilder(
          builder: (context, searchConstraints) {
            bool stackSearch = searchConstraints.maxWidth < 400;
            final TextEditingController searchController = TextEditingController();
            void handleSearch() {
              String query = searchController.text.trim().toLowerCase();

              if (query.isEmpty) return;
              if (query.contains('car')) {
                context.go('/cars');
              } else if (query.contains('service')) {
                context.go('/services');
              } else if (query.contains('about')) {
                context.go('/About');
              } else if (query.contains('faq')) {
                context.go('/FAQs');
              } else if (query.contains('contact') || query.contains('touch')) {
                context.go('/contactUs');
              } else if (query == 'home') {
                context.go('/');
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("No page found for '$query'. Try searching 'Cars' or 'Services'."),
                    backgroundColor: AppColors.primaryColor,
                  ),
                );
              }
            }

            Widget searchField = SizedBox(
              height: 45,
              child: TextField(
                controller: searchController,
                cursorColor: Colors.black,
                textInputAction: TextInputAction.search,
                onSubmitted: (_) => handleSearch(),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search, color: Colors.grey, size: 20),
                  hintText: "Search our site ",
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 13),
                  contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(color: Colors.grey.withOpacity(0.3)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.black, width: 1),
                  ),
                ),
              ),
            );

            Widget searchButton = SizedBox(
              height: 45,
              width: stackSearch ? double.infinity : 100,
              child: ElevatedButton(
                onPressed: handleSearch,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  elevation: 0,
                ),
                child: const Text("Search", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
              ),
            );

            if (stackSearch) {
              return Column(
                children: [
                  searchField,
                  const SizedBox(height: 12),
                  searchButton,
                ],
              );
            }

            return Row(
              children: [
                Expanded(child: searchField),
                const SizedBox(width: 12),
                searchButton,
              ],
            );
          },
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