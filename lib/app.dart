import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pet_shop_app/router/app_router.dart';
import 'package:pet_shop_app/views/splash_screen.dart';

class PetShopApp extends StatelessWidget {
  const PetShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute:AppRouter.onGenerateRoute ,
      home: SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}