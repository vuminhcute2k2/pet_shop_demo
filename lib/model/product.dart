// ignore_for_file: public_member_api_docs, sort_constructors_first
class Product {
  //final String typeOfProduct;
  final List<Card> listCard;

  Product({
    //required this.typeOfProduct,
    required this.listCard, 
  });
}

class Card {
  final String urlImage;
  final String name;
  final int price;
  
  Card({
    required this.urlImage,
    required this.name,
    required this.price,
  });
}

final Product product = Product(listCard: [Card(urlImage:  "https://www.thesprucepets.com/thmb/hxWjs7evF2hP1Fb1c1HAvRi_Rw0=/2765x0/filters:no_upscale():strip_icc()/chinese-dog-breeds-4797219-hero-2a1e9c5ed2c54d00aef75b05c5db399c.jpg", name: "hiep du", price: 1)]);

