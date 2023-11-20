import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:pet_shop_app/router/app_router.dart';
import 'package:pet_shop_app/views/login_screen.dart';
import 'package:pet_shop_app/views/user_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferences? prefs;
  @override
  void initState() {
    // TODO: implement initState
    // Future.delayed(const Duration(seconds: 2),(){;
    // // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen()));
    // // super.initState();
    // )};
    requestPermission();
    //realJson();
    super.initState();
  }
  realJson() async{
    final String json= await rootBundle.loadString("assets/data_json/data.json");

    final userResponse  =  UserResponse.fromJson(jsonDecode(json));
  
  }
  void initSharedPref() async {
    // Doi shared prefs nay phai khoi tao xong
    prefs = await SharedPreferences.getInstance();
    final loginData = prefs?.getString("loginData");
    if(loginData==null){
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushNamed(context,AppRouterName.WidgetTree);
      });
    }
    else{
      // Future.delayed(const Duration(seconds: 1), () {
      //   Navigator.pushNamed(context, "/screen2",arguments: ScreenArgument(usernameValue: loginData));
      // });
      Future.delayed(const Duration(seconds: 1),(){
        Navigator.pushNamed(context, AppRouterName.Home);
      });
    }
    //
  }
  Future<void> requestPermission() async {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
    ].request();
    if (await Permission.storage.request().isGranted) {
      initSharedPref();
      Future.delayed(const Duration(seconds: 1), () {
        Navigator.pushNamed(context,AppRouterName.WidgetTree);
      });
      //initSharedPref();
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('assets/image/splash_logo.png'),
      ),
    );
  }
}