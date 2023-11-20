import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class EditInformationScreen extends StatefulWidget {
  const EditInformationScreen({super.key});

  @override
  State<EditInformationScreen> createState() => _EditInformationScreenState();
}

class _EditInformationScreenState extends State<EditInformationScreen> {
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController firtnameController;
  late final TextEditingController lastnameController;
  // String? emailValue;
  // String? passwordValue;
  // String? usernameError;
  // String? passwordError;
  dynamic _isObscured;


  setDataToTextField(data){
    return Column(
      children: [
         Container(
          padding: EdgeInsets.all(8), // Border width
                decoration:
                    BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: ClipOval(
                  child: SizedBox.fromSize(
                    size: Size.fromRadius(60), // Image radius
                    child: Image.network(
                        'https://png.pngtree.com/png-vector/20190307/ourmid/pngtree-vector-edit-profile-icon-png-image_780604.jpg',
                        fit: BoxFit.cover),
                  ),
                ),
         ),
         Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              controller:emailController =TextEditingController(text: data['email']) ,
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
              controller: firtnameController = TextEditingController(text:data['firtname']),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: 'firt name',
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
              controller: lastnameController =TextEditingController(text: data['lastname']),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                hintText: 'last name',
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
                //passwordValue = value;
              },
              obscureText: _isObscured,
              controller: passwordController=TextEditingController(text: data['password']),
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                //errorText: passwordError,
                hintText: 'Password',
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
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              onChanged: (String value) {
               // passwordValue = value;
              },
              obscureText: _isObscured,
              controller: passwordController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
              //  errorText: passwordError,
                hintText: 'New Password',
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
            margin: const EdgeInsets.only(left: 20, right: 20),
            child: TextField(
              onChanged: (String value) {
              //  passwordValue = value;
              },
              obscureText: _isObscured,
              controller: passwordController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                //errorText: passwordError,
                hintText: 'Confirm Password',
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
            height: 20,
          ),
          Container(
          child: GestureDetector(
            onTap: () =>updateData(),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 16),
              width: 120,
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
    );
  }
  updateData(){

  }
  @override
  void initState() {
    //emailController = TextEditingController(text: emailValue);
    //passwordController = TextEditingController(text: passwordValue);
    super.initState();
    _isObscured = true;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(
            color: Color(0XFFFBC16A),
          ),
          title: Text(
            "Chỉnh sửa thông tin ",
            style: TextStyle(color: Colors.black),
          ),
    
        ),
        body: SingleChildScrollView(
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("users").doc(FirebaseAuth.instance.currentUser!.email).snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              var data = snapshot.data;
              if(data==null){
                return Center(child: CircularProgressIndicator(),);
              }
              return setDataToTextField(data);
            },
            
          ),
        ),
      ),
    );
  }
}