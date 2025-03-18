import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oil_frontend_mobile/providers/appointment_status_provider.dart';
import 'package:oil_frontend_mobile/providers/filter_provider.dart';
import 'package:oil_frontend_mobile/providers/location_provider.dart';
import 'package:oil_frontend_mobile/providers/login_provider.dart';
import 'package:oil_frontend_mobile/providers/navigation_provider.dart';
import 'package:oil_frontend_mobile/providers/notification_provider.dart';
import 'package:oil_frontend_mobile/providers/otp_provider.dart';
import 'package:oil_frontend_mobile/providers/register_provider.dart';
import 'package:oil_frontend_mobile/screens/employee/appointments_summary_page.dart';
import 'package:oil_frontend_mobile/screens/employee/home_page.dart';
import 'package:oil_frontend_mobile/screens/employee/profile_page.dart';
import 'package:oil_frontend_mobile/screens/employee/transactions_page.dart';
import 'package:oil_frontend_mobile/screens/login_page.dart';
import 'package:oil_frontend_mobile/screens/permissions_page.dart';
import 'package:oil_frontend_mobile/screens/register_page.dart';
import 'package:oil_frontend_mobile/widgets/appointments_summary_filter.dart';
import 'package:oil_frontend_mobile/widgets/fliter_button.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => RegisterProvider()),
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => OTPProvider()),
        ChangeNotifierProvider(create: (context) => LocationProvider()),
        ChangeNotifierProvider(create: (context) => AppointmentStatusProvider()),
        ChangeNotifierProvider(create: (context) => FilterProvider()),
        //ChangeNotifierProvider(create: (context) => NotificationProvider()),
        ChangeNotifierProvider(create: (context) => NavigationProvider()),
        
      ],
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF089247),
        secondaryHeaderColor: Color(0xFFF8F9FA),
      ),
      debugShowCheckedModeBanner: false,
      home: AppointmentsSummaryFilter(),
    );
  }
}
