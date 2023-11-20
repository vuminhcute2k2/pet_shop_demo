import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pet_shop_app/router/app_router.dart';
import 'package:pet_shop_app/views/%20product_details.dart';
import 'package:pet_shop_app/views/product_details_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //carousel and products
  List<String> _carouselImages = [];
  List _products = [];
  int _dotPosition = 0;
  //TextEditingController searchController = TextEditingController();
  fetchProducts() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await _firestore.collection("products").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _products.add({
          "name": qn.docs[i]["name"],
          "description": qn.docs[i]["description"],
          "imgBig": qn.docs[i]["imgBig"],
          "image": qn.docs[i]["image"],
          "key": qn.docs[i]["key"],
          "price": qn.docs[i]["price"],
        });
      }
    });
    return qn.docs;
  }

  fetchCarouselImages() async {
    final FirebaseFirestore _firestore = FirebaseFirestore.instance;
    QuerySnapshot qn = await _firestore.collection("carousel-slider").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _carouselImages.add(
          qn.docs[i]["imageCarousel"],
        );
        print(qn.docs[i]["imageCarousel"]);
      }
    });
    return qn.docs;
  }

  @override
  void initState() {
    fetchCarouselImages();
    fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage("assets/image/background2.jpeg"),fit: BoxFit.cover),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                      child: SizedBox(
                        height: 36,
                        width: 10,
                        child: TextField(
                          onTap: (){
                            Navigator.pushNamed(context, AppRouterName.Search);
                          },
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          readOnly: true,
                          decoration: InputDecoration(
                              isDense: true,
                              prefixIcon: Icon(Icons.search),
                              hintText: 'Seach',
                              hintStyle:
                                  TextStyle(color: Colors.grey.withOpacity(0.9)),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                //borderSide: const BorderSide(color: Color(0XFFFBC16A)),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                                //borderSide: const BorderSide(color: Color(0XFFFBC16A)),
                              )),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.chat,
                        size: 36,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: SizedBox(
                      height: 16,
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, AppRouterName.Cart);
                        },
                        icon: Container(
                            child: Icon(
                          Icons.local_grocery_store,
                          size: 36,
                        )),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Container(
                  child: Column(
                    children: [
                      AspectRatio(
                        aspectRatio: 1.5,
                        child: CarouselSlider(
                            items: _carouselImages
                                .map((item) => Container(
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
                      const SizedBox(
                        height: 10,
                      ),
                      DotsIndicator(
                        dotsCount: _carouselImages.length == 0
                            ? 1
                            : _carouselImages.length,
                        position: _dotPosition,
                        decorator: DotsDecorator(
                          activeColor: Color(0XFFFBC16A),
                          color: Color(0XFFFBC16A).withOpacity(0.5),
                          spacing: EdgeInsets.all(2),
                          activeSize: Size(8, 8),
                          size: Size(6, 6),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
      
                      Container(
                        //width: double.infinity,
                        height: 350,
                        //width: 500,
                        child: GridView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _products.length,
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          ),
                          itemBuilder: (_, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(context, MaterialPageRoute(builder: (_)=>ProductsDetails(_products[index])));
                              },
                              child: Card(
                                elevation: 6,
                                color:Color.fromARGB(255, 248, 221, 180) ,
                                child: Column(
                                  children: [
                                    AspectRatio(
                                        aspectRatio: 2,
                                        child: Image.network(
                                          _products[index]["imgBig"],
                                        ),
                                        ),
                                    Text("${_products[index]["name"]}"),
                                    Text("${_products[index]["price"].toString()}đ",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 20,
                                            fontWeight: FontWeight.w800)),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
      
                      // Container(
                      //   height: 620,
                      //   alignment: Alignment.center,
                      //   margin: EdgeInsets.symmetric(horizontal: 20),
                      //   child: ListView.builder(
                      //     shrinkWrap: true,
                      //     itemCount: 1,
                      //     scrollDirection: Axis.vertical,
                      //     itemBuilder: (context, index) {
                      //       return Column(
                      //         children: [
                      //           const SizedBox(
                      //             height: 10,
                      //           ),
                      //           Container(
                      //             child: Row(
                      //               children: [
                      //                 const Text(
                      //                   "Tên danh mục 1",
                      //                   style: TextStyle(
                      //                       fontSize: 28,
                      //                       fontFamily: 'CherryBombOne',
                      //                       // height: 30,
                      //                       fontWeight: FontWeight.bold),
                      //                 ),
                      //                 const SizedBox(
                      //                   height: 36,
                      //                 ),
                      //                 Container(
                      //                   child: GestureDetector(
                      //                     onTap: () {
                      //                       //Navigator.pushNamed(context, AppRouterName.Home);
                      //                     },
                      //                     child: Container(
                      //                       padding:const EdgeInsets.only(
                      //                           left: 16, top: 16, bottom: 16),
                      //                       margin: const EdgeInsets.only(
                      //                           left: 20, right: 20),
                      //                       width: 100,
                      //                       child:Text(
                      //                         'Xem thêm',
                      //                         style: TextStyle(
                      //                             color: Colors.black,
                      //                             fontSize: 16,
                      //                             fontFamily:
                      //                                 'fonts/Roboto-Bold.ttf'),
                      //                       ),
                      //                       decoration: BoxDecoration(
                      //                         color: Color(0XFFFBC16A),
                      //                         borderRadius: BorderRadius.circular(36),
                      //                       ),
                      //                     ),
                      //                   ),
                      //                 )
                      //               ],
                      //             ),
                      //           ),
                      //           SizedBox(
                      //             height: 10,
                      //           ),
                      //           Row(
                      //             children: [
                      //               Container(
                      //                 // height: 1000,
                      //                 child: GestureDetector(
                      //                   onTap: () {
                      //                     Navigator.pushNamed(
                      //                         context, AppRouterName.ProductDetails);
                      //                   },
                      //                   child: Container(
                      //                     child: Stack(
                      //                       children: [
                      //                         Positioned(
                      //                           child: Container(
                      //                             width: 165,
                      //                             height: 215,
                      //                             decoration: BoxDecoration(
                      //                                 color: Color(0XFFFBC16A),
                      //                                 borderRadius:
                      //                                     BorderRadius.circular(16)),
                      //                           ),
                      //                         ),
                      //                         Positioned(
                      //                           left: 13,
                      //                           top: 10,
                      //                           child:Center(
                      //                             child: Container(
                      //                               padding: EdgeInsets.all(8), // Border width
                      //                               decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                      //                               child: ClipRRect(
                      //                               borderRadius: BorderRadius.circular(8),
                      //                               child: SizedBox.fromSize(
                      //                                 size: Size.fromRadius(62), // Image radius
                      //                                 child: Image.network('https://img.meta.com.vn/Data/image/2021/09/21/hinh-anh-cho-con-3.jpg', fit: BoxFit.cover),
                      //                               ),
                      //                             ),
                      //                             ),
                      //                           ) ,
      
                      //                         ),
                      //                         Positioned(
                      //                             top: 150,
                      //                             child: Text('Tên sản phẩm')),
                      //                         Positioned(
                      //                             top: 170,
                      //                             child: Text('Giá sản phẩm : ')),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //               SizedBox(
                      //                 width: 16,
                      //               ),
                      //               Container(
                      //                 // height: 1000,
                      //                 child: GestureDetector(
                      //                   onTap: () {},
                      //                   child: Container(
                      //                     child: Stack(
                      //                       children: [
                      //                         Positioned(
                      //                           child: Container(
                      //                             width: 165,
                      //                             height: 215,
                      //                             decoration: BoxDecoration(
                      //                                 color: Color(0XFFFBC16A),
                      //                                 borderRadius:
                      //                                     BorderRadius.circular(16)),
                      //                           ),
                      //                         ),
                      //                         Positioned(
                      //                           left: 13,
                      //                           top: 10,
                      //                           child:Center(
                      //                             child: Container(
                      //                               padding: EdgeInsets.all(8), // Border width
                      //                               decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                      //                               child: ClipRRect(
                      //                               borderRadius: BorderRadius.circular(8),
                      //                               child: SizedBox.fromSize(
                      //                                 size: Size.fromRadius(62), // Image radius
                      //                                 child: Image.network('https://img-cdn.2game.vn/pictures/xemgame/2017/01/11/wallpaper-warwick.jpg', fit: BoxFit.cover),
                      //                               ),
                      //                             ),
                      //                             ),
                      //                           ) ,
      
                      //                         ),
                      //                         Positioned(
                      //                             top: 150,
                      //                             child: Text('Tên sản phẩm')),
                      //                         Positioned(
                      //                             top: 170,
                      //                             child: Text('Giá sản phẩm : ')),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
                      //           SizedBox(
                      //             height: 16,
                      //           ),
                      //           Row(
                      //             children: [
                      //               Container(
                      //                 // height: 1000,
                      //                 child: GestureDetector(
                      //                   onTap: () {},
                      //                   child: Container(
                      //                     child: Stack(
                      //                       children: [
                      //                         Positioned(
                      //                           child: Container(
                      //                             width: 165,
                      //                             height: 215,
                      //                             decoration: BoxDecoration(
                      //                                 color: Color(0XFFFBC16A),
                      //                                 borderRadius:
                      //                                     BorderRadius.circular(16)),
                      //                           ),
                      //                         ),
                      //                         Positioned(
                      //                           left: 13,
                      //                           top: 10,
                      //                           child:Center(
                      //                             child: Container(
                      //                               padding: EdgeInsets.all(8), // Border width
                      //                               decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                      //                               child: ClipRRect(
                      //                               borderRadius: BorderRadius.circular(8),
                      //                               child: SizedBox.fromSize(
                      //                                 size: Size.fromRadius(62), // Image radius
                      //                                 child: Image.network('https://i.pinimg.com/474x/b7/f8/98/b7f898958ec7034e03975129c74aef21--iphone-backgrounds-phone-wallpapers.jpg', fit: BoxFit.cover),
                      //                               ),
                      //                             ),
                      //                             ),
                      //                           ) ,
      
                      //                         ),
                      //                         Positioned(
                      //                             top: 150,
                      //                             child: Text('Tên sản phẩm')),
                      //                         Positioned(
                      //                             top: 170,
                      //                             child: Text('Giá sản phẩm : ')),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //               SizedBox(
                      //                 width: 16,
                      //               ),
                      //               Container(
                      //                 // height: 1000,
                      //                 child: GestureDetector(
                      //                   onTap: () {},
                      //                   child: Container(
                      //                     child: Stack(
                      //                       children: [
                      //                         Positioned(
                      //                           child: Container(
                      //                             width: 165,
                      //                             height: 215,
                      //                             decoration: BoxDecoration(
                      //                                 color: Color(0XFFFBC16A),
                      //                                 borderRadius:
                      //                                     BorderRadius.circular(16)),
                      //                           ),
                      //                         ),
                      //                         Positioned(
                      //                           left: 13,
                      //                           top: 10,
                      //                           child:Center(
                      //                             child: Container(
                      //                               padding: EdgeInsets.all(8), // Border width
                      //                               decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                      //                               child: ClipRRect(
                      //                               borderRadius: BorderRadius.circular(8),
                      //                               child: SizedBox.fromSize(
                      //                                 size: Size.fromRadius(62), // Image radius
                      //                                 child: Image.network('https://anhdep123.com/wp-content/uploads/2020/05/h%C3%ACnh-%E1%BA%A3nh-con-ch%C3%B3.jpg', fit: BoxFit.cover),
                      //                               ),
                      //                             ),
                      //                             ),
                      //                           ) ,
      
                      //                         ),
                      //                         Positioned(
                      //                             top: 150,
                      //                             child: Text('Tên sản phẩm')),
                      //                         Positioned(
                      //                             top: 170,
                      //                             child: Text('Giá sản phẩm : ')),
                      //                       ],
                      //                     ),
                      //                   ),
                      //                 ),
                      //               ),
                      //             ],
                      //           ),
      
                      //         ],
                      //       );
                      //     },
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 30, left: 20, right: 20, bottom: 10),
                width: double.infinity,
                height: 2,
                color: Color(0XFFFBC16A),
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                alignment: Alignment.topLeft,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Liên hệ",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w300,
                        fontFamily: 'CherryBombOne',
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            size: 24,
                            color: Color(0XFFFBC16A),
                          ),
                          Text(
                              "Địa chỉ: Số 168 Thượng Đình - Thanh Xuân - Hà Nội")
                        ],
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Icon(
                            Icons.phone_callback,
                            size: 24,
                            color: Color(0XFFFBC16A),
                          ),
                          Text("Số điện thoại:097452888")
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
