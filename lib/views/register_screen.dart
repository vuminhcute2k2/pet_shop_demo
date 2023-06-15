import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
      body: Container(
        margin: EdgeInsetsDirectional.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 50,),
              Container(
                alignment: Alignment.center,
                child: Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 42,
                    fontFamily: 'CherryBombOne',
                    color: Color(0XFFFBC16A)
                  ),
                ),
              ),
              Container(
                // margin: const EdgeInsets.only(left: 20, right: 20),
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
                // margin: const EdgeInsets.only(left: 20, right: 20),
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'First Name',
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
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    hintText: 'Last Name',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(padding: EdgeInsets.only(left: 20)),
                  Text('Bạn đã có tài khoản ?'),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Đăng nhập!',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color.fromRGBO(22, 167, 225, 1)),
                    ),
                  ),
                ],
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
                      'Đăng ký',
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
              Text('Đăng ký bằng'),
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
              Column(
                children: [
                  Text('Bằng cách đăng ký, bạn đồng ý với '),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      'Điểu khoản & Chính sách',
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color.fromRGBO(22, 167, 225, 1)),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}