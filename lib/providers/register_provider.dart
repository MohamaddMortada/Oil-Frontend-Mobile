import 'package:flutter/material.dart';

class RegisterProvider extends ChangeNotifier {
  bool isPhoneSelected = true;
  String firstName = "";
  String lastName = "";
  String phoneNumber = "";
  String email = "";
  bool isChecked = false;

  final PageController pageController = PageController();

  void setFirstName(String value) {
    firstName = value;
    notifyListeners();
  }

  void setLastName(String value) {
    lastName = value;
    notifyListeners();
  }

  void setPhoneNumber(String value) {
    phoneNumber = value;
    notifyListeners();
  }

  void setEmail(String value) {
    email = value;
    notifyListeners();
  }

  void toggleSelection(int index) {
    isPhoneSelected = (index == 0);
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeInOut,
    );
    notifyListeners();
  }
  void setTermsAndConditions(){
    isChecked = !isChecked;
    notifyListeners();
  }
}
