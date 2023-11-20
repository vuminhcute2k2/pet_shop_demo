import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:pet_shop_app/router/app_router.dart';
import 'package:pet_shop_app/common/authentication.dart';
import 'package:pet_shop_app/views/login_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Stack(
            children: [
              //  Container(
              //       width: double.infinity,
              //       //height: ,
              //     ),
              Positioned(
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      color: Color(0XFFFBC16A),
                      padding: EdgeInsets.only(bottom: 20),
                      margin: EdgeInsets.only(bottom: 100),
                    ),
                  ),
                  Positioned(
                    //left: 500,
                    top: 130,
                    left:130,
                    child: Container(
                      padding: EdgeInsets.all(8), // Border width
                      decoration:
                          BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                      child: ClipOval(
                        child: SizedBox.fromSize(
                          size: Size.fromRadius(60), // Image radius
                          child: Image.network(
                              'https://png.pngtree.com/png-vector/20190307/ourmid/pngtree-vector-edit-profile-icon-png-image_780604.jpg',
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                      Navigator.pushNamed(context, AppRouterName.Information);
                  },
                  child:Row(
                    children: [
                      Image.asset('assets/image/setting_icon.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text('Chỉnh sửa thông tin',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                      const Icon(Icons.navigate_next,color: Color(0XFFFBC16A),)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    
                  },
                  child:Row(
                    children: [
                      Image.asset('assets/image/help_icon.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text('Trung tâm trợ giúp',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                      const Icon(Icons.navigate_next,color: Color(0XFFFBC16A),)
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: GestureDetector(
                    onTap: ()async {
                    //Navigator.pushNamed(context, AppRouterName.WidgetTree);
                    await Auth().logout();
                    },
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.symmetric(vertical: 16),
                      margin: const EdgeInsets.only(left: 20, right: 20),
                      width: 140,
                      child: Text(
                        'Đăng xuất',
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
        ]),
      ),
    );
  }
}
