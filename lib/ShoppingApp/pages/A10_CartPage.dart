
import 'package:flutter/material.dart';
import 'package:fortunearrt_demo_app/ShoppingApp/core/a13_store.dart';
import 'package:fortunearrt_demo_app/ShoppingApp/models/a11_cart.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.size(30).bold.make(),
      ),

      body: Column(
        children: [
          _CartList().p32().expand(),
          const Divider(),
          const _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    /// fetching things by VxStore
    final CartModel _cart = (VxState.store as MyStore).cart;

    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            notifications: const {},
            mutations: const {RemoveMutation},
            builder: (context, _, VxState){
              return "\$${_cart.totalPrice}".text.xl4.color(context.theme.colorScheme.onSecondary).make();
            },
          ),
          30.widthBox,
          ElevatedButton(
            onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: "Product unavailability".text.make(),),);
            },
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(context.theme.floatingActionButtonTheme.backgroundColor),
            ),
            child: "Buy".text.white.make(),
          ).w24(context),
        ],
      ),
    );
  }
}

class _CartList extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    VxState.watch(context, on: [RemoveMutation]);

    /// fetching things by VxStore
    final CartModel _cart = (VxState.store as MyStore).cart;

    return _cart.items.isEmpty
        ? "Nothing to Show".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              leading: const Icon(Icons.done),
              trailing: IconButton(
                icon: const Icon(Icons.remove_circle_outline),
                onPressed: (){
                  // _cart.remove(_cart.items[index]);
                  RemoveMutation(_cart.items[index]);
                },
              ),
              title: _cart.items[index].name.text.make(),
            ),
          );
  }
}

