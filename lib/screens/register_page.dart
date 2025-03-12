import 'dart:io';
import 'package:flutter/material.dart';
import 'package:oil_frontend_mobile/core/services/auth.dart';
import 'package:oil_frontend_mobile/screens/login_page.dart';
import 'package:oil_frontend_mobile/utils/validations.dart';
import 'package:oil_frontend_mobile/widgets/icon_button.dart';
import 'package:provider/provider.dart';
import 'package:oil_frontend_mobile/providers/navigation_provider.dart';
import 'package:oil_frontend_mobile/providers/register_provider.dart';
import 'package:oil_frontend_mobile/screens/confirmation_page.dart';
import 'package:oil_frontend_mobile/screens/permissions_page.dart';
import 'package:oil_frontend_mobile/widgets/toggle_phone_email.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_textfield.dart';
import '../widgets/text_button.dart';
import '../widgets/gradient_bar.dart';
import '../widgets/terms_and_conditions.dart';
import '../widgets/continue_with.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    final registerProvider = Provider.of<RegisterProvider>(context);
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final authService = AuthService();

    void handleRegister() async {
      if (registerProvider.isPhoneSelected) {
        if (!Validations.isValidPhoneNumber(registerProvider.phoneNumber)) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Please enter a valid phone number.")),
          );
          return;
        }
      } else {
        if (!Validations.isValidEmail(registerProvider.email)) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Please enter a valid email address.")),
          );
          return;
        }
      }
      if (!registerProvider.isChecked) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Please accept Terms and Conditions and Privacy Policy.",
            ),
          ),
        );
        return;
      }

      bool success = await authService.register(
        email: registerProvider.isPhoneSelected ? null : registerProvider.email,
        phone:
            registerProvider.isPhoneSelected ? registerProvider.phoneNumber : null,
        firstName: registerProvider.firstName,
        lastName: registerProvider.lastName,
      );

      if (success) {
        navigationProvider.navigateTo(context, const ConfirmationPage());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Registration failed. Please try again.")),
        );
      }
    }

    return Scaffold(
      body: Stack(
        children: [
          const GradientBar(),
          LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: constraints.maxWidth > 600 ? 80 : 20,
                  vertical: 35,
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
                      'Sign Up',
                      style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 20),
                    TogglePhoneEmail(
                      isPhoneSelected: registerProvider.isPhoneSelected,
                      onToggle: (index) {
                        registerProvider.toggleSelection(index);
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: CustomTextfield(
                            label: 'First Name',
                            onChanged: registerProvider.setFirstName,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: CustomTextfield(
                            label: 'Last Name',
                            onChanged: registerProvider.setLastName,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 50,
                      child: PageView(
                        controller: registerProvider.pageController,
                        onPageChanged: (index) {
                          registerProvider.toggleSelection(index);
                        },
                        children: [
                          CustomTextfield(
                            label: 'Phone Number',
                            onChanged: registerProvider.setPhoneNumber,
                          ),
                          CustomTextfield(
                            label: 'Email',
                            onChanged: registerProvider.setEmail,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    const TermsAndConditions(),
                    const SizedBox(height: 20),
                    CustomButton(
                      text: 'Sign Up',
                      onTap: handleRegister,
                    ),
                    const SizedBox(height: 10),
                    TextButtonGreen(
                      text: 'Continue as a guest',
                      onTap: () => navigationProvider.navigateTo(
                        context,
                        const PermissionsPage(),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const ContinueWith(),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        if (Platform.isIOS) 
                          GestureDetector(
                            onTap: () {authService.signInWithApple();},
                            child: IconImageButton(url: 'assets/Group.png'),
                          ),
                        if (Platform.isIOS) const SizedBox(width: 15),
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
                      children: [
                        const Text('Already have an account? '),
                        TextButtonGreen(
                          text: 'Sign In',
                          onTap: () => navigationProvider.navigateTo(
                            context,
                            const LoginPage(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
