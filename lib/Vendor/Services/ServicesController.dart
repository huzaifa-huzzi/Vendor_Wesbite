

import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class ServicesController extends GetxController {
  late VideoPlayerController videoController;
  var isInitialized = false.obs;
  var isPlaying = false.obs;

  @override
  void onInit() {
    super.onInit();
    initializeVideo();
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

  var currentTestimonialIndex = 0.obs;
  final CarouselSliderController carouselController = CarouselSliderController();


   /// View Details Screen
  // Selected service hold karne ke liye observable variable
  var selectedService = Rxn<Map<String, dynamic>>();

  // Service select karne ka function
  void selectService(Map<String, dynamic> service) {
    selectedService.value = service;
  }

  // Back jane ka function
  void resetService() {
    selectedService.value = null;
  }

  @override
  void onClose() {
    videoController.dispose();
    super.onClose();
  }
}