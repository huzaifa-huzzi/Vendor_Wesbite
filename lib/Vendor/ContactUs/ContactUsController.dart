


import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContactUsController extends GetxController{

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final email = TextEditingController();
  final phone = TextEditingController();
  final message = TextEditingController();

  var agreeToPrivacy = false.obs;

  void submitForm() {
    // Logic for submitting form
    print("Form Submitted");
  }


}