import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProductsDetails extends StatefulWidget {
  var _products;
  //var _carouselImage;
  ProductsDetails(this._products);
  //ProductsDetails(this._carousel);

  @override
  State<ProductsDetails> createState() => _ProductsDetailsState();
}

class _ProductsDetailsState extends State<ProductsDetails> {
  int _dotPosition = 0;
  Future addToCart()async{
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef = FirebaseFirestore.instance.collection("user-items-cart");
    return _collectionRef.doc(currentUser!.email).collection("items").doc().set({
      "name": widget._products["name"],
      "price": widget._products["price"],
      "image": widget._products["imgBig"],
    }).then((value) => print("add cart "));
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Color(0XFFFBC16A),
        ),
        title: Text(
          "Chi tiết sản phẩm",
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
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/image/background2.jpeg"),fit: BoxFit.cover),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 2,
                  child: Image.network(
                    widget._products["imgBig"],
                  ),
                ),
                AspectRatio(
                  aspectRatio: 1.5,
                  child: CarouselSlider(
                      items: widget._products['image']
                          .map<Widget>((item) => Container(
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(item),
                                        fit: BoxFit.fitWidth)),
                              ))
                          .toList(),
                      options: CarouselOptions(
                          autoPlay: false,
                          enlargeCenterPage: true,
                          viewportFraction: 0.8,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          onPageChanged: (val, CarouselPageChangedReason) {
                            setState(() {
                              _dotPosition = val;
                            });
                          })),
                ),
                
                Text("${widget._products['name']}",style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  
                ),),
                Text("${widget._products['price'].toString()}đ",style:const TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                ),),
                Text(widget._products['description']),
                SizedBox(
                  height: 12,
                ),
                Container(
                  child: GestureDetector(
                    onTap: () {
                      addToCart();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      width: double.infinity,
                      child: Text(
                        'Thêm vào giỏ hàng',
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
      ),
    );
  }
}
