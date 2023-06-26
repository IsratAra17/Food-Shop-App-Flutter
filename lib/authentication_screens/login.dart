import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../style/style.dart';

class Login_Screen extends StatefulWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  State<Login_Screen> createState() => _Login_ScreenState();
}

class _Login_ScreenState extends State<Login_Screen> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();


  Future LoginWithEmailPass() async {


    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
    SuccessToast("Successfully Login");
    Navigator.pushNamed(context, "/mainFoodpage");
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

            Text('Food Shop', style: AppText20Style(Colors.blue)),
            SizedBox(
              height: 1,
            ),
            Text('Eat Code & Eat', style: AppText16Style(colorRed)),
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
                      LoginWithEmailPass();
                    });
                  },
                  child: SuccessButtonChild('Login')),
            ),
          ],
        ),
      ),
    );
  }
}
