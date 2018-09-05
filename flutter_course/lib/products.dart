import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  Products(this.products) {
    print('[Products Widget] Constructor');
  }

  Widget _buildProductItem(BuildContext context, index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Text(products[index]['title']),
          ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton(
              child: Text('Detail'),
              onPressed: () => Navigator.pushNamed<bool>(
                  context, '/product/' + index.toString()),
            )
          ]),
        ],
      ),
    );
  }

  Widget _buildProductList() {
    Widget productCard;
    if (products.length > 0) {
      productCard = ListView.builder(
        itemBuilder: _buildProductItem,
        itemCount: products.length,
      );
    } else {
      productCard = Container(); // Center(child: Text('Add some Choice'));
    }
    return productCard;
  }

  @override
  Widget build(BuildContext context) {
    print('[Products Widget] _buildProductList()');
    return _buildProductList();
  }
}
