import 'package:scoped_model/scoped_model.dart';

import '../models/user.dart';
import '../models/product.dart';

class ConnectedProducts extends Model {
  List<Product> products = [];
  User authenticateUser;
  int selProductIndex;

  void addProduct(
      String title, String description, String image, double price) {
    final Product newProduct = Product(
      title: title,
      description: description,
      image: image,
      price: price,
      userEmail: authenticateUser.email,
      userId: authenticateUser.id,
    );
    products.add(newProduct);
    selProductIndex = null;
    notifyListeners();
  }
}
