import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:foodshopapp/adminProfilePage.dart';
import 'package:foodshopapp/appbar/appbar.dart';
import 'package:foodshopapp/curved_bottom_navbar/appbottomNav.dart';
import 'package:foodshopapp/feedback/showFeedback.dart';
import 'package:foodshopapp/home_screen.dart';
import 'package:foodshopapp/main_food_screen/main_food_page.dart';

import 'package:foodshopapp/oderPage.dart';
import 'package:foodshopapp/product/cart_page.dart';
import 'package:foodshopapp/product/productPage.dart';
import 'package:foodshopapp/view_category.dart';


class NavDefaultScreen extends StatefulWidget {
  const NavDefaultScreen({Key? key}) : super(key: key);

  @override
  State<NavDefaultScreen> createState() => _NavDefaultScreenState();
}

class _NavDefaultScreenState extends State<NavDefaultScreen> {

  List<Widget> pages=[
    MainFoodPage(),
    Product_Page(),
    Category_page(),
    CartPage(),
    Admin_Profile_Page(),
    Show_Feedback()
  ];
  int TabIndex = 0;

  onItemTapped(int index) {
    setState(() {
      TabIndex = index;
      print("Curr index: $TabIndex");
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context),

      body: Container(child: pages[TabIndex],),


      bottomNavigationBar: appCurvedNavbar(onItemTapped),
    );
  }
}
