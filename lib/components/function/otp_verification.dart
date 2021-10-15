import 'dart:convert';

import 'package:bokshaul_haulier/components/function/config.dart';
import 'package:flutter/cupertino.dart';

import 'package:http/http.dart' as http;

Future<void> checkOtpRegistration(BuildContext context, String otpCode) async{
  Uri url = Uri.parse(base_url+'/verifikasi/otp');

  var response = await http.post(url, body: {'otp' : otpCode});
  final jsonResponse = jsonDecode(response.body);
  // if () {
    
  // }
}