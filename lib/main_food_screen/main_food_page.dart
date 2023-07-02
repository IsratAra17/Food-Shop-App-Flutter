import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodshopapp/appbar/appbar.dart';
import 'package:foodshopapp/main_food_screen/food_page_body.dart';
import 'package:foodshopapp/style/style.dart';

class MainFoodPage extends StatefulWidget {
  const MainFoodPage({Key? key}) : super(key: key);

  @override
  State<MainFoodPage> createState() => _MainFoodPageState();
}

class _MainFoodPageState extends State<MainFoodPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

height: double.infinity,
        margin: EdgeInsets.only(top: 15, bottom: 15),
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Column(

          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        "Bangladesh",
                        style: AppText16Style(colorLightBlue),
                      ),
                      Row(
                        children: [
                          Text(
                            "Dhaka",
                            style: AppText16Style(Colors.black),
                          ),
                          Icon(
                            Icons.location_on_outlined,
                            color: colorRed,
                          ),
                        ],
                      )
                    ],
                  ),
                  Expanded(flex: 4,
                    child: TextFormField(

                      decoration: InputDecoration(
                          suffixIcon: Icon(Icons.search,color: colorGreen,),
                          filled: true,
                          fillColor: colorWhite,
                          hintText: "Search anything...",
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ),

                ],
              ),
            ),
            SizedBox(height: 20,),
            FoodPageBody()
          ],
        ),
      ),
    );
  }
}
