import 'dart:convert';

import 'package:bokshaul_haulier/components/function/config.dart';
import 'package:bokshaul_haulier/models/order_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

Future<List<Order>> fetchFinishedOrder() async {
  SharedPreferences _preferences = await SharedPreferences.getInstance();
  var userId = _preferences.getString("userId")!;
  Uri url = Uri.parse(baseUrl + "/orderselesai/" + userId);
  var response = await http.get(url);
  final jsonResponse = jsonDecode(response.body);

  if (jsonResponse["success"]) {
    return (jsonResponse["data"] as List)
        .map((e) => Order.fromJson(e))
        .toList();
  } else {
    throw Exception(jsonResponse["message"]);
  }
}

Future<List<Order>> fetchPendingOrder() async {
  SharedPreferences _preferences = await SharedPreferences.getInstance();
  var userId = _preferences.getString("userId")!;
  Uri url = Uri.parse(baseUrl + "/ordermenunggu/" + userId);
  var response = await http.get(url);
  final jsonResponse = jsonDecode(response.body);

  if (jsonResponse["success"]) {
    return (jsonResponse["data"] as List)
        .map((e) => Order.fromJson(e))
        .toList();
  } else {
    throw Exception(jsonResponse["message"]);
  }
}

Future<List<Order>> fetchCurrentOrder() async {
  SharedPreferences _preferences = await SharedPreferences.getInstance();
  var userId = _preferences.getString("userId")!;
  Uri url = Uri.parse(baseUrl + "/orderberlangsung/" + userId);
  var response = await http.get(url);
  final jsonResponse = jsonDecode(response.body);

  if (jsonResponse["success"]) {
    return (jsonResponse["data"] as List)
        .map((e) => Order.fromJson(e))
        .toList();
  } else {
    throw Exception(jsonResponse["message"]);
  }
}
