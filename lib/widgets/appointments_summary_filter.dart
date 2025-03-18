import 'package:flutter/material.dart';
import 'package:oil_frontend_mobile/widgets/fliter_button.dart';
import 'package:oil_frontend_mobile/widgets/header_eleven.dart';
import 'package:oil_frontend_mobile/widgets/header_fourteen.dart';

class AppointmentsSummaryFilter extends StatelessWidget {
  const AppointmentsSummaryFilter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderEleven(text: 'Filters'),
            HeaderFourteen(text: 'Show'),
            Wrap(
              spacing: 8, 
              runSpacing: 8,
              children: [
                FilterButton(text: "All"),
                FilterButton(text: "Confirmed"),
                FilterButton(text: "Ongoing"),
                FilterButton(text: "Pending"),
                FilterButton(text: "Cancelled"),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
