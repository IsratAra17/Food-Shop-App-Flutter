import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodshopapp/main.dart';
import 'package:foodshopapp/model/productmodel.dart';
import 'package:foodshopapp/product/controller/cart_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';

import '../style/style.dart';
import 'cart_page.dart';

class Product_Page extends StatefulWidget {
  const Product_Page({Key? key}) : super(key: key);

  @override
  State<Product_Page> createState() => _Product_PageState();
}

class _Product_PageState extends State<Product_Page> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('foodshop').snapshots();

  var cartid, cartname, cartprice;
  CartController cartController = Get.put(CartController());

  sendDataFirestore(id, foodname, price) async {

    User? currentuser = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection("users")
        .doc(currentuser?.email)
        .collection("cartItem")
        .doc()
        .set({
      'id': cartid.text.trim(),
      'itemName': cartname.text.trim(),
      'price': cartprice.text.trim()
    });

    SuccessToast("Add to cart Successful!");
print("User: ${currentuser?.email}");

  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
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
                            Text(
                              "${productList[index].name}",
                              style: AppText16Style(Colors.green),
                            ),
                            AspectRatio(
                              child: Image.network(
                                "${productList[index].image}",
                                fit: BoxFit.contain,
                              ),
                              aspectRatio: 2.0,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              padding: EdgeInsets.all(5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "${productList[index].price}",
                                    style: AppText16Style(colorBlue),
                                  ),
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
                                        cartid = productList[index];
                                        cartname = productList[index].name;
                                        cartprice = productList[index].price;
                                        sendDataFirestore(
                                            cartid, cartname, cartprice);
                                        print(
                                            "You have added ${productList[index].name},Price:${cartprice}");
                                      }
                                    },
                                    child: Icon(Icons.favorite_border_sharp,
                                        color: colorRed),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    })),
            Container(
                padding: EdgeInsets.all(5),
                width: double.infinity,
                height: size.height * 0.1,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GetBuilder<CartController>(
                        builder: (controoler) {
                          return Text(
                            "Total Cart item is ${cartController.cartList.length}",
                            style: AppText16Style(Colors.green),
                          );
                        },
                      ),
                      Container(
                        padding: EdgeInsets.all(5),
                        child: ElevatedButton(
                          style: AppButtonStyle(),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CartPage()));
                          },
                          child: SuccessButtonChild(
                            "Go To Cart",
                          ),
                        ),
                      ),
                    ]))
          ],
        ),
      ),
    ));
  }
}
