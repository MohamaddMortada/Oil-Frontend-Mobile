import 'package:oil_frontend_mobile/providers/otp_provider.dart';
import 'package:oil_frontend_mobile/widgets/custom_button.dart';
import 'package:oil_frontend_mobile/widgets/header_two.dart';
import 'package:oil_frontend_mobile/widgets/otp_input_field.dart';
import 'package:oil_frontend_mobile/widgets/text_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConfirmationPage extends StatelessWidget {
  const ConfirmationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final otpProvider = Provider.of<OTPProvider>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const HeaderTwo(text: 'Enter OTP Code'),
            const Text(
              "A 4-digit OTP code was sent via WhatsApp to",
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            Text(
              '+961 76 123 456',
              style: const TextStyle(
                  color: Color.fromARGB(255, 51, 134, 54),
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            Form(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(4, (index) {
                  return OTPInputField(index: index);
                }),
              ),
            ),

            const SizedBox(height: 20),

            const CustomButton(text: 'Send Via SMS'),

            const SizedBox(height: 20),

            GestureDetector(
              onTap: otpProvider.isResendDisabled ? null : otpProvider.resendOTP,
              child: TextButtonGreen(
                text: otpProvider.isResendDisabled
                    ? "Resend code in ${otpProvider.remainingTime}s"
                    : "Resend OTP",
              ),
            ),

            const Spacer(),
          ],
        ),
      ),
    );
  }
}
