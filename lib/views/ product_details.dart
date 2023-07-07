import 'package:counter_button/counter_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int _counter = 0;
  List<UserHorizontal> listhorizontal = [
    UserHorizontal(
        avatar: "https://cdn-icons-png.flaticon.com/512/147/147142.png",
        username: "user1",
        message: "1 chấm sành điệu"),
    UserHorizontal(
        avatar: "https://cdn-icons-png.flaticon.com/512/147/147142.png",
        username: "user1",
        message: "1 chấm sành điệu"),
    UserHorizontal(
        avatar: "https://cdn-icons-png.flaticon.com/512/147/147142.png",
        username: "user1",
        message: "1 chấm sành điệu"),
  ];
  List<UserHorizontal> listHorizontalSearching = [
    UserHorizontal(
        avatar: "https://cdn-icons-png.flaticon.com/512/147/147142.png",
        username: "user1",
        message: "một chấm sành điệu"),
    UserHorizontal(
        avatar: "https://cdn-icons-png.flaticon.com/512/147/147142.png",
        username: "user1",
        message: "1 chấm sành điệu"),
    UserHorizontal(
        avatar: "https://cdn-icons-png.flaticon.com/512/147/147142.png",
        username: "user1",
        message: "1 chấm sành điệu"),
  ];
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
  Widget build(BuildContext context) {
    int currentIndex = 0;
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
                      onPressed: () {},
                      icon: Icon(
                        Icons.local_grocery_store,
                        size: 36,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 210,
              width: 340,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                color: Colors.redAccent,
              ),
              child: Image.network(
                "https://duhocchaudaiduong.edu.vn/hinh-nen-cho-cute/imager_4_4428_700.jpg",
                // height: 210,
                // width: 340,
                //fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              width: double.infinity,
              height: 1150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(8.0)),
                color: Color(0XFFFBC16A),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(
                      top: 16,
                    ),
                    width: double.infinity,
                    height: 44,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.white,
                    ),
                    child: Text(
                      "Tên sản phẩm",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const Text("Tổng tiền"),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(top: 16),
                    width: 130,
                    height: 30,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.white,
                    ),
                    child: Text('tiền'),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  const Text("Số lượng"),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                        color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: _incrementCounter,
                          ),
                          Text(
                            '$_counter',
                            style: TextStyle(fontSize: 24.0),
                          ),
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: _decrementCounter,
                          ),
                        ],
                      )),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            color: Colors.white,
                          ),
                          child: Image.network(
                            "https://kienthuc5s.com/wp-content/uploads/2022/01/11_hinh-anh-cho.jpg",
                            width: 100,
                            height: 100,
                          ),
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            color: Colors.white,
                          ),
                          child: Image.network(
                            "https://kienthuc5s.com/wp-content/uploads/2022/01/11_hinh-anh-cho.jpg",
                            width: 100,
                            height: 100,
                            //fit: BoxFit.cover,
                          ),
                        )),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(8.0)),
                            color: Colors.white,
                          ),
                          child: Image.network(
                            "https://kienthuc5s.com/wp-content/uploads/2022/01/11_hinh-anh-cho.jpg",
                            width: 100,
                            height: 100,
                          ),
                        )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: 340,
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.white,
                    ),
                    child: Text('Thông tin chi tiết sản phẩm'),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    "Bình Luận",
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
                  ),
                  Container(
                    width: double.infinity,
                    height: 500,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white),
                    child: Container(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: listHorizontalSearching.length,
                        itemBuilder: (context, index) {
                          currentIndex = index;
                          return Container(
                            height: 60,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            margin:
                                EdgeInsets.only(bottom: 5, left: 5, right: 5),
                            padding: EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 50,
                                  //height: 70,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 2,
                                      color: Colors.black,
                                    ),
                                    borderRadius: BorderRadius.circular(70),
                                  ),
                                  margin: EdgeInsets.symmetric(horizontal: 10),
                                  padding: EdgeInsets.all(2),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(35),
                                      child: Image.network(
                                          listHorizontalSearching[index]
                                              .avatar)),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        child: Text(
                                          listHorizontalSearching[index]
                                              .username,
                                          textAlign: TextAlign.left,
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Text(listHorizontalSearching[index]
                                          .message),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Container(
                          //width: 80,
                          height: 100,
                          margin:
                              const EdgeInsets.only(bottom: 10, top: 10,left: 10,right: 10),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(35),
                            child:
                                Image.asset('assets/image/facebook_logo.png'),
                          ),
                        ),
                        Expanded(
                            child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.yellow.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(40)),
                          child: Row(
                            children: <Widget>[
                              const Icon(
                                  Icons.sentiment_satisfied_alt_outlined),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: TextField(
                                decoration: InputDecoration(
                                    hintText: "Type message",
                                    border: InputBorder.none),
                              )),
                              const Icon(Icons.attach_file),
                              const Icon(Icons.camera_alt_outlined),
                            ],
                          ),
                        )),
                        const SizedBox(
                          width: 10,
                        ),
                      ],
                    ),
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

class UserHorizontal {
  String avatar;
  String username;
  String message;
  UserHorizontal(
      {required this.avatar, required this.username, required this.message});
}
