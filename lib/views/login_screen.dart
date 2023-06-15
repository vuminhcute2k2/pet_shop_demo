import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pet_shop_app/views/%20forgot_password.dart';
import 'package:pet_shop_app/views/register_screen.dart';
import 'package:pet_shop_app/router/app_router.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late final TextEditingController usernameController;
  late final TextEditingController passwordController;
  String? usernameValue;
  String? passwordValue;
  String? usernameError;
  String? passwordError;
  var _isObscured;
  @override
  void initState() {
    usernameController = TextEditingController(text: usernameValue);
    passwordController = TextEditingController(text: passwordValue);
    super.initState();
    _isObscured = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
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
                          style: TextStyle(decoration: TextDecoration.underline),
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
                    onTap: () {
                      Navigator.pushNamed(context, AppRouterName.Home);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      width: double.infinity,
                      child: Text(
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
                      onTap: () {
                      //  Navigator.of(context).push(MaterialPageRoute(builder: (context) => const RegisterScreen()));
                      Navigator.pushNamed(context, AppRouterName.Register);
                      },
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
    );
  }
}
