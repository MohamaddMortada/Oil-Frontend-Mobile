import 'package:flutter/material.dart';
import 'package:oil_frontend_mobile/core/services/auth.dart';
import 'package:oil_frontend_mobile/widgets/icon_button.dart';

class AppleGoogleFacebook extends StatelessWidget {
  final VoidCallback? ontap;
  const AppleGoogleFacebook({super.key, this.ontap});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: ontap,
          child: IconImageButton(url: 'assets/Group.png'),
        ),

        GestureDetector(
          onTap: ontap,
          child: IconImageButton(url: 'assets/google.png'),
        ),
        GestureDetector(
          onTap: ontap,
          child: IconImageButton(url: 'assets/2021_Facebook_icon 1.png'),
        ),
      ],
    );
  }
}
