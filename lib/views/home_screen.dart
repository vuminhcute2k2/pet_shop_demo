import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pet_shop_app/router/app_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: SingleChildScrollView(
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
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
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
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 620,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: 4,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Row(
                                children: [
                                  const Text(
                                    "Tên danh mục 1",
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontFamily: 'CherryBombOne',
                                        // height: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 36,
                                  ),
                                  Container(
                                    child: GestureDetector(
                                      onTap: () {
                                        //Navigator.pushNamed(context, AppRouterName.Home);
                                      },
                                      child: Container(
                                        padding:const EdgeInsets.only(
                                            left: 16, top: 16, bottom: 16),
                                        margin: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        width: 100,
                                        child:Text(
                                          'Xem thêm',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                              fontFamily:
                                                  'fonts/Roboto-Bold.ttf'),
                                        ),
                                        decoration: BoxDecoration(
                                          color: Color(0XFFFBC16A),
                                          borderRadius: BorderRadius.circular(36),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  // height: 1000,
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, AppRouterName.ProductDetails);
                                    },
                                    child: Container(
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            child: Container(
                                              width: 165,
                                              height: 215,
                                              decoration: BoxDecoration(
                                                  color: Color(0XFFFBC16A),
                                                  borderRadius:
                                                      BorderRadius.circular(16)),
                                            ),
                                          ),
                                          Positioned(
                                            left: 13,
                                            top: 10,
                                            child:Center(
                                              child: Container(
                                                padding: EdgeInsets.all(8), // Border width
                                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                                                child: ClipRRect(
                                                borderRadius: BorderRadius.circular(8),
                                                child: SizedBox.fromSize(
                                                  size: Size.fromRadius(62), // Image radius
                                                  child: Image.network('https://kienthuc5s.com/wp-content/uploads/2022/01/11_hinh-anh-cho.jpg', fit: BoxFit.cover),
                                                ),
                                              ),
                                              ),
                                            ) ,
                                            
                                          ),
                                          Positioned(
                                              top: 150,
                                              child: Text('Tên sản phẩm')),
                                          Positioned(
                                              top: 170,
                                              child: Text('Giá sản phẩm : ')),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Container(
                                  // height: 1000,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            child: Container(
                                              width: 165,
                                              height: 215,
                                              decoration: BoxDecoration(
                                                  color: Color(0XFFFBC16A),
                                                  borderRadius:
                                                      BorderRadius.circular(16)),
                                            ),
                                          ),
                                          Positioned(
                                            left: 13,
                                            top: 10,
                                            child:Center(
                                              child: Container(
                                                padding: EdgeInsets.all(8), // Border width
                                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                                                child: ClipRRect(
                                                borderRadius: BorderRadius.circular(8),
                                                child: SizedBox.fromSize(
                                                  size: Size.fromRadius(62), // Image radius
                                                  child: Image.network('https://img-cdn.2game.vn/pictures/xemgame/2017/01/11/wallpaper-warwick.jpg', fit: BoxFit.cover),
                                                ),
                                              ),
                                              ),
                                            ) ,
                                            
                                          ),
                                          Positioned(
                                              top: 150,
                                              child: Text('Tên sản phẩm')),
                                          Positioned(
                                              top: 170,
                                              child: Text('Giá sản phẩm : ')),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Row(
                              children: [
                                Container(
                                  // height: 1000,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            child: Container(
                                              width: 165,
                                              height: 215,
                                              decoration: BoxDecoration(
                                                  color: Color(0XFFFBC16A),
                                                  borderRadius:
                                                      BorderRadius.circular(16)),
                                            ),
                                          ),
                                          Positioned(
                                            left: 13,
                                            top: 10,
                                            child:Center(
                                              child: Container(
                                                padding: EdgeInsets.all(8), // Border width
                                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                                                child: ClipRRect(
                                                borderRadius: BorderRadius.circular(8),
                                                child: SizedBox.fromSize(
                                                  size: Size.fromRadius(62), // Image radius
                                                  child: Image.network('https://i.pinimg.com/474x/b7/f8/98/b7f898958ec7034e03975129c74aef21--iphone-backgrounds-phone-wallpapers.jpg', fit: BoxFit.cover),
                                                ),
                                              ),
                                              ),
                                            ) ,
                                            
                                          ),
                                          Positioned(
                                              top: 150,
                                              child: Text('Tên sản phẩm')),
                                          Positioned(
                                              top: 170,
                                              child: Text('Giá sản phẩm : ')),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 16,
                                ),
                                Container(
                                  // height: 1000,
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      child: Stack(
                                        children: [
                                          Positioned(
                                            child: Container(
                                              width: 165,
                                              height: 215,
                                              decoration: BoxDecoration(
                                                  color: Color(0XFFFBC16A),
                                                  borderRadius:
                                                      BorderRadius.circular(16)),
                                            ),
                                          ),
                                          Positioned(
                                            left: 13,
                                            top: 10,
                                            child:Center(
                                              child: Container(
                                                padding: EdgeInsets.all(8), // Border width
                                                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                                                child: ClipRRect(
                                                borderRadius: BorderRadius.circular(8),
                                                child: SizedBox.fromSize(
                                                  size: Size.fromRadius(62), // Image radius
                                                  child: Image.network('https://anhdep123.com/wp-content/uploads/2020/05/h%C3%ACnh-%E1%BA%A3nh-con-ch%C3%B3.jpg', fit: BoxFit.cover),
                                                ),
                                              ),
                                              ),
                                            ) ,
                                            
                                          ),
                                          Positioned(
                                              top: 150,
                                              child: Text('Tên sản phẩm')),
                                          Positioned(
                                              top: 170,
                                              child: Text('Giá sản phẩm : ')),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, left: 20, right: 20,bottom: 10),
              width: double.infinity,
              height: 2,
              color: Color(0XFFFBC16A),
            ),
            Container(
              margin:const EdgeInsets.only(left: 20, right: 20), 
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Liên hệ",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w300,fontFamily: 'CherryBombOne', ),),
                  Container(
                    child: Row(
                      children:<Widget> [
                        Icon(Icons.location_on,size: 24,color:Color(0XFFFBC16A) ,),
                        Text("Địa chỉ: Số 168 Thượng Đình - Thanh Xuân - Hà Nội")
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children:<Widget> [
                        Icon(Icons.phone_callback,size: 24,color:Color(0XFFFBC16A) ,),
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
    );
  }
}
