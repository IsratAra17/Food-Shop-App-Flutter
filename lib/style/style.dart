import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
const colorYellow=Color.fromRGBO(255, 192, 0, 1);
const colorRed = Color.fromRGBO(231, 28, 36, 1);
const colorDark = Color.fromRGBO(136, 28, 32, 1);
const colorGreen = Color.fromRGBO(33, 191, 115, 1);
const colorBlue = Color.fromRGBO(52, 152, 219, 1.0);
const colorOrange = Color.fromRGBO(230, 126, 34, 1.0);
const colorWhite = Color.fromRGBO(255, 255, 255, 1.0);
const colorDarkBlue = Color.fromRGBO(44, 62, 80, 1.0);
const colorLightGray = Color.fromRGBO(135, 142, 150, 1.0);
const colorLight = Color.fromRGBO(211, 211, 211, 1.0);
const colorLightPink = Color.fromRGBO(255, 231, 211,1);
const colorLightBlue = Color.fromRGBO(106, 199, 188,1);
const colorLightYellow = Color.fromRGBO(255, 210, 109,1);


TextStyle ButtonTextStyle() {
  return TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'poppins',
    fontSize: 14,
    color: Colors.white
  );
}
TextStyle AppText16Style() {
  return TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'poppins',
    fontSize: 16,
    color: Colors.black
  );
}
TextStyle AppText28Style() {
  return TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'poppins',
    fontSize: 28,
  );
}
TextStyle AppText9Style() {
  return TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'poppins',
    fontSize: 9,
  );
}

void SuccessToast(msg) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: colorGreen,
      textColor: colorWhite,
      fontSize: 16.0);
}

void ErrorToast(msg) {
  Fluttertoast.showToast(
    msg: msg,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: colorRed,
    textColor: colorWhite,
    fontSize: 16.0,
  );
}
InputDecoration AppInputDecoration(label) {
  return InputDecoration(
    focusedBorder: const OutlineInputBorder(
      borderSide: const BorderSide(color: colorRed, width: 1),
    ),
    fillColor: colorWhite,
    filled: true,
    contentPadding: EdgeInsets.fromLTRB(20, 10, 10, 20),
    enabledBorder: const OutlineInputBorder(
      borderSide: const BorderSide(color: colorGreen, width: 1.0),
    ),
    border: OutlineInputBorder(),
    labelText: label,
  );
}

ButtonStyle AppButtonStyle() {
  return ElevatedButton.styleFrom(
      elevation: 1,
      padding: EdgeInsets.zero,
      backgroundColor: Colors.transparent,
      textStyle: ButtonTextStyle(),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)));
}
Ink SuccessButtonChild(String ButtonText) {
  return Ink(
    decoration: BoxDecoration(
        color: Colors.green, borderRadius: BorderRadius.circular(6)),
    child: Container(
      height: 45,
      alignment: Alignment.center,
      child: Text(
        ButtonText,
        style: ButtonTextStyle(),
      ),
    ),
  );
}