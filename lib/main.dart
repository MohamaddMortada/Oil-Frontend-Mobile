import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:oil_frontend_mobile/providers/login_provider.dart';
import 'package:oil_frontend_mobile/providers/navigation_provider.dart';
import 'package:oil_frontend_mobile/providers/otp_provider.dart';
import 'package:oil_frontend_mobile/providers/register_provider.dart';
import 'package:oil_frontend_mobile/screens/register_page.dart';
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
        ChangeNotifierProvider(create: (context) => NavigationProvider()),
      ],
      child: const MainApp(),)
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),
    );
  }
}
