import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pet_shop_app/router/app_router.dart';
import 'package:pet_shop_app/views/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    // Future.delayed(const Duration(seconds: 2),(){;
    // // Navigator.of(context).push(MaterialPageRoute(builder: (context) => const LoginScreen()));
    // // super.initState();
    // )};
    Future.delayed(const Duration(seconds: 1), () {
       Navigator.pushNamed(context, AppRouterName.Login);
      });
    super.initState();  
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