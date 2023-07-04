
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../style/style.dart';



BottomNavigationBar appBottomNav(currentIndex,onTapItem,label){
  return BottomNavigationBar(
    currentIndex: currentIndex,
    selectedItemColor: Colors.black,
    unselectedItemColor: Colors.blue,
    onTap:onTapItem ,
    items: [
      BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.category),label: "category"),
      BottomNavigationBarItem(icon: Icon(Icons.radar),label: "Product"),
      BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: "Order"),
      BottomNavigationBarItem(icon: Icon(Icons.person),label: "Profile"),
    ],
  );
}





CurvedNavigationBar appCurvedNavbar(ontapItem){
  return CurvedNavigationBar(
    onTap: ontapItem,
    animationCurve: Curves.easeIn,
    backgroundColor: colorYellow,
    //buttonBackgroundColor: colorBlue,
    color: colorWhite,

    items: [
      Icon(Icons.home,semanticLabel: "Home",color: colorBlue,),
      Icon(Icons.fastfood_outlined,semanticLabel: "Product",color: colorRed,),
      Icon(Icons.category,semanticLabel: "Category",color: colorGreen,),
      Icon(Icons.shopping_cart,semanticLabel: "Order",color: Colors.lightBlue,),
      Icon(Icons.person,semanticLabel: "Profile",color: Colors.deepPurple,),
    ],
  );
}
