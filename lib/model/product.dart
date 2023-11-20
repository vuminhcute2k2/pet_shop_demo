// ignore_for_file: public_member_api_docs, sort_constructors_first
class ProductModel {
  // final String id;
  // final String description;
  // final List<String> image;
  // final String imgBig;
  // final String key;
  // final String name;
  // final String price;
  // ProductModel({
  //   required this.id,
  //   required this.description,
  //   required this.image,
  //   required this.imgBig,
  //   required this.key,
  //   required this.name,
  //   required this.price,
  // });
  // Map<String,dynamic> toJson() => {
  //   "id" : id,
  //   "description" : description,
  //   "image" : image,
  //   "imgBig" : imgBig,
  //   "key" : key,
  //   "name" : name,
  //   "price" : price,
  // };
  static const ID = "id";
  static const DESCRIPTION = "description";
  static const IMAGE = "image";
  static const IMGBIG = "imgBig";
  static const KEY = "key";
  static const NAME = "name";
  static const PRICE = "price";

  String? id;
  String? description;
  List<String>? image;
  String? imgBig;
  String? key;
  String? name;
  String? price;
  ProductModel({
    required this.id,
    required this.description,
    required this.image,
    required this.imgBig,
    required this.key,
    required this.name,
    required this.price,
  });
  
  ProductModel.fromMap(Map<String, dynamic> data){
    id = data[ID];
    description =data[DESCRIPTION];
    image = data[IMAGE];
    imgBig =data[IMGBIG];
    key =data[KEY];
    name = data[NAME];
    price = data[PRICE].toDouble();
  }
  
}

