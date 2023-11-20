

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pet_shop_app/views/account_screen.dart';
import 'package:pet_shop_app/views/feed_screen.dart';
import 'package:pet_shop_app/views/home_screen.dart';
import 'package:pet_shop_app/views/notification_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  SharedPreferences? prefs;
  String username ="";
  void initSharedPref() async {
    // Doi shared prefs nay phai khoi tao xong
    prefs = await SharedPreferences.getInstance();
  }
  @override
  void initState() {
    initSharedPref();
    getUserName();
    //_homeCubit.getItems();
    super.initState();
  }
  void getUserName()async{
    DocumentSnapshot snap = await FirebaseFirestore.instance.collection('users').doc(FirebaseAuth.instance.currentUser!.uid).get(); 
    print(snap.data());
  }
  int currentTab=0;
  final List<Widget> screens =[
    //chuyển màn cho bottom bar
    HomeScreen(),
    NotificationScreen(),
    AccountScreen(),
  ];
final PageStorageBucket bucket =PageStorageBucket();
Widget currentScreen = HomeScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor:  Color(0XFFFBC16A),
        child:const Icon(Icons.camera,),
        onPressed: () {
          
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape:const CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:<Widget> [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen=HomeScreen();
                      currentTab=0;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home,color: currentTab == 0 ? Color(0XFFFBC16A) : Colors.grey,),
                      Text(
                        "Home",
                        style: TextStyle(
                          color: currentTab == 0 ? Color(0XFFFBC16A) : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen=FeedScreen();
                      currentTab=1;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.feed,color: currentTab == 1 ? Color(0XFFFBC16A) : Colors.grey,),
                      Text(
                        "Feed",
                        style: TextStyle(
                          color: currentTab == 1 ? Color(0XFFFBC16A): Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
               ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
               children: [
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen=NotificationScreen();
                      currentTab=2;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.notifications,color: currentTab == 2 ? Color(0XFFFBC16A) : Colors.grey,),
                      Text(
                        "Notifications",
                        style: TextStyle(
                          color: currentTab == 2 ? Color(0XFFFBC16A) : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                MaterialButton(
                  minWidth: 40,
                  onPressed: () {
                    setState(() {
                      currentScreen=AccountScreen();
                      currentTab=3;
                    });
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.account_circle,color: currentTab == 3 ? Color(0XFFFBC16A) : Colors.grey,),
                      Text(
                        "Account",
                        style: TextStyle(
                          color: currentTab == 3 ? Color(0XFFFBC16A) : Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
               ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
