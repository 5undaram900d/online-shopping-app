
import 'package:flutter/material.dart';
import 'package:fortunearrt_demo_app/ShoppingApp/core/a13_store.dart';
import 'package:fortunearrt_demo_app/ShoppingApp/pages/a00_start_page.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  setPathUrlStrategy();
  runApp(
    VxState(      /// use for the purpose of refreshing the things
      store: MyStore(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StartPage(),
    );
  }
}
