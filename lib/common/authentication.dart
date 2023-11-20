import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pet_shop_app/model/user.dart' as model;
class Auth {
  final FirebaseAuth _firebaseAuth =FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? get currenUser => _firebaseAuth.currentUser;

  Stream<User?> get authenStateChanges => _firebaseAuth.authStateChanges();
  // loginWithWmailAndPassword(String email,String password) async{
  //   await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
  // }
  
  // signupWithEmailAndPassword(String email,String password)async{
  //   await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
  // }
  Future<String> signUpUser({
    required String email,
    required String firtname,
    // required Timestamp createAt,
    // required String image,
    required String lastname,
    required String password,
    //required String confirmpassword,
  })async{
    String res ="Some error occurred";
    try{
      if(email.isNotEmpty ||firtname.isNotEmpty ||lastname.isNotEmpty ||password.isNotEmpty  ){
        //register user
       UserCredential cred = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
       
       print(cred.user!.uid);
       //add user to our database
      model.User user = model.User(email: email, uid:cred.user!.uid, firtname: firtname, lastname: lastname, password: password, followers: [], following: []);
      await _firestore.collection('users').doc(cred.user!.uid).set(user.toJson(),);
       res = "success";

      }
    }
    catch(err){
      res= err.toString();
    }
    return res;
  }

  //login user
  Future<String>  loginUser({
    required String email,
    required String password,
  })async {
    String res = "Some error occurred";
    try{
      if(email.isNotEmpty || password.isNotEmpty){
       await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
       res = "success";
      }else{
        res ="Please enter all the fields";
      }
    }
    catch(err){
      res = err.toString();
    }
    return res;
  }
  logout()async{
    await _firebaseAuth.signOut();
  }
}