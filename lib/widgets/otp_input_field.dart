import 'package:oil_frontend_mobile/providers/otp_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OTPInputField extends StatelessWidget {
  final int index;
  const OTPInputField({Key? key, required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final otpProvider = Provider.of<OTPProvider>(context);

    return SizedBox(
      width: 50,
      child: TextField(
        controller: otpProvider.controllers[index],
        focusNode: otpProvider.focusNodes[index],
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        maxLength: 1,
        cursorColor: Theme.of(context).primaryColor,
        style: const TextStyle(fontSize: 24),
        decoration: InputDecoration(
          counterText: "",
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 2),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onChanged: (value) {
          otpProvider.setOTPValue(index, value);
        },
      ),
    );
  }
}
