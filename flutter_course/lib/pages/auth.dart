import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  String _emailValue;
  String _passwordValue;
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.4), BlendMode.dstATop),
              image: AssetImage('assets/alotDonut.jpg'),
            ),
          ),
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Email',
                      filled: true,
                      fillColor: Colors.white70,
                    ),
                    onChanged: (String value) {
                      setState(() {
                        _emailValue = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 7.0,
                  ),
                  TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.white70,
                    ),
                    onChanged: (String value) {
                      setState(() {
                        _passwordValue = value;
                      });
                    },
                  ),
                  SwitchListTile(
                    value: _acceptTerms,
                    onChanged: (bool value) {
                      setState(() {
                        _acceptTerms = value;
                      });
                    },
                    title: Text('Accept Terms'),
                  ),
                  SizedBox(height: 10.0),
                  RaisedButton(
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    child: Text('LOGIN'),
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/products');
                    },
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
