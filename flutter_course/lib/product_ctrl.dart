import 'package:flutter/material.dart';

class ProducCtrl extends StatelessWidget {
  final Function addProduct;

  ProducCtrl(this.addProduct);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      onPressed: () {
        addProduct({'title': 'donut', 'image': 'assets/donut.png'});
      },
      child: Text('Add product'),
    );
  }
}
