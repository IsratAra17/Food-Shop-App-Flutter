import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:foodshopapp/style/style.dart';

AppBar CustomAppBar(context) {
  return AppBar( backgroundColor:colorLightBlue,actions: [
    IconButton(
      onPressed: () async {
        await FirebaseAuth.instance.signOut();
        SuccessToast("You are now logged Out");

        Navigator.pushNamed(context, "/login_screen");
      },
      icon: Icon(
        Icons.logout_outlined,
        color: Colors.yellowAccent,
      ),
    ),
  ]);
}
