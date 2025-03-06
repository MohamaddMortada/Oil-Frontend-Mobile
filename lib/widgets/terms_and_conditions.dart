import 'package:oil_frontend_mobile/providers/navigation_provider.dart';
import 'package:oil_frontend_mobile/providers/register_provider.dart';
import 'package:oil_frontend_mobile/screens/privacy_policy_page.dart';
import 'package:oil_frontend_mobile/screens/terms_and_conditions_page.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    final navigationProvider = Provider.of<NavigationProvider>(context);
    final registerProvider = Provider.of<RegisterProvider>(context);

    return Row(
          children: [
            GestureDetector(
              onTap: () {
                registerProvider.setTermsAndConditions();
              },
              child: Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                  color:
                      registerProvider.isChecked
                          ? const Color.fromARGB(255, 51, 134, 54)
                          : Colors.transparent,
                  border: Border.all(
                    color: const Color.fromARGB(46, 0, 0, 0),
                    width: 2,
                  ),

                  borderRadius: BorderRadius.circular(8),
                ),
                child:
                    registerProvider.isChecked
                        ? const Icon(Icons.check, color: Colors.white, size: 20)
                        : null,
              ),
            ),

            SizedBox(width: 10),
            RichText(
              textAlign: TextAlign.start,
              text: TextSpan(
                style: TextStyle(fontSize: 12, color: Colors.black),
                children: [
                  TextSpan(text: "I've read and agree with the "),
                  TextSpan(
                    text: "Terms and Conditions",
                    style: TextStyle(
                      color: Color.fromARGB(255, 51, 134, 54),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {navigationProvider.navigateTo(context, TermsAndConditionsPage());},
                  ),
                  TextSpan(text: " and \nthe "),
                  TextSpan(
                    text: "Privacy Policy.",
                    style: TextStyle(
                      color: Color.fromARGB(255, 51, 134, 54),
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () {navigationProvider.navigateTo(context, PrivacyPolicyPage());},
                  ),
                ],
              ),
            ),
          ],
        );
      }
  }

