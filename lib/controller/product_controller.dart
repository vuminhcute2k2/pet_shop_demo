// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:get/get.dart';
// import 'package:pet_shop_app/model/product.dart';
// import 'dart:async';

// class ProductController extends GetxController{
//   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//   static ProductController instance = Get.find();
//   RxList<ProductModel> product = RxList<ProductModel>([]);
//   String collection = "products";
//   @override
//   void onReady() {
//     // TODO: implement onReady
//     super.onReady();
//     product.bindStream(getAllProducts());
//   }

//   Stream<List<ProductModel>> getAllProducts() =>
//  _firestore.collection('products').snapshots().map((query) => query.docs.map((item) => ProductModel.fromMap(item.data())).toList());
//   //_firestore.collection(collection).snapshots().map((query) => query.docs.map((e) => ProductModel.ma))
// }