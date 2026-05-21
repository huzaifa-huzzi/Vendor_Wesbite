

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


  /// ---------- Services States ---------- ///

  // 1. General Maintenance State
  var selectedService = Rxn<Map<String, dynamic>>();

  void selectService(Map<String, dynamic> service) {
    selectedService.value = service;
  }

  void resetService() {
    selectedService.value = null;
  }

  // 2. Engine Services State
  var selectedEngineService = Rxn<Map<String, dynamic>>();

  void selectEngineService(Map<String, dynamic> service) {
    selectedEngineService.value = service;
  }

  void resetEngineService() {
    selectedEngineService.value = null;
  }

  // 3. Brake Services
  var selectedBrakeService = Rxn<Map<String, dynamic>>();

  void selectBrakeService(Map<String, dynamic> service) {
    selectedBrakeService.value = service;
  }

  void resetBrakeService() {
    selectedBrakeService.value = null;
  }
  // 4. Tyre Services State
  var selectedTyreService = Rxn<Map<String, dynamic>>();

  void selectTyreService(Map<String, dynamic> service) {
    selectedTyreService.value = service;
  }

  void resetTyreService() {
    selectedTyreService.value = null;
  }

  // 5. AC Services State Management
  var selectedAcService = Rxn<Map<String, dynamic>>();

  void selectAcService(Map<String, dynamic> service) {
    selectedAcService.value = service;
  }

  void resetAcService() {
    selectedAcService.value = null;
  }

  @override
  void onClose() {
    videoController.dispose();
    super.onClose();
  }
}