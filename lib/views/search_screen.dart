import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var inputText="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              TextFormField(
                onChanged: (value) {
                  setState(() {
                    inputText = value;
                  });
                },
              ),
              Expanded(child: Container(
                child: StreamBuilder(
                  stream: FirebaseFirestore.instance.collection("products").where("key",isGreaterThan: inputText).snapshots(),
                  builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot){
                    if(snapshot.hasError){
                      return Center(child: Text("Something went wrong"),);

                    }
                    if(snapshot.connectionState==ConnectionState.waiting){
                      return Center(child: Text("Loading"),);
                      
                    } 
                    return ListView(
                      children: snapshot.data!.docs.map((DocumentSnapshot document){
                        Map<String,dynamic> data = document.data() as Map<String,dynamic>;
                        return Card(
                          elevation: 5,
                          child: ListTile(
                            title: Text(data['name']),
                            leading: Image.network(
                                        data["imgBig"],
                                      ),
                          ),
                        );
                      }).toList(),
                    );
                  },
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }
}