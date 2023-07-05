import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodshopapp/curved_bottom_navbar/NavScreen.dart';
import 'package:foodshopapp/main_food_screen/food_page_body.dart';
import 'package:foodshopapp/main_food_screen/main_food_page.dart';
import 'package:get/get.dart';

import 'authentication_screens/login.dart';
import 'authentication_screens/registration.dart';
import 'home_screen.dart';
import 'important/constants.dart';
User? user;

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  if(kIsWeb){
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: Constants.apiKey,
            appId: Constants.appId,
            messagingSenderId: Constants.messagingSenderId,
            projectId: Constants.projectId));
  }

  else{
    await Firebase.initializeApp();
  }
  (user!=null)?runApp(MyApp('/NavScreen')):runApp(MyApp('/login_screen'));

}


class MyApp extends StatefulWidget {
  final String FirstRoute;
  MyApp(this.FirstRoute);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //saving login info
    user=FirebaseAuth.instance.currentUser;
  }
  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:'/login_screen',
      routes: {
        '/registration_screen': (context) =>Registration_Screen(),
        '/login_screen': (context) =>Login_Screen(),
        '/home_screen': (context) =>Home_Screen(),
        '/mainFoodpage': (context) =>MainFoodPage(),
        '/FoodPageBody': (context) =>FoodPageBody(),
        '/NavScreen': (context) =>NavDefaultScreen(),
      },
    );
  }
}