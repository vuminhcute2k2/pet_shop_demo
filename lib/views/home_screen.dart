import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

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
          children: [
            Container(
              child: Row(
                children: [
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Seach',
                      prefixIcon: const Icon(Icons.search),
                      hintStyle: TextStyle(color: Colors.grey.withOpacity(0.9)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(color: Color(0XFFFBC16A)),
                      ),

                    ),
                  ),
                  const Icon(Icons.card_travel,size: 6,),
                  const SizedBox(width: 10,),
                  const Icon(Icons.chat,size: 6,),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                const Text("Mèo SimiCuteVippro",style: TextStyle(
                  fontFamily: 'CherryBombOne',
                  fontSize: 28,
                ),),
                Container(
                  child: GestureDetector(
                    onTap: () {
                     // Navigator.pushNamed(context, AppRouterName.Home);
                    },
                    child: Container(
                      padding:const EdgeInsets.symmetric(vertical: 16),
                      child:const Text(
                          'Xem thêm',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'fonts/Roboto-Bold.ttf'),
                        ),
                        decoration: BoxDecoration(
                          // color: Color(0XFFFBC16A),
                          borderRadius: BorderRadius.circular(8),
                        ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
