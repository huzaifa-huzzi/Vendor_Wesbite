


import 'package:country_picker/country_picker.dart' as cp;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Country {
  final String name;
  final String countryCode; // e.g., "AU", "PK"
  final String phoneCode;   // e.g., "61", "92"

  Country({
    required this.name,
    required this.countryCode,
    required this.phoneCode,
  });
}
class ContactUsController extends GetxController{

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final message = TextEditingController();

  var agreeToPrivacy = false.obs;

  void submitForm() {
    print("Form Submitted");
  }

  var isLoadingCountries = false.obs;

  final TextEditingController phoneController = TextEditingController();
  final TextEditingController searchController = TextEditingController();

  var selectedCountryName = 'Australia'.obs;
  var selectedCode = '+61'.obs;

  final List<Country> countryList = <Country>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadAllCountries();
  }

  void loadAllCountries() {
    isLoadingCountries.value = true;
    try {
      // cp.Country use karke package se data uthayenge
      List<cp.Country> allCountries = cp.CountryService().getAll();

      countryList.clear();
      for (var c in allCountries) {
        countryList.add(
          Country(
            name: c.name,
            countryCode: c.countryCode,
            phoneCode: c.phoneCode,     // Dial code (e.g., 1, 92)
          ),
        );
      }

      // Default value set karna
      if (!countryList.any((c) => c.name == selectedCountryName.value)) {
        if (countryList.isNotEmpty) {
          selectedCountryName.value = countryList.first.name;
          selectedCode.value = "+${countryList.first.phoneCode}";
        }
      }
    } catch (e) {
      debugPrint("Error loading countries: $e");
    } finally {
      isLoadingCountries.value = false;
    }
  }

  @override
  void onClose() {
    phoneController.dispose();
    searchController.dispose();
    super.onClose();
  }

}