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

    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                registerProvider.setTermsAndConditions();
              },
              child: Container(
                width: constraints.maxWidth > 600 ? 40 : 30,
                height: constraints.maxWidth > 600 ? 40 : 30,
                decoration: BoxDecoration(
                  color: registerProvider.isChecked
                      ? const Color.fromARGB(255, 51, 134, 54)
                      : Colors.transparent,
                  border: Border.all(
                    color: const Color.fromARGB(46, 0, 0, 0),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: registerProvider.isChecked
                    ? Icon(Icons.check, color: Colors.white, size: constraints.maxWidth > 600 ? 25 : 20)
                    : null,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: RichText(
                textAlign: TextAlign.start,
                text: TextSpan(
                  style: TextStyle(
                    fontSize: constraints.maxWidth > 600 ? 16 : 12,
                    color: Colors.black,
                  ),
                  children: [
                    const TextSpan(text: "I've read and agree with the "),
                    TextSpan(
                      text: "Terms and Conditions ",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 51, 134, 54),
                        fontWeight: FontWeight.bold,
                        fontSize: constraints.maxWidth > 600 ? 18 : 14,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          navigationProvider.navigateTo(context, const TermsAndConditionsPage());
                        },
                    ),
                    const TextSpan(text: "and the "),
                    TextSpan(
                      text: "Privacy Policy.",
                      style: TextStyle(
                        color: const Color.fromARGB(255, 51, 134, 54),
                        fontWeight: FontWeight.bold,
                        fontSize: constraints.maxWidth > 600 ? 18 : 14,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          navigationProvider.navigateTo(context, const PrivacyPolicyPage());
                        },
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
