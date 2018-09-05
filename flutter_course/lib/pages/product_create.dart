import 'package:flutter/material.dart';

class ProductCreatePage extends StatefulWidget {
  final Function addProduct;

  ProductCreatePage(this.addProduct);

  @override
  State<StatefulWidget> createState() {
    return _ProductCreatePageState();
  }
}

class _ProductCreatePageState extends State<ProductCreatePage> {
  String titleValue;
  String descriptionValue;
  double priceValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      child: ListView(
        children: <Widget>[
          TextField(
            decoration: InputDecoration(
              labelText: 'Product Title',
            ),
            onChanged: (String value) {
              setState(() {
                titleValue = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Product Description',
            ),
            maxLines: 4,
            onChanged: (String value) {
              setState(() {
                descriptionValue = value;
              });
            },
          ),
          TextField(
            decoration: InputDecoration(
              labelText: 'Product Price',
            ),
            maxLength: 4,
            keyboardType: TextInputType.number,
            onChanged: (String value) {
              setState(() {
                priceValue = double.parse(value);
              });
            },
          ),
          RaisedButton(
            child: Text('Save'),
            onPressed: () {
              final Map<String, dynamic> product = {
                'title': titleValue,
                'description': descriptionValue,
                'price': priceValue,
                'image': 'assets/donut.png'
              };
              widget.addProduct(product);
              // showModalBottomSheet(
              //   context: context,
              //   builder: (BuildContext context) {
              //     return Center(
              //       child: Text('Modal'),
              //     );
              //   },
              // );
            },
          )
        ],
      ),
    );
  }
}

// Center(
//         child: RaisedButton(
//       child: Text('save'),
//       onPressed: () {
//         showModalBottomSheet(
//           context: context,
//           builder: (BuildContext context) {
//             return Center(
//               child: Text('Modal'),
//             );
//           },
//         );
//       },
//     ))
