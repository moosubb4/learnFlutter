import 'package:flutter/material.dart';

import '../product_manager.dart';

class ProductsPage extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  // final Function addPdroduct;
  // final Function deleteProduct;

  ProductsPage(this.products);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Choose'),
            ),
            ListTile(
              leading: Icon(Icons.edit),
              title: Text('Manage Product'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/admin');
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text('HomePage'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {},
          )
        ],
      ),
      body: ProductManager(products),
    );
  }
}
