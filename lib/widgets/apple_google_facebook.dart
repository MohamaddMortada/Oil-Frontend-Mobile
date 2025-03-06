import 'package:flutter/material.dart';
import 'package:oil_frontend_mobile/widgets/icon_button.dart';

class AppleGoogleFacebook extends StatelessWidget {
  const AppleGoogleFacebook({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              IconImageButton(url: 'assets/Group.png'),
              IconImageButton(url: 'assets/google.png'),
              IconImageButton(url: 'assets/2021_Facebook_icon 1.png'),

            ],);
  }
}