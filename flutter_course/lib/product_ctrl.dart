import 'package:flutter/material.dart';

class ProducCtrl extends StatelessWidget {
  final Function addProduct;

  ProducCtrl(this.addProduct);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      onPressed: () {
        addProduct('Sweat');
      },
      child: Text('Add product'),
    );
  }
}
