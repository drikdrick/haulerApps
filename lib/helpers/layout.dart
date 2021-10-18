import 'package:bokshaul_haulier/helpers/text_style.dart';
import 'package:flutter/material.dart';

double layoutHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double layoutWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

void navigateTo(BuildContext context, tujuan) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => tujuan,
    ),
  );
}

void fixedTo(BuildContext context, tujuan) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => tujuan,
    ),
  );
}

void displayResponse(BuildContext context, Color color, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: color,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      behavior: SnackBarBehavior.floating,
      content: Text(
        text,
        style: kHeadline,
      ),
    ),
  );
}

void dissmissBoard(BuildContext context) {
  FocusScope.of(context).unfocus();
}

Widget showLoading(BuildContext context, bool isLoading) {
  return Visibility(
    visible: isLoading,
    child: Container(
      width: layoutWidth(context),
      height: layoutHeight(context),
      color: Colors.blueGrey.withOpacity(0.5),
      child: const Center(
        child: CircularProgressIndicator(
          strokeWidth: 50,
          semanticsLabel: "Loading...",
          semanticsValue: "Loading...",
        ),
      ),
    ),
  );
}
