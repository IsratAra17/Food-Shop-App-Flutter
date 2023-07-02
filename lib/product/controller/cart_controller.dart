

import 'package:foodshopapp/model/productmodel.dart';
import 'package:get/get.dart';


class CartController extends GetxController{

  List<ProductModel>cartList=[];

  addToCart(ProductModel productModel){
    cartList.add(productModel);
    getTotal();
    update();
  }

  removeFromCart(int index){
    cartList.removeAt(index);
    update();
  }

  incrementQuantity(int index){
    cartList![index].quantity++;
    update();
  }



  var netTotal;

    getTotal(){
    netTotal = cartList!.map((item) => item.price!.toInt() * item.quantity )
        .reduce((value, element) => value+element);
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    print("rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr");
    cartList!.length>0?  getTotal() :null;
    update();
    super.onInit();
  }

}