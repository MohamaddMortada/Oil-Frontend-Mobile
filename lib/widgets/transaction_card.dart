import 'package:flutter/material.dart';
import 'package:oil_frontend_mobile/widgets/header_eight.dart';
import 'package:oil_frontend_mobile/widgets/header_five.dart';
import 'package:oil_frontend_mobile/widgets/transaction_value.dart';

class TransactionCard extends StatelessWidget {
  final String transactionDate;
  final String orderId;
  final String transactionValue;
  const TransactionCard({
    super.key,
    required this.transactionDate,
    required this.orderId,
    required this.transactionValue,
  });

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFFCCCCCC))
        )
      ),
      child: Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderFive(text: transactionDate),
            SizedBox(height: 10),
            HeaderEight(text: orderId),
          ],
        ),
        Spacer(),
        Column(children: [
          SizedBox(height: 25,),
        TransactionValue(text: transactionValue),])
      ],
    ));
  }
}
