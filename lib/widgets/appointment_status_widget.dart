import 'package:flutter/material.dart';
import 'package:oil_frontend_mobile/providers/appointment_status_provider.dart';
import 'package:oil_frontend_mobile/widgets/appointment_status_indicator.dart';
import 'package:oil_frontend_mobile/widgets/grey_line.dart';
import 'package:provider/provider.dart';

class AppointmentStatusWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AppointmentStatusProvider>(context);
    final totalWidth = MediaQuery.of(context).size.width * 0.9;

    return Column(children: [
    Container(
      width: totalWidth,
      height: 15,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: Colors.transparent, width: 1),
      ),
      child: Row(
        children: [
          Expanded(
            flex: (provider.completedPercentage * 100).toInt(),
            child: Container(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                ),
              ),
            ),
          ),
          Expanded(
            flex: (provider.cancelledPercentage * 100).toInt(),
            child: Container(color: Color(0xFFDD2424)),
          ),
          Expanded(
            flex: (provider.pendingPercentage * 100).toInt(),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFFF9A17),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                ),
              ),
            ),
          ),
        ],
      ),
    ),
    SizedBox(height: 20,),
    AppointmentStatusIndicator(color: Theme.of(context).primaryColor, label: "Completed", value: provider.completed),
    SizedBox(height: 20,),
    AppointmentStatusIndicator(color: Color(0xFFDD2424), label: "Cancelled", value: provider.cancelled),
    SizedBox(height: 20,),
    AppointmentStatusIndicator(color: Color(0xFFFF9A17), label: "Pending", value: provider.pending),
]);

  }
}
