
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fortunearrt_demo_app/ShoppingApp/core/a13_store.dart';
import 'package:fortunearrt_demo_app/ShoppingApp/models/a05_item.dart';
import 'package:fortunearrt_demo_app/ShoppingApp/models/a11_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatelessWidget {
  final Item product;

  const AddToCart({Key? key, required this.product}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    /// here give both AddMutation, RemoveMutation because on remove it is important to show reflect on main screen also
    VxState.watch(context, on: [AddMutation, RemoveMutation]);

    // fetching things by VxStore
    final CartModel _cart = (VxState.store as MyStore).cart;

    bool isInCart = _cart.items.contains(product);

    return ElevatedButton(
      onPressed: (){
        if(!isInCart){
          AddMutation(product);
        }
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(context.theme.floatingActionButtonTheme.backgroundColor),
        shape: MaterialStateProperty.all(const StadiumBorder(),),
      ),
      child: isInCart ? const Icon(Icons.done) : const Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}

