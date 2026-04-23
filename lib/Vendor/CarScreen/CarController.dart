

import 'package:get/get.dart';

class CarController extends GetxController {
  var currentPrice = 200.0.obs;

  void updatePrice(double value) {
    currentPrice.value = value;
  }

  // Dropdown States
  var selectedBrand = "".obs;
  var selectMake = "".obs;
  var selectedModel = "".obs;
  var selectedBody = "".obs;
  var selectedTrans = "".obs;
  var selectedFuel = "".obs;
  var selectedSeats = "".obs;
  var selectedEngine = "".obs;
  var selectedYear = "".obs;
  var openedDropdown3 = "".obs;
  final RxInt currentPage3 = 1.obs;
  final RxInt pageSize3 = 5.obs;

  int get totalPages => 1;

  void goToPreviousPage() {}
  void goToNextPage() {}
  void goToPage(int page) {}
  void setPageSize(int newSize) {
    pageSize3.value = newSize;
  }

  // UI Control
  var searchCarText = "".obs;

  // Static Data
  final List<String> allBrands = ["Toyota", "Honda", "Nissan", "MG", "BYD", "Kia"];
  final Map<String, List<String>> brandModels = {
    "Toyota": ["Yaris Cross", "Corolla", "Camry"],
    "Honda": ["HR-V", "Civic", "CR-V"],
    "Nissan": ["Rogue", "Altima", "Leaf"],
  };
  final List<String> bodyTypes = ["Sedan", "SUV", "Hatchback", "Coupe", "Wagon", "Convertible", "Van", "Truck"];
  final List<String> transmissions = ["Automatic", "Manual"];
  final List<String> fuelTypes = ["Petrol", "Diesel", "Hybrid", "Electric"];
  final List<String> seatOptions = ["2", "4", "5", "7"];
  final List<String> engineOptions = ["0.8", "1.0", "1.2", "1.5", "2.0"];
  final List<String> yearOptions = ["2018", "2019", "2020", "2021", "2022", "2023", "2024"]; // As per your SS

  List<String> getFilteredItems(String id, dynamic selectedMake) {
    List<String> currentList = [];
    switch (id) {
      case 'Make': currentList = allBrands; break;
      case 'Model':
        currentList = selectedMake.value.isEmpty
            ? []
            : (brandModels[selectedMake.value] ?? []);
        break;
      case 'body': currentList = bodyTypes; break;
      case 'trans': currentList = transmissions; break;
      case 'fuel': currentList = fuelTypes; break;
      case 'seats': currentList = seatOptions; break;
      case 'engine': currentList = engineOptions; break;
      case 'year': currentList = yearOptions; break;
      default: currentList = [];
    }
    if (searchCarText.value.isEmpty) return currentList;
    return currentList.where((item) => item.toLowerCase().contains(searchCarText.value.toLowerCase().trim())).toList();
  }
}