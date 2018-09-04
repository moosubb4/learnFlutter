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

  @override
  State<StatefulWidget> createState() {
    print('[ProductManager Widget] createState()');
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<Map<String, String>> _products = [];

  @override
  void initState() {
    print('[ProductManager State] initState()');
    if (widget.startingProduct != null) {
      _products.add(widget.startingProduct);
    }
    super.initState();
  }

  @override
  void didUpdateWidget(ProductManager oldWidget) {
    print('[ProductManager State] didUpdateWidget()');
    super.didUpdateWidget(oldWidget);
  }
}
