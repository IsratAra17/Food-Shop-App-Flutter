import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodshopapp/model/productmodel.dart';
import 'package:foodshopapp/product/controller/cart_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../style/style.dart';

class Product_Page extends StatefulWidget {
  const Product_Page({Key? key}) : super(key: key);

  @override
  State<Product_Page> createState() => _Product_PageState();
}

class _Product_PageState extends State<Product_Page> {
  CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: GetBuilder<CartController>(
        builder: (controoler) {
          return Text("toatl cart item is ${cartController.cartList.length}");
        },
      )),
      body: Container(
        padding: EdgeInsets.all(0),
        child: Column(
          children: [
            Expanded(
                child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 15,
                        childAspectRatio: 1.2),
                    shrinkWrap: true,
                    itemCount: productList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 5,
                        shadowColor: colorYellow,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("${productList[index].name}",style: AppText20Style(Colors.green),),

                            AspectRatio(
                              child: Image.network(
                                "${productList[index].image}",
                                fit: BoxFit.contain,

                              ),
                              aspectRatio: 2.0,
                            ),
                            SizedBox(height: 5,),
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("${productList[index].price}",style: AppText16Style(colorBlue),),
                                  InkWell(
                                    onTap: () {
                                      try {
                                        cartController.cartList.firstWhere(
                                            (element) =>
                                                element.id ==
                                                productList[index].id);
                                        var snackBar = SnackBar(
                                          content:
                                              Text('Already Added this item'),
                                        );
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(snackBar);
                                      } catch (e) {
                                        cartController
                                            .addToCart(productList[index]);
                                      }
                                    },
                                    child: Icon(Icons.shopping_basket,color: colorRed,),
                                  )
                                ],
                              ),
                            ),

                          ],
                        ),
                      );
                    })),

            // MaterialButton(onPressed: (){
            //   Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartPage(
            //
            //   )));
            // },
            //   child: Text("Go To Cart"),
            //   color: Colors.red,
            //   minWidth: double.infinity ,
            //   height: size.height *0.1 ,
            // )
          ],
        ),
      ),
    ));
  }
}
