import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:foodshopapp/style/style.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: [
          IconButton(
          onPressed: () async {
    await FirebaseAuth.instance.signOut();
    SuccessToast("You are now logged Out");

    Navigator.pushNamed(context, "/login_screen");
    },
      icon: Icon(Icons.logout_outlined,color: Colors.purple,),
    ),]
      ),
      body: Center(
        child: Container(
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
      ),
    );
  }
}
