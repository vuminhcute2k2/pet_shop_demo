// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pet_shop_app/router/app_router.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool isChecked = false;
  List<listCardHorizontal> listcarthorizontal = [
    listCardHorizontal(
        imageCart: "https://cdn-icons-png.flaticon.com/512/147/147142.png",
        titleCartl: "Chó anh lông ngắn cute",
        price: "143000"),
    listCardHorizontal(
        imageCart: "https://cdn-icons-png.flaticon.com/512/147/147142.png",
        titleCartl: "Chó anh lông ngắn cute",
        price: "32134324"),
    listCardHorizontal(
        imageCart: "https://cdn-icons-png.flaticon.com/512/147/147142.png",
        titleCartl: "Chó anh lông ngắn cute",
        price: "432432"),
    listCardHorizontal(
        imageCart: "https://cdn-icons-png.flaticon.com/512/147/147142.png",
        titleCartl: "Chó anh lông ngắn cute",
        price: "143000"),
    listCardHorizontal(
        imageCart: "https://cdn-icons-png.flaticon.com/512/147/147142.png",
        titleCartl: "Chó anh lông ngắn cute",
        price: "32134324"),
    listCardHorizontal(
        imageCart: "https://cdn-icons-png.flaticon.com/512/147/147142.png",
        titleCartl: "Chó anh lông ngắn cute",
        price: "432432"),
        listCardHorizontal(
        imageCart: "https://cdn-icons-png.flaticon.com/512/147/147142.png",
        titleCartl: "Chó anh lông ngắn cute",
        price: "143000"),
    listCardHorizontal(
        imageCart: "https://cdn-icons-png.flaticon.com/512/147/147142.png",
        titleCartl: "Chó anh lông ngắn cute",
        price: "32134324"),
    listCardHorizontal(
        imageCart: "https://cdn-icons-png.flaticon.com/512/147/147142.png",
        titleCartl: "Chó anh lông ngắn cute",
        price: "432432"),    
  ];
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  void deleteItem(int index) {
    setState(() {
      listcarthorizontal.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    const int currentIndex = 0;
    //chuyen mau chon check box
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
          "Giỏ hàng(Tổng số đơn hàng)",
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
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: listcarthorizontal.length,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.only(bottom: 10),
                  height: 115,
                  child: Row(
                    children: [
                      Checkbox(
                        checkColor: Colors.white,
                        fillColor: MaterialStateProperty.resolveWith(getColor),
                        value: isChecked,
                        onChanged: (bool? value) {
                          setState(() {
                            isChecked = value!;
                          });
                        },
                      ),
                      Container(
                        child:
                            Image.network(listcarthorizontal[index].imageCart),
                      ),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              listcarthorizontal[index].titleCartl,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Text("Số lượng:"),
                            SizedBox(
                              height: 8,
                            ),
                            Container(
                                width: 120,
                                height: 30,
                                decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(8.0)),
                                  color: Colors.white,
                                ),
                                child: Row(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        IconButton(
                                          icon: Icon(
                                            Icons.add,
                                            size: 16,
                                          ),
                                          onPressed: _incrementCounter,
                                        ),
                                        Text(
                                          '$_counter',
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                        IconButton(
                                          icon:const Icon(
                                            Icons.remove,
                                            size: 20,
                                          ),
                                          onPressed: _decrementCounter,
                                        ),
                                      ],
                                    ),
                                  ],
                                )),
                            Container(
                                margin:const EdgeInsets.only(left: 10),
                                child: Text(
                                  listcarthorizontal[index].price + "đ",
                                  style:const TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.red),
                                ))
                          ],
                        ),
                      ),
                      GestureDetector(
                        child: const Icon(Icons.delete),
                        onTap: () {
                          deleteItem(index);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Container(
            height: 60,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex:0,
                  child: Container(
                    color:const Color(0XFFF0F0F0),
                    height: double.infinity,
                  child: Row(
                    children: [
                      Checkbox(checkColor: Colors.white,
                            fillColor: MaterialStateProperty.resolveWith(getColor),
                            value: isChecked,
                            onChanged: (bool? value) {
                              setState(() {
                                isChecked = value!;
                              });
                            },),
                     const Text("Tất cả"),  
                     const SizedBox(width: 5,),   
                    ],
                  ),
                )),
                Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.centerRight,
                    color:const Color(0XFFF0F0F0),
                    height: double.infinity,
                    padding: EdgeInsets.only(right: 10),
                    child: Text('Tổng tiền: 123',style: TextStyle(fontSize: 16),),

                    ),
                ),
                Expanded(
                  flex:1 ,
                  child: Container(
                    color: Color(0XFFFBC16A),
                    height: double.infinity,
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, AppRouterName.Order);
                      },
                    child:const Text('Mua hàng',),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class listCardHorizontal {
  String imageCart;
  String titleCartl;
  String price;
  listCardHorizontal({
    required this.imageCart,
    required this.titleCartl,
    required this.price,
  });
}
