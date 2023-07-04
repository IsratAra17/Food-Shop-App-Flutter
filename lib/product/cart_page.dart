import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodshopapp/product/controller/cart_controller.dart';
import 'package:foodshopapp/style/style.dart';

import 'package:get/get.dart';

class CartPage extends StatefulWidget {


  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  CartController cartController=Get.put(CartController());





  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: GetBuilder<CartController>(
          builder: (c){
            return Text("Total item is ${cartController.cartList!.length}");
          },
        )
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(child:

          GetBuilder<CartController>(
            builder: (c){
              return   ListView.builder(
                  itemCount: cartController.cartList!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: EdgeInsets.all(5),
                      elevation: 5,
                      shadowColor: colorYellow,
                      child: Container(
                        padding: EdgeInsets.all(5),
                        height: 80,
                        child:Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.network("${cartController.cartList![index].image}", width:80,height: 80,
                              fit: BoxFit.cover,
                            ),
                            Text("${cartController.cartList![index].name}",style: AppText16Style(colorOrange),),
                            Text("${cartController.cartList![index].price! * cartController.cartList![index].quantity}",style: AppText16Style(Colors.blue),),

                            Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    cartController.cartList![index].quantity >0? cartController.cartList![index].quantity-- :cartController.cartList!.removeAt(index);
                                    cartController.getTotal();


                                  },
                                  child: Icon(Icons.remove_circle_outline,color: colorRed,),
                                ),
                                Text("${cartController.cartList![index].quantity}",style: AppText16Style(Colors.black),),

                                InkWell(
                                  onTap: (){
                                    cartController.incrementQuantity(index);
                                    cartController.getTotal();

                                  },
                                  child: Icon(Icons.add_circle_outline_outlined,color: Colors.green,),
                                ),

                                InkWell(
                                  onTap: (){
                                    cartController.removeFromCart(index);
                                    cartController.getTotal();

                                  },
                                  child: Icon(Icons.delete,color: Colors.indigo,),
                                ),

                              ],
                            )

                          ],
                        ) ,
                      ),
                    );
                  });
            },
          ),


            ),
            GetBuilder<CartController>(builder: (c){return Container(
              height: 50,
              color: Colors.blue,
              child: Text("Total price is  ${cartController.netTotal ??0}",),
            );})
          ],
        ),
      ),
    ));
  }
}
