import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pet_shop_app/views/%20forgot_password.dart';
import 'package:pet_shop_app/common/authentication.dart';
import 'package:pet_shop_app/views/register_screen.dart';
import 'package:pet_shop_app/router/app_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  String? emailValue;
  String? passwordValue;
  String? emailError;
  String? passwordError;
  SharedPreferences? prefs;
  bool _isloading = false;
  var _isObscured;
  @override
  void initState() {
    initSharedPref();
    emailController = TextEditingController(text: emailValue);
    passwordController = TextEditingController(text: passwordValue);
    super.initState();
    _isObscured = true;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isloading = true;
    });
    String res = await Auth().loginUser(
        email: emailController.text.trim(),
        password: passwordController.text.trim());
    if (res == "success") {
      Navigator.pushNamed(context, AppRouterName.Home);
    } else {
      // showSnackBar(res, context);
      showDialog(
          context: context,
          builder: (context) => const AlertDialog(
                title: Text("thông báo"),
                content: Text("Sai tài khoản hoặc mật khẩu"),
                actions: [],
              ));
    }
    setState(() {
      _isloading = false;
    });
    if (emailController.text.length < 6 &&
        passwordController.text.length < 6 &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty) {
      setState(() {
        emailError = "Email không được nhỏ hơn 6 ký tự";
        passwordError = "Password không được nhỏ hơn 6 kí tự";
      });
    }
    if (emailController.text.length >= 6 &&
        passwordController.text.length >= 6) {
      setState(() {
        emailError = null;
        passwordError = null;
        emailValue = emailController.text;
        passwordValue = passwordController.text;
      });
    }
    if (emailController.text.isEmpty) {
      setState(() {
        emailError = "Email không được để rỗng";
      });
    }
    if (passwordController.text.isEmpty) {
      setState(() {
        passwordError = "Password không được để rỗng";
      });
    }
    if (emailController.text.contains(" ") ||
        passwordController.text.contains(" ")) {
      setState(() {
        emailError = "Email không được để dấu cách";
        passwordError = "Password không được để dấu cách";
      });
    }
  }

  void navigateToSignUp() {
    Navigator.pushNamed(context, AppRouterName.Register);
  }

  void initSharedPref() async {
    // Doi shared prefs nay phai khoi tao xong
    prefs = await SharedPreferences.getInstance();
    //
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/image/background2.jpeg"),fit: BoxFit.cover),
        ),
        child: Center(
          child: Container(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      onChanged: (value) {
                        emailValue = value;
                      },
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: InputDecoration(
                        errorText: emailError,
                        prefixIcon: Icon(Icons.email),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.9)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Color(0XFFFBC16A)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Color(0XFFFBC16A)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20, right: 20),
                    child: TextField(
                      onChanged: (String value) {
                        passwordValue = value;
                      },
                      obscureText: _isObscured,
                      controller: passwordController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        errorText: passwordError,
                        hintText: 'Mật khẩu',
                        hintStyle: TextStyle(color: Colors.grey.withOpacity(0.9)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Color(0XFFFBC16A)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(color: Color(0XFFFBC16A)),
                        ),
                        suffixIcon: IconButton(
                          padding: const EdgeInsetsDirectional.only(end: 12.0),
                          icon: _isObscured
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              _isObscured = !_isObscured;
                            });
                          },
                        ),
                      ),
                      // obscureText: true,
                      // obscuringCharacter: '*',
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRouterName.ForgotPassword);
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 20, right: 20),
                          child: Text(
                            'Quên mật khẩu',
                            style:
                                TextStyle(decoration: TextDecoration.underline),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    child: GestureDetector(
                      //   onTap: () async{
                      //    //await Auth().loginWithWmailAndPasswor(email:usernameController,password:);
                      //  await loginUser();
                      //   print(Auth().currenUser);
                      //   // Navigator.pushNamed(context, AppRouterName.Home);
                      //   },
                      onTap: loginUser,
                      child: Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        margin: const EdgeInsets.only(left: 20, right: 20),
                        width: double.infinity,
                        child: _isloading
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: Color(0XFFFBC16A),
                                ),
                              )
                            : Text(
                                'Đăng nhập',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontFamily: 'fonts/Roboto-Bold.ttf'),
                              ),
                        decoration: BoxDecoration(
                          color: Color(0XFFFBC16A),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text('Hoặc'),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Container(
                              width: 40,
                            )),
                        Image.asset(
                          'assets/image/facebook_logo.png',
                          width: 40,
                        ),
                        const SizedBox(
                          width: 50,
                        ),
                        Image.asset(
                          'assets/image/google_logo.png',
                          width: 40,
                        ),
                        Expanded(
                            flex: 1,
                            child: Container(
                              width: 40,
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Bạn chưa có tài khoản?'),
                      GestureDetector(
                        // onTap: () {
                        // //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterScreen()));
                        // Navigator.pushNamed(context, AppRouterName.Register);
      
                        // },
                        onTap: navigateToSignUp,
                        child: const Text(
                          'Đăng ký!',
                          style: TextStyle(
                            color: Color.fromRGBO(22, 167, 225, 1),
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
