import 'package:flutter/material.dart';
import './products.dart';
import './product_ctrl.dart';

class ProductManager extends StatelessWidget {
  final List<Map<String, String>> products;
  final Function addPdroduct;
  final Function deleteProduct;

  ProductManager(this.products, this.addPdroduct, this.deleteProduct);

  @override
  Widget build(BuildContext context) {
    print('[ProductManager State] build()');
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0),
          child: ProducCtrl(addPdroduct),
        ),
        Expanded(
          child: Products(products, deleteProduct: deleteProduct),
        ),
      ],
    );
  }
}

