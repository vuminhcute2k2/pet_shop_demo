import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return Colors.blue;
      }
      return Color(0XFFFBC16A);
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color(0XFFFBC16A),
        ),
        title: Text(
          "Thông tin đơn hàng",
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.local_grocery_store,
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text("Đơn Hàng",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w600),),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                height: 2,
                color: Color(0XFFFBC16A),
              ),
              //listview cart order
              Container(
                height: 120,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  //itemCount: ,
                  itemBuilder: (context, index) {
                   
                  },
                ),
              ),
              const Text("Xác nhận thông tin",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w600),),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                height: 2,
                color: Color(0XFFFBC16A),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
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
                const SizedBox(
                height: 10,
              ),
              Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.account_box),
                      hintText: 'Họ và tên',
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
              const SizedBox(
                height: 10,
              ),  
              Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone),
                      hintText: 'Số điện thoại',
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
              const SizedBox(
                height: 10,
              ),  
              Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.location_on),
                      hintText: 'Địa chỉ',
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
              const SizedBox(
                height: 10,
              ),
              const Text("Phương thức thanh toán",style: TextStyle(fontSize: 26,fontWeight: FontWeight.w600),),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                width: double.infinity,
                height: 2,
                color: Color(0XFFFBC16A),
              ),
              Container(
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  child: TextField(
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      prefixIcon: Checkbox(checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                        ),
                      hintText: 'Thanh toán khi giao hàng',
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
              const SizedBox(
                height: 10,
              ),   
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 80),
                  child: GestureDetector(
                    onTap: () {
                    //Navigator.pushNamed(context, AppRouterName.Login);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      width: 140,
                      child: Text(
                        'Thanh toán',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontFamily: 'fonts/Roboto-Bold.ttf',
                            fontWeight: FontWeight.w400,
                            ),
                            
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