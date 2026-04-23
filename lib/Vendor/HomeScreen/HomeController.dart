

import 'package:carousel_slider/carousel_controller.dart' show CarouselSliderController;
import 'package:get/get.dart';

class HomeController extends GetxController {
  var searchCarText = "".obs;
  var openedDropdown3 = "".obs;
  var selectedBrand = "".obs;
  var selectedBodyType = "".obs;
  var selectedFuelType = "".obs;
  var selectedTransmission = "".obs;

  var currentTestimonialIndex = 0.obs;
  final CarouselSliderController carouselController = CarouselSliderController();

  final List<String> allBrands = ["Toyota", "Ford", "Tesla", "Volkswagen", "Honda", "BMW"];
  final List<String> allBodyTypes = ["SUV", "Crossover", "Wagon", "Family MPV", "Sport Coupe"];
  final List<String> allFuelTypes = ["Electric", "Diesel", "Petrol", "Hybrid"];
  final List<String> allTransmissions = ["Automatic", "Manual"];

  List<String> getFilteredItems(String id) {
    List<String> currentList = [];

    switch (id) {
      case 'brand':
        currentList = allBrands;
        break;
      case 'body_type':
        currentList = allBodyTypes;
        break;
      case 'fuel_type':
        currentList = allFuelTypes;
        break;
      case 'transmission':
        currentList = allTransmissions;
        break;
      default:
        currentList = [];
    }

    if (searchCarText.value.isEmpty) {
      return currentList;
    } else {
      return currentList
          .where((item) => item.toLowerCase().contains(searchCarText.value.toLowerCase()))
          .toList();
    }
  }

  void resetSearch() {
    searchCarText.value = "";
    openedDropdown3.value = "";
  }
}