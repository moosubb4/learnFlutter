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
  final Map<String, dynamic> _formData = {
    'title': null,
    'description': null,
    'price': null,
    'image': 'assets/donut.png'
  };
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _builTitleTexrtField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Product Title',
      ),
      onSaved: (String value) {
        _formData['title'] = value;
      },
      validator: (String value) {
        if (value.isEmpty) {
          return 'ใส่ให้เต็มเลยนะ!!';
        }
      },
    );
  }

  Widget _buildDescriptionTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Product Description',
      ),
      maxLines: 4,
      validator: (String value) {
        if (value.isEmpty || value.length < 10) {
          return 'ใส่ให้เต็มเลยนะ!!ห้ามน้อยกว่า10ด้วย';
        }
      },
      onSaved: (String value) {
        _formData['description'] = value;
      },
    );
  }

  Widget _buildPriceTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Product Price',
      ),
      maxLength: 4,
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r'^(?:[1-9]\d*|0)?(?:\.\d+)?$').hasMatch(value)) {
          return 'ใส่ให้เต็มเลยนะ!!ใส่ตัวเลขอย่างเดียววว';
        }
      },
      keyboardType: TextInputType.number,
      onSaved: (String value) {
        _formData['price'] = double.parse(value);
      },
    );
  }

  void _submitForm() {
    if (!_formKey.currentState.validate()) {
      return;
    }
    _formKey.currentState.save();
    widget.addProduct(_formData);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;
    final targetWidth = deviceWidth > 550.0 ? 550.0 : deviceWidth * 0.95;
    final targetPadding = deviceWidth - targetWidth;
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Container(
        width: targetWidth,
        margin: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: targetPadding / 2),
            children: <Widget>[
              _builTitleTexrtField(),
              _buildDescriptionTextField(),
              _buildPriceTextField(),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                child: Text('Save'),
                // color: Theme.of(context).accentColor,
                textColor: Colors.white,
                onPressed: _submitForm,
              )
              // GestureDetector(
              //   onTap: _submitForm,
              //   child: Container(
              //     color: Colors.lime,
              //     padding: EdgeInsets.all(5.0),
              //     child: Text('Tab me to save!'),
              //   ),
              // ),
            ],
          ),
        ),
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
