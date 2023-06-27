import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foodshopapp/curved_bottom_navbar/NavScreen.dart';
import 'package:foodshopapp/main_food_screen/food_page_body.dart';
import 'package:foodshopapp/main_food_screen/main_food_page.dart';

import 'authentication_screens/login.dart';
import 'authentication_screens/registration.dart';
import 'home_screen.dart';
import 'important/constants.dart';

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

  runApp(MyApp('/NavScreen'));
}


class MyApp extends StatelessWidget {
  final String FirstRoute;
  MyApp(this.FirstRoute);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute:'/NavScreen',
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