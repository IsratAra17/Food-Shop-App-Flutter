import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodshopapp/style/style.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(child:
Column(
  children: [

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
                Navigator.pushNamed(context, "/login_screen");
              });
            },
            child: SuccessButtonChild('Login'),
          ),
        ),
        ]
      ),

)

    );
  }
}
