import 'dart:async';
import 'package:flutter/material.dart';

class OTPProvider extends ChangeNotifier {
  List<TextEditingController> controllers =
      List.generate(4, (index) => TextEditingController());
  List<FocusNode> focusNodes =
      List.generate(4, (index) => FocusNode()); 

  bool isResendDisabled = true;
  int remainingTime = 60;
  Timer? _timer;

  OTPProvider() {
    startTimer();
  }

  void setOTPValue(int index, String value) {
    if (value.isNotEmpty && index < 3) {
      FocusScope.of(focusNodes[index].context!).nextFocus();
    }
    notifyListeners();
  }

  void startTimer() {
    isResendDisabled = true;
    remainingTime = 60;
    notifyListeners();

    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        remainingTime--;
        notifyListeners();
      } else {
        isResendDisabled = false;
        _timer?.cancel();
        notifyListeners();
      }
    });
  }

  void resendOTP() {
    if (!isResendDisabled) {
      startTimer();
    }
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    for (var focusNode in focusNodes) {
      focusNode.dispose();
    }
    _timer?.cancel();
    super.dispose();
  }
}
