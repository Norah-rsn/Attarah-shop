import 'package:ecommercialtwo/model/cartmodel.dart';
import 'package:ecommercialtwo/pages/onboarding.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        theme: ThemeData(primaryColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: const Directionality(
          textDirection: TextDirection.rtl,
          child: OnBoarding(),
        ),
      ),
    );
  }
}
