import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Resources/AppSizes.dart';
import 'package:vendor_website/Resources/ImageString.dart';
import 'package:vendor_website/Resources/TextString.dart';
import 'package:vendor_website/Resources/TextTheme.dart';
import 'package:vendor_website/Vendor/HomeScreen/HomeController.dart';

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController controller = Get.find<HomeController>();
    final bool isDesktop = AppSizes.isWeb(context);


    final List<Widget> testimonialItems = [
      _buildTestimonialCard(context, TextString.name1, TextString.customerText, ImageString.pic1),
      _buildTestimonialCard(context, TextString.name2, TextString.customerText, ImageString.pic2),
      _buildTestimonialCard(context, TextString.name3, TextString.customerText, ImageString.pic3),
    ];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80),
      color: AppColors.backgroundOfScreenColor,
      child: Column(
        children: [
          Text(
            TextString.customerTitle,
            style: TTextTheme.h4Style(context),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              TextString.customerSubtitle,
              textAlign: TextAlign.center,
              style: TTextTheme.medium16black(context),
            ),
          ),
          const SizedBox(height: 50),

          CarouselSlider(
            items: testimonialItems,
            carouselController: controller.carouselController,
            options: CarouselOptions(
              height: 380,
              autoPlay: true,
              enlargeCenterPage: true,
              viewportFraction: isDesktop ? 0.33 : 0.85,
              onPageChanged: (index, reason) {
                controller.currentTestimonialIndex.value = index;
              },
            ),
          ),

          const SizedBox(height: 30),
          Obx(() => Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: testimonialItems.asMap().entries.map((entry) {
              bool isActive = controller.currentTestimonialIndex.value == entry.key;
              return GestureDetector(
                onTap: () => controller.carouselController.animateToPage(entry.key),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: isActive ? 12.0 : 10.0,
                  height: isActive ? 12.0 : 10.0,
                  margin: const EdgeInsets.symmetric(horizontal: 4.0),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isActive ? AppColors.primaryColor : AppColors.tertiaryTextColor,
                  ),
                ),
              );
            }).toList(),
          )),
        ],
      ),
    );
  }
        /// --------- Extra Widget ---------
  //  Testimonial Card
  Widget _buildTestimonialCard(BuildContext context, String name, String role, String imagePath) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 35),
          padding: const EdgeInsets.fromLTRB(25, 45, 25, 20),
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: AppColors.fieldsBackground.withOpacity(0.03),
                blurRadius: 15,
                offset: const Offset(0, 10),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: List.generate(5, (index) => const Icon(Icons.star, color: AppColors.primaryColor, size: 18)),
              ),
              const SizedBox(height: 10),
              Flexible(
                child: SingleChildScrollView(
                  child: Text(
                    TextString.cardText,
                    style: TTextTheme.bodyRegular16black(context),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              // User Info
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TTextTheme.titleOne(context).copyWith(fontSize: 16),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    role,
                    style: TTextTheme.titleTwo(context).copyWith(fontSize: 13),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ],
          ),
        ),
        Positioned(
          top: 0,
          left: 25,
          child: CircleAvatar(
            radius: 35,
            backgroundColor: AppColors.whiteColor,
            child: CircleAvatar(
              radius: 32,
              backgroundImage: AssetImage(imagePath),
            ),
          ),
        ),
      ],
    );
  }
}