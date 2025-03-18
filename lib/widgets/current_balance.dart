import 'package:flutter/material.dart';
import 'package:oil_frontend_mobile/widgets/header_four.dart';
import 'package:oil_frontend_mobile/widgets/header_seven.dart';
import 'package:oil_frontend_mobile/widgets/header_six.dart';
import 'package:oil_frontend_mobile/widgets/text_button.dart';

class CurrentBalance extends StatelessWidget {
  const CurrentBalance({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Theme.of(context).secondaryHeaderColor,
      ),
      child: Row(
        children: [
          HeaderSeven(text: 'USD'),
          SizedBox(width: 15),
          HeaderSix(text: '5.90'),
          Spacer(),
          TextButtonGreen(text: 'View Details'),
        ],
      ),
    );
  }
}
