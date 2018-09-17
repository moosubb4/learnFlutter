import 'package:scoped_model/scoped_model.dart';
import '../models/product.dart';

class ProductsModel extends Model {
  List<Product> _products = [];
  int _selectProductIndex;

  List<Product> get products {
    return List.from(_products);
  }

  int get selectedProductIndex {
    return _selectProductIndex;
  }

  Product get selectedProduct {
    return _selectProductIndex == null ? null : _products[_selectProductIndex];
  }

  void addProduct(Product product) {
    _products.add(product);
    _selectProductIndex = null;
  }

  void updateProduct(Product product) {
    _products[_selectProductIndex] = product;
    _selectProductIndex = null;
  }

  void deleteProduct() {
    _products.removeAt(_selectProductIndex);
    _selectProductIndex = null;
  }

  void selectProduct(int index) {
    _selectProductIndex = index;
  }
}
