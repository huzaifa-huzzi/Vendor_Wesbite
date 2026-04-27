import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/ImageString.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/HomeScreen/HomeController.dart';
import 'package:vendor_website/Vendor/HomeScreen/ReusbaleWidget/PrimaryBtnOfHome.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final bool isDesktop = screenWidth > 1010;

    return Container(
      constraints: BoxConstraints(minHeight: isDesktop ? 500 : 0),
      margin: EdgeInsets.all(AppSizes.horizontalPadding(context)),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: Stack(
          children: [
            Positioned.fill(
              child: SvgPicture.asset(
                ImageString.background,
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 40 : 20,
                vertical: 40,
              ),
              child: isDesktop
                  ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 3, child: _heroTextSection(context)),
                  Expanded(flex: 4, child: _carImageSection(context)),
                  SizedBox(width: 360, child: _searchBoxSection(context)),
                ],
              )
                  : Column(
                children: [
                  _heroTextSection(context),
                  const SizedBox(height: 30),
                  _carImageSection(context),
                  const SizedBox(height: 70),
                  _searchBoxSection(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  /// ---------- Extra Widget ------- ///

  //  Left Content
  Widget _heroTextSection(BuildContext context) {
    final bool isDesktop = AppSizes.isWeb(context);

    return Column(
      crossAxisAlignment: isDesktop ? CrossAxisAlignment.start : CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Experience the road like never before",
          textAlign: isDesktop ? TextAlign.start : TextAlign.center,
          style: TTextTheme.h1Style(context).copyWith(
            height: 1.1,
            fontSize: isDesktop ? 52 : 32,
          ),
        ),
        const SizedBox(height: 15),
        Text(
          TextString.homeSubtitle,
          textAlign: isDesktop ? TextAlign.start : TextAlign.center,
          style: TTextTheme.bodyRegular16white(context).copyWith(height: 1.6),
        ),
        const SizedBox(height: 35),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.white,
            foregroundColor: AppColors.primaryColor,
            elevation: 0,
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: const Text("View all cars", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
        ),
      ],
    );
  }

  //  Center Content
  Widget _carImageSection(BuildContext context) {
    final bool isDesktop = AppSizes.isWeb(context);
    final screenWidth = MediaQuery.of(context).size.width;

    return Transform.translate(
      offset: isDesktop ? const Offset(0, 150) : const Offset(0, 40),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: isDesktop ? 40 : 20),
          child: Image.asset(
            ImageString.carImage,
            fit: BoxFit.contain,
            width: isDesktop ? screenWidth * 0.5 : screenWidth * 0.5,
          ),
        ),
      ),
    );
  }

  //  Right Content
  Widget _searchBoxSection(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Container(
      width: 380,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(TextString.searchCarRental, style: TTextTheme.h3Style(context)),
          const SizedBox(height: 12),
          _buildSearchCarDropdown(context, TextString.brand, controller.selectedBrand, id: 'brand'),
          const SizedBox(height: 8),
          _buildSearchCarDropdown(context, TextString.bodyType, controller.selectedBodyType, id: 'body_type'),
          const SizedBox(height: 8),
          _buildSearchCarDropdown(context, TextString.fuelType, controller.selectedFuelType, id: 'fuel_type'),
          const SizedBox(height: 8),
          _buildSearchCarDropdown(context, TextString.transmission, controller.selectedTransmission, id: 'transmission'),
          const SizedBox(height: 8),
          _buildInputField(TextString.price, context),
          const SizedBox(height: 12),
          PrimaryBtnOfHome(
            height: 42,
            width: double.infinity,
            text: "Search Rental Cars",
            onTap: () {},
            borderRadius: BorderRadius.circular(10),
          ),
        ],
      ),
    );
  }

  //  Dropdown Builder
  Widget _buildSearchCarDropdown(BuildContext context, String label, RxString selected, {required String id}) {
    final controller = Get.find<HomeController>();

    return Obx(() {
      bool isOpen = controller.openedDropdown3.value == id;
      List<String> items = controller.getFilteredItems(id);

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(builder: (context, constraints) {
            return PopupMenuButton<String>(
              constraints: BoxConstraints(minWidth: constraints.maxWidth, maxWidth: constraints.maxWidth),
              offset: const Offset(0, 48),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              color: Colors.white,
              onOpened: () => controller.openedDropdown3.value = id,
              onCanceled: () {
                controller.openedDropdown3.value = "";
                controller.searchCarText.value = "";
              },
              onSelected: (val) {
                if (val != "SEARCH_FIELD") {
                  selected.value = val;
                  controller.openedDropdown3.value = "";
                  controller.searchCarText.value = "";
                }
              },
              child: Container(
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: AppColors.signaturePadColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.toolBackground),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        selected.value.isEmpty ? "$label" : selected.value,
                        style: TTextTheme.bodyRegular16black(context),
                      ),
                    ),
                    Icon(isOpen ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down, color: AppColors.quadrantalTextColor, size: 20),
                  ],
                ),
              ),
              itemBuilder: (context) {
                return [
                  PopupMenuItem<String>(
                    enabled: false,
                    value: "SEARCH_FIELD",
                    child: Container(
                      height: 40,
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      child: TextField(
                        onChanged: (val) => controller.searchCarText.value = val,
                        decoration: InputDecoration(
                          hintText: "Search",
                          prefixIcon: const Icon(Icons.search, size: 18),
                          filled: true,
                          fillColor: AppColors.backgroundOfScreenColor,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
                        ),
                      ),
                    ),
                  ),
                  ...items.map((item) {
                    bool isSelected = selected.value == item;
                    return PopupMenuItem<String>(
                      value: item,
                      child: Row(
                        children: [
                          Icon(isSelected ? Icons.check_circle : Icons.radio_button_unchecked, color: AppColors.primaryColor),
                          const SizedBox(width: 12),
                          Text(item, style: TTextTheme.medium16black(context)),
                        ],
                      ),
                    );
                  }),
                ];
              },
            );
          }),
        ],
      );
    });
  }

  //  Input Field
  Widget _buildInputField(String label, BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: AppColors.backgroundOfScreenColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey.shade200),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: TextField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: "Enter Price",
          border: InputBorder.none,
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
        ),
      ),
    );
  }
}