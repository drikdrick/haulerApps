import 'dart:convert';

import 'package:bokshaul_haulier/components/function/config.dart';
import 'package:bokshaul_haulier/models/invoice_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<List<Invoice>> fetchPaidInvoiceList() async {
  SharedPreferences _preferences = await SharedPreferences.getInstance();
  var userId = _preferences.getString("userId");
  Uri url = Uri.parse(baseUrl + "/invoice/paid/" + userId!);
  final response = await http.get(url);
  final jsonResponse = jsonDecode(response.body);
  if (jsonResponse["success"]) {
    return (jsonResponse["data"] as List).map((e) => Invoice.fromJson(e)).toList();
  }else{
    throw Exception(jsonResponse["message"]);
  }
}