import 'package:flutter/material.dart';
import 'package:pet_shop_app/views/%20edit_information_screen.dart';
import 'package:pet_shop_app/views/%20forgot_password.dart';
import 'package:pet_shop_app/views/%20product_details.dart';
import 'package:pet_shop_app/views/cart_screen.dart';
import 'package:pet_shop_app/views/home.dart';
import 'package:pet_shop_app/views/login_screen.dart';
import 'package:pet_shop_app/views/order_screen.dart';
import 'package:pet_shop_app/views/register_screen.dart';
import 'package:pet_shop_app/views/splash_screen.dart';

class AppRouter{
  static MaterialPageRoute? onGenerateRoute(RouteSettings settings) {
        switch (settings.name) {
          case AppRouterName.Splash:
            return MaterialPageRoute(
              builder: (context) => const SplashScreen(),
              settings: settings,
            );
          case AppRouterName.Login:
            return MaterialPageRoute(
              builder: (context) => const LoginScreen(),
              settings: settings,
            );
          case AppRouterName.Home:
            return MaterialPageRoute(
              builder: (context) => const Home(),
              settings: settings,
            );    
          case AppRouterName.Register:
            return MaterialPageRoute(
              builder: (context) => const RegisterScreen(),
              settings: settings,
            );
          case AppRouterName.ForgotPassword:
            return MaterialPageRoute(
              builder: (context) => const ForgotPasswordScreen(),
              settings: settings,
            );
          case AppRouterName.ProductDetails:
            return MaterialPageRoute(
              builder: (context) => const ProductDetailsScreen(),
              settings: settings,
            ); 
          case AppRouterName.Cart:
            return MaterialPageRoute(
              builder: (context) => const CartScreen(),
              settings: settings,
            );
          case AppRouterName.Order:
            return MaterialPageRoute(
              builder: (context) => const OrderScreen(),
              settings: settings,
            );
          case AppRouterName.Information:
            return MaterialPageRoute(
              builder: (context) => const EditInformationScreen(),
              settings: settings,
            );                    
          // case "/login":
          //   return MaterialPageRoute(
          //     builder: (context) => const Login(title: "dang nhap "),
          //     settings: settings,
          //   );
          // case "/screen2":
          //   return MaterialPageRoute(
          //     builder: (context) => Screen2(
          //       args: settings.arguments as ScreenArgument,
          //     ),
          //     // args: settings.arguments as ScreenArgument,
          //     settings: settings,
          //   );
        }
        return null;
}
}
class AppRouterName{
 static const Splash="/splash";
 static const Login="/login";
  static const Register="/register"; 
 static const ForgotPassword="/forgotPassword";
 static const Home="/home";
 static const ProductDetails ="/productDetails"; 
 static const Cart="/cart";
 static const Order="/order";
 static const Information="information";
}