import 'package:flutter/material.dart';
import 'package:oil_frontend_mobile/widgets/app_bar.dart';
import 'package:oil_frontend_mobile/widgets/appointment_card.dart';
import 'package:oil_frontend_mobile/widgets/search_widget.dart';

class AppointmentsSummaryPage extends StatelessWidget {
  const AppointmentsSummaryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 28),
              child: Row(
                children: [Spacer(), Image.asset('assets/filter.png')],
              ),
            ),
            Column(
              children: [
                SizedBox(height: 30),
                CustomedAppBar(text: 'Appointments Summary'),
                SizedBox(height: 20),
                SearchWidget(),
                SizedBox(height: 20),
                AppointmentCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
