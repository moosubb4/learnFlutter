import 'package:scoped_model/scoped_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/user.dart';
import '../models/product.dart';

class ConnectedProductsModel extends Model {
  List<Product> _products = [];
  User _authenticateUser;
  int _selProductIndex;
  String url = 'https://fultter-product.firebaseio.com/products.json';
  void addProduct(
      String title, String description, String image, double price) {
    final Map<String, dynamic> productData = {
      'title': title,
      'description': description,
      'image':
          'https://banner2.kisspng.com/20180324/osq/kisspng-hamburger-bacon-sushi-pizza-cheeseburger-burger-king-5ab6e5746c0b92.1832730815219357324426.jpg',
      'price': price,
      'userEmail': _authenticateUser.email,
      'userId': _authenticateUser.id
    };

    http.post(url, body: jsonEncode(productData)).then((http.Response res) {
      final Map<String, dynamic> resData = json.decode(res.body);
      final Product newProduct = Product(
        id: resData['name'],
        title: title,
        description: description,
        image: image,
        price: price,
        userEmail: _authenticateUser.email,
        userId: _authenticateUser.id,
      );
      _products.add(newProduct);
      notifyListeners();
    });
  }

  // void selectProduct(String productId) {
  //   _selProductId = productId;
  //   if (productId != null) {
  //     notifyListeners();
  //   }
  // }
}

class ProductsModel extends ConnectedProductsModel {
  bool _showFavorite = false;

  List<Product> get allProducts {
    return List.from(_products);
  }

  List<Product> get displayedProducts {
    return _showFavorite
        ? List.from(_products.where((Product prod) => prod.isFavotite).toList())
        : List.from(_products);
  }

  int get selectedProductIndex {
    return _selProductIndex;
  }

  Product get selectedProduct {
    return selectedProductIndex == null
        ? null
        : _products[selectedProductIndex];
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
    _products[selectedProductIndex] = updateProduct;
    // _selProductIndex = null;
    notifyListeners();
  }

  void deleteProduct() {
    _products.removeAt(selectedProductIndex);
    // _selProductIndex = null;
    notifyListeners();
  }

  void fetchProducts() {
    http.get(url).then((http.Response res) {
      final List<Product> fecthedProductList = [];

      final Map<String, dynamic> productListData = json.decode(res.body);

      print(productListData);

      productListData.forEach((String productId, dynamic productData) {
        final Product product = Product(
            id: productId,
            title: productData['title'],
            description: productData['description'],
            image: productData['image'],
            price: productData['price'],
            userEmail: productData['userEmail'],
            userId: productData['userId']);
        fecthedProductList.add(product);
      });
      _products = fecthedProductList;
      notifyListeners();
    });
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
    _products[selectedProductIndex] = updateProduct;
    // _selProductIndex = null;
    notifyListeners();
  }

  void selectProduct(int index) {
    _selProductIndex = index;
    // if (index != null) {
    notifyListeners();
    // }
  }

  void toggleDisplayMode() {
    _showFavorite = !_showFavorite;
    notifyListeners();
  }
}

class UserModel extends ConnectedProductsModel {
  void login(String email, String password) {
    _authenticateUser = User(id: 'moosubb', email: email, password: password);
  }
}
