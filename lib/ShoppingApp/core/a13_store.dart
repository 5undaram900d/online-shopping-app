
import 'package:fortunearrt_demo_app/ShoppingApp/models/a05_item.dart';
import 'package:fortunearrt_demo_app/ShoppingApp/models/a11_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore{
  late ProductModel product;
  late CartModel cart;

  MyStore(){
    product = ProductModel();
    cart = CartModel();
    cart.product = product;
  }
}