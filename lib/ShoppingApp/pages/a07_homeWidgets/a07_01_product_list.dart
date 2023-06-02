
import 'package:flutter/material.dart';
import 'package:fortunearrt_demo_app/ShoppingApp/models/a05_item.dart';
import 'package:fortunearrt_demo_app/ShoppingApp/pages/a07_homeWidgets/a07_02_product_image.dart';
import 'package:fortunearrt_demo_app/ShoppingApp/pages/a07_homeWidgets/a12_add_to_cart.dart';
import 'package:fortunearrt_demo_app/ShoppingApp/pages/a09_home_detail_page.dart';
import 'package:fortunearrt_demo_app/ShoppingApp/utils/a08_routes.dart';
import 'package:velocity_x/velocity_x.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return !context.isMobile
        ? GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 20),
            shrinkWrap: true,
            itemCount: ProductModel.items.length,
            itemBuilder: (context, index) {
              final product = ProductModel.items[index];
              return InkWell(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => HomeDetailPage(product: product),),),
                child: ProductItem(product: product),
              );
            },
          )
        : ListView.builder(
            shrinkWrap: true,
            itemCount: ProductModel.items.length,
            itemBuilder: (context, index) {
              final product = ProductModel.items[index];
              return InkWell(
                onTap: () => context.vxNav.push(Uri(path: MyRoutes.homeDetailsRoute, queryParameters: {"id": product.id.toString()}), params: product),
                child: ProductItem(product: product),
              );
            },
          );
  }
}



class ProductItem extends StatelessWidget {

  final Item product;

  /// assert is basically used for the showing error at the runtime
  const ProductItem({Key? key, required this.product}) : assert(product!=null), super(key: key);

  @override
  Widget build(BuildContext context) {

    var children2 = [
      Hero(         /// ---> Starting Animation position
        tag: Key(product.id.toString()),    /// this tag has same at the both start and end of the animation
        child: ProductImage(image: product.imageUrl),
      ),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            product.name.text.lg.color(context.accentColor).bold.make(),
            product.desc.text.size(12).textStyle(context.captionStyle).make(),
            10.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: EdgeInsets.zero,
              children: [
                "\$${product.price}".text.bold.xl.make(),
                AddToCart(product: product,),
              ],
            ).pOnly(right: 8.0),
          ],
        ),
      ).p(context.isMobile ? 0 : 16),
    ];

    return VxBox(
      child: context.isMobile
          ? Row(
              children: children2,
            )
          : Column(
              children: children2,
            ),
    ).rounded.color(context.cardColor).square(150).make().py16();
  }
}
