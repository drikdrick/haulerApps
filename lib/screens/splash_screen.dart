import 'package:bokshaul_haulier/components/function/login.dart';
import 'package:bokshaul_haulier/helpers/layout.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //Lama nya splashscreen
    Future.delayed(const Duration(milliseconds: 1000), () {
      checkLogin(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          'assets/images/boksman_logo.png',
          width: layoutWidth(context) / 2,
        ),
      ),
    );
  }
}
