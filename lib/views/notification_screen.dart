import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
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
          "Thông báo",
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
      body:SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 600,
              child: ListView.builder(
                itemCount: 4,
                 shrinkWrap: true,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                   return Column(
                        children: [
                          Container(
                            width: double.infinity,
                              //height: ,
                              color:Color(0XFFFBC16A) ,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("ID:sadsdasda3123x12",style: TextStyle(fontSize: 24,fontWeight: FontWeight.w600),),
                                  Text("Overview: Mèo anh lông ngắn xanh cute",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300 ),),
                                  Text("Địa chỉ: Đông anh",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300 ),),
                                  Text("Date: 13/9/2021",style: TextStyle(fontSize: 14,fontWeight: FontWeight.w300 ),),
                                  Text("Tổng tiền:133232đ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.red),)
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}