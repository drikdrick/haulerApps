import 'dart:convert';

import '../function/config.dart';
import '../../models/order_detail_model.dart';
import '../../models/order_model.dart';
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

Future<List<Order>> fetchLimitedOrder() async {
  SharedPreferences _preferences = await SharedPreferences.getInstance();
  var userId = _preferences.getString("userId")!;
  Uri url = Uri.parse(baseUrl + "/orderberlangsung/limit/" + userId);
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

Future<OrderDetail> fetchDetailOrder(String orderId) async {
  Uri url = Uri.parse(baseUrl + "/orderberlangsung/detail/" + orderId);
  var response = await http.get(url);
  final jsonResponse = jsonDecode(response.body);
  if (jsonResponse["success"]) {
    return OrderDetail.fromJson(jsonResponse["data"][0]);
  } else {
    throw Exception(jsonResponse["messaage"]);
  }
}
