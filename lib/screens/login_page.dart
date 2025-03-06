import 'package:oil_frontend_mobile/providers/login_provider.dart';
import 'package:oil_frontend_mobile/providers/navigation_provider.dart';
import 'package:oil_frontend_mobile/screens/confirmation_page.dart';
import 'package:oil_frontend_mobile/widgets/apple_google_facebook.dart';
import 'package:oil_frontend_mobile/widgets/continue_with.dart';
import 'package:oil_frontend_mobile/widgets/custom_button.dart';
import 'package:oil_frontend_mobile/widgets/custom_textfield.dart';
import 'package:oil_frontend_mobile/widgets/gradient_bar.dart';
import 'package:oil_frontend_mobile/widgets/terms_and_conditions.dart';
import 'package:oil_frontend_mobile/widgets/text_button.dart';
import 'package:oil_frontend_mobile/widgets/toggle_phone_email.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final navigationProvider = Provider.of<NavigationProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          GradientBar(),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 35, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset('assets/logo outline 1.png'),
                const Text(
                  'Sign In',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),

                TogglePhoneEmail(
                  isPhoneSelected: loginProvider.isPhoneSelected,
                  onToggle: (index) {
                    loginProvider.toggleSelection(index);
                  },
                ),

                SizedBox(
                  height: 50,
                  child: PageView(
                    controller: loginProvider.pageController,
                    onPageChanged: (index) {
                      loginProvider.toggleSelection(index);
                    },
                    children: [
                      CustomTextfield(
                        label: 'Phone Number',
                        onChanged: loginProvider.setPhoneNumber,
                      ),
                      CustomTextfield(
                        label: 'Email',
                        onChanged: loginProvider.setEmail,
                      ),
                    ],
                  ),
                ),

                const TermsAndConditions(),
                CustomButton(text: 'Sign In', onTap: ()=>{navigationProvider.navigateTo(context, ConfirmationPage())}),
                const TextButtonGreen(text: 'Continue as a guest'),
                const ContinueWith(),
                const AppleGoogleFacebook(),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Don't have an account? "),
                    TextButtonGreen(text: 'Sign Up'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
