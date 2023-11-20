import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pet_shop_app/router/app_router.dart';
import 'package:pet_shop_app/common/authentication.dart';

import '../utils/utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late final TextEditingController emailController;
  late final TextEditingController firtnameController;
  late final TextEditingController lastnameController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmpasswordController;
  String? emailValue;
  String? firtnameValue;
  String? lastnameValue;
  String? passwordValue;
  String? emailError;
  String? passwordError;
  String? confirmpasswordValue;
  var _isObscured;
  bool _isloading=false;
  @override
  void initState() {
    emailController = TextEditingController(text: emailValue);
    firtnameController = TextEditingController(text: firtnameValue);
    lastnameController = TextEditingController(text: lastnameValue);
    passwordController = TextEditingController(text: passwordValue);
    confirmpasswordController =TextEditingController(text: confirmpasswordValue);
    super.initState();
    _isObscured = true;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    emailController.dispose();
    firtnameController.dispose();
    lastnameController.dispose();
    passwordController.dispose();
    confirmpasswordController.dispose();
    super.dispose();
  }
  void signUpUser() async{
    setState(() {
      _isloading =true;
    });
    // String res = await Auth().loginUser(email: emailController.text.trim(), password: passwordController.text.trim());
    String res = await Auth().signUpUser(email: emailController.text.trim(), firtname: firtnameController.text.trim(), lastname: lastnameController.text.trim(), password: passwordController.text.trim(),);
    if(res !="success"){
      showSnackBar(res,context);
    }else{
       Navigator.pushNamed(context, AppRouterName.Home);
    }
    setState(() {
      _isloading =false;
    });
  }
  void navigateToLogin(){
   Navigator.pushNamed(context, AppRouterName.Login);
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
                  onChanged: (String value) {
                    emailValue = value;
                  },
                  
                  controller: emailController,
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
                  onChanged: (String value) {
                    firtnameValue = value;
                  },
                  controller: firtnameController,
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
                  onChanged: (String value) {
                    lastnameValue = value;
                  },
                  controller: lastnameController,
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
                    confirmpasswordValue = value;
                  },
                  obscureText: _isObscured,
                  controller: confirmpasswordController,
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
                    onTap: navigateToLogin,
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
                  onTap: signUpUser,
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
