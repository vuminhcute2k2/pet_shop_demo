// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final String email;
  final String uid;
  final String firtname;
  final String lastname;
  final String password;
  final List followers;
  final List following;

  const User({
    required this.email,
    required this.uid,
    required this.firtname,
    required this.lastname,
    required this.password,
    required this.followers,
    required this.following,
  });

  Map<String,dynamic> toJson() => {
    "email" : email,
    "uid" : uid,
    "firtname" : firtname,
    "lastname" : lastname,
    "password" : password,
    "followers" : followers,
    "following" : following,
  };
}
