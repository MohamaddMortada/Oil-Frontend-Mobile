import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool isPhoneSelected = true;
  String phoneNumber = "";
  String email = "";

  final PageController pageController = PageController();

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
}
