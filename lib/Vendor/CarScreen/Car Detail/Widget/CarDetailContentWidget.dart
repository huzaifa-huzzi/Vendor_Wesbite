
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/CarScreen/CarController.dart';
import 'package:vendor_website/Vendor/CarScreen/ResubaleWidget/PrimaryBtnOfCar.dart';

class CarDetailContentWidget extends GetView<CarController> {
  const CarDetailContentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.08, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Obx(() {
              if (controller.carImages.isEmpty) {
                return const SizedBox(
                    height: 400,
                    child: Center(child: CircularProgressIndicator())
                );
              }
              return Container(
                height: isMobile ? 250 : 450,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.asset(
                  controller.carImages[controller.selectedIndex.value],
                  fit: BoxFit.contain,
                ),
              );
            }),
          ),

          const SizedBox(height: 25),
          Obx(() => SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: [
                ...List.generate(
                  controller.carImages.length > 2 ? 2 : controller.carImages.length,
                      (index) => GestureDetector(
                    onTap: () => controller.updateSelectedIndex(index),
                    child: _buildThumbnail(
                      controller.carImages[index],
                      isSelected: controller.selectedIndex.value == index,
                    ),
                  ),
                ),
                if (controller.carImages.length > 2)
                  _buildViewAllThumbnail(context, controller.carImages[2]),
              ],
            ),
          )),

          const SizedBox(height: 40),
          _buildCarInfoCard(context),
        ],
      ),
    );
  }

  /// --- Extra Widgets---///

  Widget _buildThumbnail(String img, {bool isSelected = false}) {
    return Container(
      margin: const EdgeInsets.only(right: 15),
      height: 90,
      width: 130,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isSelected ? AppColors.primaryColor : AppColors.quadrantalTextColor.withOpacity(0.3),
          width: isSelected ? 2 : 1,
        ),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(img, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildViewAllThumbnail(BuildContext context, String img) {
    return GestureDetector(
      onTap: () => _showGalleryDialog(context),
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildThumbnail(img),
          PrimaryBtnOfCar(
            text: "View All",
            onTap: () => _showGalleryDialog(context),
            height: 38,
            width: 85,
            borderRadius: BorderRadius.circular(6),
          ),
        ],
      ),
    );
  }

  Widget _buildCarInfoCard(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isSmall = constraints.maxWidth < 340;
        return Container(
          width: double.infinity,
          padding: EdgeInsets.all(isSmall ? 16 : 24),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.quadrantalTextColor.withOpacity(0.4)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Honda Civic 2022 EX / Touring", style: TTextTheme.h1StyleBlack(context)),
              const SizedBox(height: 12),
              _buildBadge(context, "Rent"),
              const SizedBox(height: 8),
              Text("\$254/ per Week", style: TTextTheme.h6StylePrimary(context)),
              const SizedBox(height: 20),
              _buildBadge(context, "Description"),
              const SizedBox(height: 12),
              Text(
                "Experience the perfect blend of comfort, performance, and style with this vehicle. Designed to make every journey enjoyable, it offers smooth handling, responsive acceleration, and advanced safety features to keep you confident on the road...",
                textAlign: TextAlign.justify,
                style: TTextTheme.bodyRegular16(context).copyWith(height: 1.5),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildBadge(BuildContext context, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: TTextTheme.medium16white(context)),
    );
  }
  void _showGalleryDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withOpacity(0.9),
      builder: (context) {
        return LayoutBuilder(
          builder: (context, constraints) {
            double sw = constraints.maxWidth;
            double sh = constraints.maxHeight;
            bool isMobile = sw < 600;
            bool isSmall = sw < 400;

            double containerWidth = isMobile ? sw * 0.75 : sw * 0.65;
            double containerHeight = isMobile ? sh * 0.35 : sh * 0.60;

            return Dialog(
              backgroundColor: Colors.transparent,
              insetPadding: EdgeInsets.zero,
              child: SizedBox(
                width: sw,
                height: sh,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Obx(() => Container(
                      width: containerWidth,
                      height: containerHeight,
                      padding: EdgeInsets.all(isSmall ? 10 : 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.asset(
                          controller.carImages[controller.selectedIndex.value],
                          fit: BoxFit.contain,
                        ),
                      ),
                    )),
                    Positioned(
                      left: (sw / 2) - (containerWidth / 2) - (isSmall ? 45 : 60),
                      child: _buildDialogNav(Icons.arrow_back, () => controller.prevImage(), isSmall: isSmall),
                    ),
                    Positioned(
                      right: (sw / 2) - (containerWidth / 2) - (isSmall ? 45 : 60),
                      child: _buildDialogNav(Icons.arrow_forward, () => controller.nextImage(), isSmall: isSmall),
                    ),
                    Positioned(
                      top: isMobile ? 30 : 40,
                      right: isMobile ? 20 : 30,
                      child: IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.close, color: AppColors.whiteColor, size: isSmall ? 28 : 35),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildDialogNav(IconData icon, VoidCallback onTap, {bool isSmall = false}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: isSmall ? 36 : 46,
        height: isSmall ? 36 : 46,
        decoration: const BoxDecoration(color: AppColors.primaryColor, shape: BoxShape.circle),
        child: Icon(icon, color: AppColors.whiteColor, size: isSmall ? 18 : 22),
      ),
    );
  }
}