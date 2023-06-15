import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
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
          margin: EdgeInsetsDirectional.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                // margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.account_circle_sharp),
                    hintText: 'Username',
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
                // margin: const EdgeInsets.only(left: 20, right: 20),
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
              Container(
                //margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  onChanged: (String value) {
                    passwordValue = value;
                  },
                  obscureText: _isObscured,
                  controller: passwordController,
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    errorText: passwordError,
                    hintText: 'Xác nhận lại mật khẩu',
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
              Container(
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    width: double.infinity,
                    child: Text(
                      'Xác Nhận',
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
            ],
          ),
        ),
      ),
    );
  }
}