import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<Map<String, dynamic>> items = <Map<String, dynamic>>[].obs;
  final total = 0.0.obs;
  final RxMap itemCheckState = {}.obs;

  List<Map<String, dynamic>> get selectedItems {
    List<Map<String, dynamic>> selected = [];
    for (var item in items) {
      if (itemCheckState[item['id']] == true) {
        selected.add(item);
      }
    }
    return selected;
  }


  void updateItemCheckState(String itemId, bool value) {
    itemCheckState[itemId] = value;
    update();
  }
  
  void addItem(Map<String, dynamic> item) {
    items.add(item);
    calculateTotal();
  }

  void removeItem(int index) {
    items.removeAt(index);
    calculateTotal();
  }
  void updateTotal(double newTotal) {
    total.value = newTotal;
  }
  void calculateTotal() {
    double newTotal = 0.0;
    for (var item in items) {
      var priceValue = item['price'];
      if (priceValue is num) {
        newTotal += priceValue.toDouble();
      } else if (priceValue is String) {
        newTotal += double.tryParse(priceValue) ?? 0.0;
      }
    }
    total.value = newTotal;
  }
}
