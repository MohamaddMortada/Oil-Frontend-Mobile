import 'package:flutter/material.dart';
import 'package:oil_frontend_mobile/core/services/auth.dart';
import 'package:oil_frontend_mobile/widgets/icon_button.dart';

class AppleGoogleFacebook extends StatelessWidget {
  const AppleGoogleFacebook({super.key});

  @override
  Widget build(BuildContext context) {
    AuthService authService = AuthService();
    return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(onTap: (){authService.registerWithGoogle();},
                child: IconImageButton(url: 'assets/Group.png'),),
              
              IconImageButton(url: 'assets/google.png'),
              IconImageButton(url: 'assets/2021_Facebook_icon 1.png'),

            ],);
  }
}