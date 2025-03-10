import 'dart:io';

import 'package:oil_frontend_mobile/core/services/auth.dart';
import 'package:oil_frontend_mobile/providers/login_provider.dart';
import 'package:oil_frontend_mobile/providers/navigation_provider.dart';
import 'package:oil_frontend_mobile/screens/confirmation_page.dart';
import 'package:oil_frontend_mobile/screens/permissions_page.dart';
import 'package:oil_frontend_mobile/screens/register_page.dart';
import 'package:oil_frontend_mobile/widgets/continue_with.dart';
import 'package:oil_frontend_mobile/widgets/custom_button.dart';
import 'package:oil_frontend_mobile/widgets/custom_textfield.dart';
import 'package:oil_frontend_mobile/widgets/gradient_bar.dart';
import 'package:oil_frontend_mobile/widgets/icon_button.dart';
import 'package:oil_frontend_mobile/widgets/terms_and_conditions.dart';
import 'package:oil_frontend_mobile/widgets/text_button.dart';
import 'package:oil_frontend_mobile/widgets/toggle_phone_email.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:oil_frontend_mobile/utils/validations.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final authService = AuthService();

    void handleLogin() {
      if (loginProvider.isPhoneSelected) {
        if (!Validations.isValidPhoneNumber(loginProvider.phoneNumber)) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Please enter a valid phone number.")),
          );
          return;
        }
      } else {
        if (!Validations.isValidEmail(loginProvider.email)) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Please enter a valid email address."),
            ),
          );
          return;
        }
      }
      navigationProvider.navigateTo(context, const ConfirmationPage());
    }

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              const GradientBar(),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth > 600 ? 40 : 20,
                    vertical: constraints.maxWidth > 600 ? 50 : 35,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/logo outline 1.png',
                        width: constraints.maxWidth > 600 ? 200 : 150,
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Sign In',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      TogglePhoneEmail(
                        isPhoneSelected: loginProvider.isPhoneSelected,
                        onToggle: (index) {
                          loginProvider.toggleSelection(index);
                        },
                      ),
                      const SizedBox(height: 20),
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
                      const SizedBox(height: 20),
                      const TermsAndConditions(),
                      const SizedBox(height: 20),
                      CustomButton(text: 'Sign In', onTap: handleLogin),
                      const SizedBox(height: 20),
                       TextButtonGreen(
                        text: 'Continue as a guest',
                        onTap: ()=>{navigationProvider.navigateTo(context,  PermissionsPage())}),
                      const SizedBox(height: 20),
                      const ContinueWith(),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        if (Platform.isIOS) 
                          GestureDetector(
                              onTap: () {},
                              child: IconImageButton(url: 'assets/Group.png'),
                            ),
                        if (Platform.isIOS) 
                          const SizedBox(width: 15),
                          GestureDetector(
                            onTap: () {
                              authService.registerWithGoogle();
                            },
                            child: IconImageButton(url: 'assets/google.png'),
                          ),
                          const SizedBox(width: 15),
                          GestureDetector(
                            onTap: () {
                              authService.signInWithFacebook();
                            },
                            child: IconImageButton(
                              url: 'assets/2021_Facebook_icon 1.png',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:  [
                          Text("Don't have an account? "),
                          TextButtonGreen(text: 'Sign Up', onTap: () => {navigationProvider.navigateTo(context, RegisterPage())},),
                        ],
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
