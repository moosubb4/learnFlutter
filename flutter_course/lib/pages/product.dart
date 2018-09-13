import 'package:flutter/material.dart';
import 'dart:async';
import 'package:scoped_model/scoped_model.dart';

import '../widgets/ui_element/title_default.dart';
import '../models/product.dart';
import '../scoped-models/product.dart';

class ProductPage extends StatelessWidget {
  final int productIndex;
  ProductPage(this.productIndex);

  Widget _builAddressPriceRow(double price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Siam Center One,Bangkok',
          style: TextStyle(
            fontFamily: 'Oswald',
            color: Colors.grey,
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 5.0),
          child: Text(
            '|',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ),
        Text(
          '\$' + price.toString(),
          style: TextStyle(
            fontFamily: 'Oswald',
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(onWillPop: () {
      print('Back button');
      Navigator.pop(context, false);
      return Future.value(false);
    }, child: ScopedModelDescendant<ProductsModel>(
      builder: (BuildContext context, Widget child, ProductsModel model) {
        final Product products = model.products[productIndex];
        return Scaffold(
          appBar: AppBar(
            title: Text(products.title),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(products.image),
              Container(
                padding: EdgeInsets.all(10.0),
                child: TitleDefault(products.title),
              ),
              _builAddressPriceRow(products.price),
              Container(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  products.description,
                  style: TextStyle(
                    fontFamily: 'Oswald',
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        );
      },
    ));
  }
}
