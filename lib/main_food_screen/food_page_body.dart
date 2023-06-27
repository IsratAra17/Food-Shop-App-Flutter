import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foodshopapp/style/style.dart';

class FoodPageBody extends StatefulWidget {
  const FoodPageBody({Key? key}) : super(key: key);

  @override
  State<FoodPageBody> createState() => _FoodPageBodyState();
}

class _FoodPageBodyState extends State<FoodPageBody> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: EdgeInsets.only(left: 15.0),
      height: 320,
color: colorRed,
      child: PageView.builder(
          itemCount: 10,
          itemBuilder: (BuildContext context, position) {
            return _buildListItem(position);
          }),
    );
  }

  Widget _buildListItem(int index) {
    return Container(
      height: 220,
      margin: EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
        color: index.isEven?(colorOrange):(colorLightPink),
      ),
    );
  }
}
