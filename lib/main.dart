import 'package:bokshaul_haulier/screens/authentication/login_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Nunito',
        splashColor: Colors.blue,
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white.withOpacity(0.95),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder:
              const OutlineInputBorder(borderSide: BorderSide(color: Colors.blueGrey)),
          focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.blue),
              borderRadius: BorderRadius.circular(15)),
          errorBorder:
              const OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red),
            borderRadius: BorderRadius.circular(15),
          ),
          
        ),
      ),
      home: const LoginScreen(),
    );
  }
}