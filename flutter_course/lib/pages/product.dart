import 'package:flutter/material.dart';
import 'dart:async';

class ProductPage extends StatelessWidget {
  final String title;
  final String imgUrl;
  final double price;
  final String description;

  ProductPage(this.title, this.imgUrl, this.price, this.description);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        print('Back button');
        Navigator.pop(context, false);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(imgUrl),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 26.0,
                    fontFamily: 'Oswald',
                    fontWeight: FontWeight.bold),
              ),
            ),
            Row(
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
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Text(
                description,
                style: TextStyle(
                  fontFamily: 'Oswald',
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
