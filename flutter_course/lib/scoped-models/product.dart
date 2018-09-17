import 'package:scoped_model/scoped_model.dart';

import '../models/product.dart';
import './connected_products.dart';

class ProductsModel extends ConnectedProducts {
  bool _showFavorite = false;

  List<Product> get allProducts {
    return List.from(products);
  }

  List<Product> get displayedProducts {
    return _showFavorite
        ? List.from(products.where((Product prod) => prod.isFavotite).toList())
        : List.from(products);
  }

  int get selectedProductIndex {
    return selProductIndex;
  }

  Product get selectedProduct {
    return selProductIndex == null ? null : products[selProductIndex];
  }

  bool get displayFavoriteOnly {
    return _showFavorite;
  }

  void updateProduct(
      String title, String description, String image, double price) {
    final Product updateProduct = Product(
      title: title,
      description: description,
      image: image,
      price: price,
      userEmail: selectedProduct.userEmail,
      userId: selectedProduct.userId,
    );
    products[selProductIndex] = updateProduct;
    selProductIndex = null;
    notifyListeners();
  }

  void deleteProduct() {
    products.removeAt(selProductIndex);
    selProductIndex = null;
    notifyListeners();
  }

  void toggleProductFavoriteStatus() {
    final bool isCurrentlyFavorite = selectedProduct.isFavotite;
    final bool newFavoriteStatus = !isCurrentlyFavorite;
    final Product updateProduct = Product(
        title: selectedProduct.title,
        description: selectedProduct.description,
        price: selectedProduct.price,
        image: selectedProduct.image,
        userEmail: selectedProduct.userEmail,
        userId: selectedProduct.userId,
        isFavotite: newFavoriteStatus);
    products[selProductIndex] = updateProduct;
    selProductIndex = null;
    notifyListeners();
  }

  void selectProduct(int index) {
    selProductIndex = index;
    notifyListeners();
  }

  void toggleDisplayMode() {
    _showFavorite = !_showFavorite;
    notifyListeners();
  }
}
