import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class AboutUsController extends GetxController {
  late VideoPlayerController videoController;
  var isInitialized = false.obs;
  var isPlaying = false.obs;

  final ScrollController scrollController = ScrollController();

  final GlobalKey sectionKey = GlobalKey();
  final List<GlobalKey> stepKeys = List.generate(4, (_) => GlobalKey());

  var activeStep = 1.obs;
  var scrollPercentage = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    initializeVideo();
    scrollController.addListener(updatePosition);
  }

  void initializeVideo() async {
    try {
      videoController = VideoPlayerController.asset('assets/Videos/ServiceCar.mp4');
      await videoController.initialize();

      isInitialized.value = true;
      update();
      print("Video Initialized Successfully!");
    } catch (e) {
      print("Video Initialization Error: $e");
    }
  }

  void togglePlay() {
    if (videoController.value.isPlaying) {
      videoController.pause();
      isPlaying.value = false;
    } else {
      videoController.play();
      isPlaying.value = true;
    }
  }

  void updatePosition() {
    final ctx = sectionKey.currentContext;
    if (ctx == null) return;
    final renderObj = ctx.findRenderObject();
    if (renderObj is! RenderBox || !renderObj.attached) return;

    final media = MediaQuery.maybeOf(ctx);
    if (media == null) return;

    final screenHeight = media.size.height;
    final triggerY = screenHeight * 0.5;
    final sectionTop = renderObj.localToGlobal(Offset.zero).dy;
    final sectionHeight = renderObj.size.height;
    if (sectionHeight <= 0) return;

    final progress = ((triggerY - sectionTop) / sectionHeight).clamp(0.0, 1.0);
    if ((scrollPercentage.value - progress).abs() > 0.001) {
      scrollPercentage.value = progress;
    }

    double bestDist = double.infinity;
    int bestStep = 1;
    for (int i = 0; i < stepKeys.length; i++) {
      final box = stepKeys[i].currentContext?.findRenderObject();
      if (box is! RenderBox || !box.attached) continue;
      final stepCenter = box.localToGlobal(Offset.zero).dy + box.size.height / 2;
      final dist = (stepCenter - triggerY).abs();
      if (dist < bestDist) {
        bestDist = dist;
        bestStep = i + 1;
      }
    }
    if (activeStep.value != bestStep) {
      activeStep.value = bestStep;
    }
  }

  @override
  void onClose() {
    scrollController.removeListener(updatePosition);
    scrollController.dispose();
    videoController.dispose();
    super.onClose();
  }
}
