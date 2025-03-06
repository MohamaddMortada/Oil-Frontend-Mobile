import 'package:flutter/material.dart';
import 'package:oil_frontend_mobile/widgets/app_bar.dart';
import 'package:oil_frontend_mobile/widgets/header_four.dart';
import 'package:oil_frontend_mobile/widgets/header_two.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            CustomedAppBar(text: 'Privacy Policy'),
            SizedBox(height: 10),
            HeaderTwo(text: 'First Privacy Policy'),
            HeaderFour(
              text:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam non auctor lectus. Phasellus eu sagittis sem.\n"
                  " • Ut ac nibh hendrerit, placerat purus at, viverra justo.\n"
                  " • Fusce eget dui risus.\n"
                  " • Sed in justo vel metus dignissim pellentesque.\n"
                  " • In vitae mauris eget eros sollicitudin facilisis.\n"
                  " • Nam sed tortor in eros rutrum varius.",
            ),

            HeaderTwo(text: 'Second Privacy Policy'),
            HeaderFour(
              text:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam non auctor lectus. Phasellus eu sagittis sem. ",
            ),

            HeaderTwo(text: 'Third Privacy Policy'),
            HeaderFour(
              text:
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam non auctor lectus. Phasellus eu sagittis sem.\n"
                  " • Ut ac nibh hendrerit, placerat purus at, viverra justo.\n"
                  " • Fusce eget dui risus.\n"
                  " • Sed in justo vel metus dignissim pellentesque.\n"
                  " • In vitae mauris eget eros sollicitudin facilisis.\n"
                  " • Nam sed tortor in eros rutrum varius.\n"
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam non auctor lectus. Phasellus eu sagittis sem.",
            ),
          ],
        ),
      ),
    );
  }
}
