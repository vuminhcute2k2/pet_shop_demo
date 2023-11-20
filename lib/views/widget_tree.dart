
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pet_shop_app/common/authentication.dart';
import 'package:pet_shop_app/views/home.dart';
import 'package:pet_shop_app/views/home_screen.dart';
import 'package:pet_shop_app/views/login_screen.dart';
import 'package:pet_shop_app/views/splash_screen.dart';

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      builder: (context, snapshotdata) {
        if (snapshotdata.hasData) {
          return const Home();
        } else {
          return const LoginScreen();
        }
      },
      stream: Auth().authenStateChanges,
    );
  }
}