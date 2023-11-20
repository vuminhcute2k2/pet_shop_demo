import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:pet_shop_app/router/app_router.dart';
import 'package:pet_shop_app/views/home.dart';
import 'package:pet_shop_app/views/login_screen.dart';
import 'package:pet_shop_app/views/splash_screen.dart';
import 'package:pet_shop_app/views/widget_tree.dart';

class PetShopApp extends StatelessWidget {
  const PetShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRouterName.Splash,
      onGenerateRoute:AppRouter.onGenerateRoute ,
      home: StreamBuilder(
        stream:FirebaseAuth.instance.authStateChanges() ,
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.active){
            if(snapshot.hasData){
              return const Home();
            }else if(snapshot.hasError){
              return Center(child: Text('${snapshot.error}'),
              );
            }
          }
          if(snapshot.connectionState == ConnectionState.waiting){
            return const Center(
              child: CircularProgressIndicator(color:Color(0XFFFBC16A)) ,
            );
          }
          return const LoginScreen();
        },
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}