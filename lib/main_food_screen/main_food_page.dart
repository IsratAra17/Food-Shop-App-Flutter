import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
        margin: EdgeInsets.only(top: 45,bottom: 15),
padding: EdgeInsets.only(left: 20,right: 20),
        child: Column(
          children: [
            Container(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(children: [
                    Text("Bangladesh",style: AppText20Style(colorLightBlue),),
                    Row(
                      children: [
                        Text("Dhaka",style: AppText16Style(Colors.black),),
                        Icon(Icons.location_on_outlined,color: colorRed,),

                      ],
                    )
                  ],),
                AppBoxDecoration(50, 80, Icon(Icons.search,color: colorWhite))

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
