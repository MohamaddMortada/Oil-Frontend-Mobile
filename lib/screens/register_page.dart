import 'package:flutter/material.dart';
import 'package:oil_frontend_mobile/core/services/auth.dart';
import 'package:oil_frontend_mobile/utils/validations.dart';
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
import '../widgets/apple_google_facebook.dart';

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
            SnackBar(content: Text("Please enter a valid phone number.")),
          );
          return;
        }
      } else {
        if (!Validations.isValidEmail(registerProvider.email)) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Please enter a valid email address.")),
          );
          return;
        }
      }
      if (!registerProvider.isChecked) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
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
            registerProvider.isPhoneSelected
                ? registerProvider.phoneNumber
                : null,
        firstName: registerProvider.firstName,
        lastName: registerProvider.lastName,
      );

      if (success) {
        navigationProvider.navigateTo(context, ConfirmationPage());
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Registration failed. Please try again.")),
        );
      }
    }

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
                  'Sign Up',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),

                TogglePhoneEmail(
                  isPhoneSelected: registerProvider.isPhoneSelected,
                  onToggle: (index) {
                    registerProvider.toggleSelection(index);
                  },
                ),

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

                const TermsAndConditions(),
                CustomButton(text: 'Sign Up', onTap: handleRegister),
                TextButtonGreen(
                  text: 'Continue as a guest',
                  onTap:
                      () => {
                        navigationProvider.navigateTo(
                          context,
                          PermissionsPage(),
                        ),
                      },
                ),
                const ContinueWith(),
                const AppleGoogleFacebook(),
                const SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Already have an account? '),
                    TextButtonGreen(text: 'Sign In'),
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
