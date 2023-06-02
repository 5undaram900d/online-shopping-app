
import 'package:flutter/material.dart';
import 'package:fortunearrt_demo_app/ShoppingApp/core/a13_store.dart';
import 'package:fortunearrt_demo_app/ShoppingApp/pages/A10_CartPage.dart';
import 'package:fortunearrt_demo_app/ShoppingApp/pages/a02_home_page.dart';
import 'package:fortunearrt_demo_app/ShoppingApp/pages/a09_home_detail_page.dart';
import 'package:fortunearrt_demo_app/ShoppingApp/utils/a08_routes.dart';
import 'package:fortunearrt_demo_app/ShoppingApp/widgets/a04_themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'a01_login_page.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      darkTheme: MyTheme.darkTheme(context),
      debugShowCheckedModeBanner: false,
      routeInformationParser: VxInformationParser(),
      routerDelegate: VxNavigator(
        routes: {
          "/": (_,__) => const MaterialPage(child: LoginPage()),
          MyRoutes.homeRoute: (_,__) => const MaterialPage(child: HomePage()),
          MyRoutes.homeDetailsRoute: (uri,__) {
            final product = (VxState.store as MyStore).product.getById(int.parse(uri.queryParameters["id"].toString()));
            return MaterialPage(child: HomeDetailPage(product: product));
          },
          MyRoutes.loginRoute: (_,__) => const MaterialPage(child: LoginPage()),
          MyRoutes.cartRoute: (_,__) => const MaterialPage(child: CartPage()),
        }
      ),
    );
  }
}
