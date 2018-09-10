import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AuthPageState();
  }
}

class _AuthPageState extends State<AuthPage> {
  final Map<String, dynamic> _formData = {
    'email': null,
    'password': null,
    'acceptterms': false
  };

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  DecorationImage _buildBackgroundImage() {
    return DecorationImage(
      fit: BoxFit.cover,
      colorFilter:
          ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
      image: AssetImage('assets/alotDonut.jpg'),
    );
  }

  Widget _buildEmailTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        filled: true,
        fillColor: Colors.white70,
      ),
      onSaved: (String value) {
        _formData['email'] = value;
      },
      validator: (String value) {
        if (value.isEmpty ||
            !RegExp(r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
                .hasMatch(value)) {
          return 'ใส่ให้เต็มเลยนะ!!ใส่อีเมลให้ถูก';
        }
      },
    );
  }

  Widget _buildPasswordTextFeild() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'Password',
        filled: true,
        fillColor: Colors.white70,
      ),
      onSaved: (String value) {
        _formData['password'] = value;
      },
      validator: (String value) {
        if (value.isEmpty || value.length < 6) {
          return 'ใส่ให้ถูกเซ่!!';
        }
      },
    );
  }

  Widget _buildAcceptSwitch() {
    return SwitchListTile(
      value: _formData['acceptterms'],
      onChanged: (bool value) {
        setState(() {
          _formData['acceptterms'] = value;
        });
      },
      title: Text('Accept Terms'),
    );
  }

  void _submitForm() {
    if (!_formKey.currentState.validate() || !_formData['acceptterms']) {
      return;
    }
    _formKey.currentState.save();
    print(_formData);
    Navigator.pushReplacementNamed(context, '/products');
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double targetWidth = deviceWidth > 550.0 ? 550.0 : deviceWidth * 0.95;

    return Scaffold(
        appBar: AppBar(
          title: Text('Login'),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: _buildBackgroundImage(),
          ),
          padding: EdgeInsets.all(10.0),
          child: Center(
            child: SingleChildScrollView(
              child: Container(
                width: targetWidth,
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      _buildEmailTextField(),
                      SizedBox(height: 8.0),
                      _buildPasswordTextFeild(),
                      _buildAcceptSwitch(),
                      SizedBox(height: 10.0),
                      RaisedButton(
                        // color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        child: Text('LOGIN'),
                        onPressed: _submitForm,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
