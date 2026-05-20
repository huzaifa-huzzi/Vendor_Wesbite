import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vendor_website/Resources/AppColors.dart';
import 'package:vendor_website/Vendor/Services/ServicesController.dart';
import 'package:video_player/video_player.dart';

class ResponsiveVideoBrakeSection extends GetView<ServicesController> {
  const ResponsiveVideoBrakeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Obx(() => Container(
      margin: EdgeInsets.symmetric(vertical: 40, horizontal: screenWidth < 600 ? 15 : 80),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(24),
        child: Stack(
          alignment: Alignment.center,
          children: [
            controller.isInitialized.value
                ? AspectRatio(
              aspectRatio: 16 / 9,
              child: VideoPlayer(controller.videoController),
            )
                : const Center(child: CircularProgressIndicator()),

            if (controller.isInitialized.value)
              Positioned.fill(
                child: GestureDetector(
                  onTap: () => controller.togglePlay(),
                  child: Container(
                    color: controller.isPlaying.value ? Colors.transparent : Colors.black26,
                    child: !controller.isPlaying.value
                        ? Center(
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        decoration: const BoxDecoration(
                          color: AppColors.primaryColor,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(Icons.play_arrow, color: AppColors.whiteColor, size: 40),
                      ),
                    )
                        : const SizedBox.shrink(),
                  ),
                ),
              ),
          ],
        ),
      ),
    ));
  }
}