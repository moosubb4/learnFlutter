import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

import '../pages/product_edit.dart';
import '../scoped-models/main.dart';

class ProductListPage extends StatelessWidget {
  Widget _buildEditButton(BuildContext context, int index, MainModel model) {
    return IconButton(
      icon: Icon(Icons.edit),
      onPressed: () {
        model.selectProduct(index);
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return ProductEditPage();
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
      builder: (BuildContext context, Widget child, MainModel model) {
        return ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Dismissible(
              key: Key(model.allProducts[index].title),
              background: Container(
                color: Colors.red,
              ),
              onDismissed: (DismissDirection direction) {
                if (direction == DismissDirection.endToStart) {
                  model.selectProduct(index);
                  model.deleteProduct();
                } else if (direction == DismissDirection.startToEnd) {
                  print('Swiped S To E');
                } else {
                  print('ELSE Swiped ');
                }
              },
              child: Column(
                children: <Widget>[
                  ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.black,
                        backgroundImage:
                            AssetImage(model.allProducts[index].image),
                      ),
                      title: Text(model.allProducts[index].title),
                      subtitle: Text(
                          '\$${model.allProducts[index].price.toString()}'),
                      trailing: _buildEditButton(context, index, model)),
                  Divider(color: Colors.grey),
                ],
              ),
            );
          },
          itemCount: model.allProducts.length,
        );
      },
    );
  }
}
