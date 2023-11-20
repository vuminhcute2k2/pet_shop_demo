import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pet_shop_app/controller/cart_contoller.dart';
import 'package:pet_shop_app/router/app_router.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  // List<Map<String, dynamic>> itemStates = [];
  final CartController cartController = Get.put(CartController());
  final RxMap itemCheckState = {}.obs;
  RxDouble total = 0.0.obs;
  bool isChecked = false;
  bool isSelectAll = false;
  double _counter = 1;
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

  @override
  void initState() {
    super.initState();
    calculateTotal(); // Tính tổng giá tiền khi màn hình được tạo
  }

//   void toggleSelectAll(bool newValue) async{
//     final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//     QuerySnapshot qn = await _firestore.collection("user-items-cart").doc(FirebaseAuth.instance.currentUser?.email).collection("items").get();
//   setState(() {
//     isSelectAll = newValue;
//     // Đặt trạng thái của isChecked cho tất cả các mục trong danh sách
//     for (var item in snapshot.data!.docs) {
//       item['isChecked'] = newValue;
//     }
//   });
// }
  // Tính tổng giá tiền
  Future calculateTotal() async {
    try {
      final FirebaseFirestore _firestore = FirebaseFirestore.instance;
      QuerySnapshot qn = await _firestore
          .collection("user-items-cart")
          .doc(FirebaseAuth.instance.currentUser?.email)
          .collection("items")
          .get();
      double newTotal = 0.0;
      for (QueryDocumentSnapshot documentSnapshot in qn.docs) {
        //ep kieu cho price
        var priceValue = documentSnapshot['price'];
        if (priceValue is num) {
          newTotal += priceValue.toDouble();
        } else if (priceValue is String) {
          newTotal += double.tryParse(priceValue) ?? 0.0;
        }
      }
      //total.value=newTotal;
      cartController.updateTotal(newTotal);
    } catch (e) {
      print('Error calculating total price: $e');
    }
  }

  //chuyển màn
  void navigateToOrder() {
    if (cartController.selectedItems != null &&
        cartController.selectedItems.isNotEmpty) {
      Get.toNamed(AppRouterName.Order, arguments: cartController.selectedItems);
    } else {
      print("Không có mặt hàng nào được chọn.");
    }
  }

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
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 10),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("user-items-cart")
                .doc(FirebaseAuth.instance.currentUser?.email)
                .collection("items")
                .snapshots(),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text("có gì đó không đúng rồi bồ tèo ơi"),
                );
              }
              if (!snapshot.hasData || snapshot.data == null) {
                return Center(
                  child: CircularProgressIndicator(), // hoặc widget tương tự
                );
              }
              // Lấy dữ liệu từ snapshot và tạo danh sách items
              List<Map<String, dynamic>> items = [];
              for (QueryDocumentSnapshot documentSnapshot in snapshot.data!.docs) {
                Map<String, dynamic> item = documentSnapshot.data() as Map<String, dynamic>;
                item['id'] = documentSnapshot.id;
                items.add(item);
              }             
              // Tạo danh sách selectedItems bằng cách kiểm tra itemCheckState
              List<Map<String, dynamic>> selectedItems = [];
              for (var item in items) {
                if (itemCheckState[item['id']] == true) {
                  selectedItems.add(item);
                }
              }              
              //total.value = calculateTotal(snapshot.data!); // Cập nhật giá trị tổng giá tiền
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: snapshot.data!.docs.length,
                      //shrinkWrap: true,
                      itemBuilder: (_, index) {
                        DocumentSnapshot _documentSnapshot =
                            snapshot.data!.docs[index];
                        final itemId = _documentSnapshot.id;
                        final isChecked =
                            cartController.itemCheckState[itemId] ?? false;
                        return Container(
                          margin: EdgeInsets.only(bottom: 10),
                          height: 115,
                          child: Row(
                            children: [
                              Checkbox(
                                checkColor: Colors.white,
                                //fillColor: MaterialStateProperty.resolveWith(getColor),
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    cartController.updateItemCheckState(
                                        itemId, value!);
                                  });
                                },
                              ),
                              Container(
                                width: 80,
                                child:
                                    Image.network(_documentSnapshot["image"]),
                              ),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        _documentSnapshot["name"],
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
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
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.0)),
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
                                                  style:
                                                      TextStyle(fontSize: 16.0),
                                                ),
                                                IconButton(
                                                  icon: const Icon(
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
                                        margin: const EdgeInsets.only(left: 10),
                                        child: Text(
                                          "${_documentSnapshot["price"]}đ",
                                          style: const TextStyle(
                                              fontSize: 25,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.red),
                                        ))
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 20, left: 10),
                                child: GestureDetector(
                                  child: const Icon(Icons.delete),
                                  onTap: () async {
                                    await FirebaseFirestore.instance
                                        .collection("user-items-cart")
                                        .doc(FirebaseAuth
                                            .instance.currentUser!.email)
                                        .collection("items")
                                        .doc(_documentSnapshot.id)
                                        .delete();
                                    await calculateTotal();
                                  },
                                ),
                              ),
                            ],
                          ),
                        );
                        // return ListTile(
                        //   leading: Text(_documentSnapshot['name']),
                        //   title: Text("${_documentSnapshot['price']}"),

                        // );
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
                            flex: 0,
                            child: Container(
                              color: const Color(0XFFF0F0F0),
                              height: double.infinity,
                              child: Row(
                                children: [
                                  Checkbox(
                                    checkColor: Colors.white,
                                    fillColor:
                                        MaterialStateProperty.resolveWith(
                                            getColor),
                                    value: isChecked,
                                    onChanged: (bool? value) {
                                      setState(() {
                                        isChecked = value!;
                                      });
                                    },
                                  ),
                                  const Text("Tất cả"),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                ],
                              ),
                            )),
                        Expanded(
                          flex: 2,
                          child: Container(
                            alignment: Alignment.centerRight,
                            color: Color(0XFFF0F0F0),
                            height: double.infinity,
                            padding: EdgeInsets.only(right: 10),
                            child: Obx(() => Text(
                                  'Total Price: \$${cartController.total.value.toStringAsFixed(2)}',
                                  style: TextStyle(fontSize: 16),
                                )),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: Color(0XFFFBC16A),
                            height: double.infinity,
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: () {
                                // navigateToOrder();
                                if (cartController.selectedItems.isNotEmpty) {
                                  navigateToOrder();
                                } else {
                                  print("Không có mặt hàng nào được chọn.");
                                }
                              },
                              child: const Text(
                                'Mua hàng',
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
