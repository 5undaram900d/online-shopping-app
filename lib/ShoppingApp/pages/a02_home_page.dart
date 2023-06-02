
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fortunearrt_demo_app/ShoppingApp/core/a13_store.dart';
import 'package:fortunearrt_demo_app/ShoppingApp/models/a05_item.dart';
import 'package:fortunearrt_demo_app/ShoppingApp/models/a11_cart.dart';
import 'package:fortunearrt_demo_app/ShoppingApp/pages/a07_homeWidgets/a07_01_product_list.dart';
import 'package:fortunearrt_demo_app/ShoppingApp/utils/a08_routes.dart';
import 'package:fortunearrt_demo_app/ShoppingApp/widgets/a03_drawer.dart';
import 'package:velocity_x/velocity_x.dart';
import 'dart:convert';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async{
    await Future.delayed(const Duration(seconds: 2));
    final productJson = await rootBundle.loadString("assets/files/products.json");
    final decodedData = jsonDecode(productJson.toString());
    var productData = decodedData['product'];
    ProductModel.items = List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {

    final _cart = (VxState.store as MyStore).cart;

    return Scaffold(
      backgroundColor: context.canvasColor,                 // by velocity_x
      // backgroundColor: Theme.of(context).canvasColor,          // without velocity_x
      floatingActionButton: VxBuilder(
        mutations: const {AddMutation, RemoveMutation},
        builder: (context, _, VxState) =>  FloatingActionButton(
          backgroundColor: context.theme.floatingActionButtonTheme.backgroundColor,
          onPressed: () => context.vxNav.push(Uri.parse(MyRoutes.cartRoute)),
          child: const Icon(CupertinoIcons.cart, color: Colors.white,),
        ).badge(color: Vx.white, size: 22, count: _cart.items.length, textStyle: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        /// just above badge is used for showing a badge above to icon by Velocity_x
      ),

      body: SafeArea(
        child: Container(
          padding: Vx.m32,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "Trending Products:".text.xl3.italic.make(),
              if(ProductModel.items!=null && ProductModel.items.isNotEmpty)
                const ProductList().py16().expand()
              else
                const CircularProgressIndicator().centered().expand(),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: "Online Shopping App".text.xl3.bold.color(context.theme.colorScheme.onSecondary).make(),
      ),
      drawer: const MyDrawer(),
    );
  }
}

