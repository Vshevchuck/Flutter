import '../utils/images/images_name.dart';
import '../utils/models/models.dart';

abstract class Data {
  static List<ElementOfInstance> selectedProducts = [];
  static List<ElementOfInstance> products = [
    ElementOfInstance(235, -15, 'hoodie #1', ImagesName.product1),
    ElementOfInstance(365, -10, 'hoodie #2', ImagesName.product2),
    ElementOfInstance(100, -25, 'hoodie #3', ImagesName.product3),
    ElementOfInstance(175, -20, 'hoodie #4', ImagesName.product4),
    ElementOfInstance(400, -5, 'hoodie #5', ImagesName.product5),
    ElementOfInstance(188, -22, 'hoodie #6', ImagesName.product6),
  ];
  static bool checkInData(ElementOfInstance product) {
    for (int i = 0; i < selectedProducts.length; i++) {
      if (selectedProducts[i].text == product.text) {
        return true;
      }
    }
    return false;
  }
}
