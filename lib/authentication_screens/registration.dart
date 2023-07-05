import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../style/style.dart';

class Registration_Screen extends StatefulWidget {
  const Registration_Screen({Key? key}) : super(key: key);

  @override
  State<Registration_Screen> createState() => _Registration_ScreenState();
}

class _Registration_ScreenState extends State<Registration_Screen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  Future registerWithEmailPass() async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
    ).then((value) => {FirebaseFirestore.instance
        .collection("users")
        .doc()
        .set({'name':_nameController.text.trim()})});
SuccessToast("Registerd Successfully!");
    // Navigator.pushNamed(context, "/NavScreen");
    Get.offNamed("/NavScreen");

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.amberAccent,
        padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Food Shop', style: AppText16Style(Colors.blue)),
            SizedBox(
              height: 1,
            ),
            Text('Eat Code & Eat', style: AppText16Style(colorRed)),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _nameController,
              decoration: AppInputDecoration("Your Name:"),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _emailController,
              decoration: AppInputDecoration("Email Address"),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _passwordController,
              decoration: AppInputDecoration("Password"),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: ElevatedButton(
                  style: AppButtonStyle(),
                  onPressed: () {
                    setState(() {
                      registerWithEmailPass();
                    });
                  },
                  child: SuccessButtonChild('Register')),
            ),
            SizedBox(height: 15,),
            InkWell(
              onTap: (){
                Get.toNamed("/login_screen");
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,

                children: [
                  Text("Already registerd?",style: AppText16Style(colorDarkBlue),),
                  Text(" Please Login",style: AppText16Style(Colors.blue),),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
