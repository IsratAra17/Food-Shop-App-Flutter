import 'package:flutter/material.dart';

class Product_Page extends StatefulWidget {
  const Product_Page({Key? key}) : super(key: key);

  @override
  State<Product_Page> createState() => _Product_PageState();
}

class _Product_PageState extends State<Product_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Text("This is Product"),

    );
  }
}
