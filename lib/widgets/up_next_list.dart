import 'package:flutter/material.dart';
import 'package:oil_frontend_mobile/widgets/header_four.dart';
import 'package:oil_frontend_mobile/widgets/order_card.dart';

class UpNextList extends StatelessWidget {
  const UpNextList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
      HeaderFour(text: 'Tuesday, Jan 4'),
      OrderCard(image: 'assets/Avatar.png', clientName: 'Maria Manuela', orderTime: '08:00 AM'),
      OrderCard(image: 'assets/Avatar.png', clientName: 'Alice Borgez', orderTime: '08:00 PM'),
      HeaderFour(text: 'Thursday, Jan 6'),
      OrderCard(image: 'assets/Avatar.png', clientName: 'Antônio Atez', orderTime: '11:00 AM'),
    ],);
  }
}