import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

import '../models-provider/authenticate.dart';

enum AuthMode { Signup, Login }

class AuthScreen extends StatelessWidget {
  static const routeName = '/auth';

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    // final transformConfig = Matrix4.rotationZ(-8 * pi / 180);
    // transformConfig.translate(-10.0);
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(0, 0, 0, 1).withOpacity(0.5),
                  Color.fromRGBO(255, 255, 255, 1).withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0, 1],
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20.0),
                      padding:
                          EdgeInsets.symmetric(vertical: 3.0, horizontal: 40.0),
                      transform: Matrix4.rotationZ(-4 * pi / 180)
                        ..translate(-2.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(237, 230, 36, 1),
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 8,
                            color: Colors.black26,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: Text(
                        'Fantasy MotoGP',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 35,
                          fontFamily: 'Anton',
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: deviceSize.height > 600 ? 2 : 1,
                    child: LoginScreen(),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  LoginScreen({Key key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  AuthMode _authMode = AuthMode.Login;
  Map<String, String> _authData = {
    'email': '',
    'password': '',
    'username': '',
  };

  bool _isLoading = false;
  final _passwordController = TextEditingController();

  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState.save();
    setState(() {
      _isLoading = true;
    });
    if (_authMode == AuthMode.Login) {
      // Log user in
      await Provider.of<Authenticate>(context, listen: false).login(
        _authData['email'],
        _authData['password'],
        _authData['username'],
      );
    } else {
      // Sign user up
      await Provider.of<Authenticate>(context, listen: false).signUp(
        _authData['email'],
        _authData['password'],
        _authData['username'],
      );
    }
    setState(() {
      _isLoading = false;
    });
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Signup;
      });
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 8.0,
      child: Container(
        height: _authMode == AuthMode.Signup ? 420 : 260,
        constraints:
            BoxConstraints(minHeight: _authMode == AuthMode.Signup ? 420 : 260),
        width: deviceSize.width * 0.75,
        child: Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.all(8),
            child: Column(
              children: <Widget>[
                //////////////// EMAIL TEXT FORM FIELD //////////////////
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter Email:',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value.isEmpty || !value.contains('@')) {
                      return 'Invalid Email Address.';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _authData['email'] = value;
                  },
                ),
                ////////////////// USERNAME TEXT FORM FIELD /////////////////
                if (_authMode == AuthMode.Signup)
                  TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                    ),
                    // Check the database if the username is already taken
                    validator: (value) {
                      return null;
                    },
                    onSaved: (value) {
                      _authData['username'] = value;
                    },
                  ),
                //////////////// PASSWORD TEXT FORM FIELD ///////////////////
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Password',
                  ),
                  obscureText: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value.isEmpty || value.length < 4) {
                      return 'Enter Vaild Password';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _authData['password'] = value;
                  },
                ),
                //////////////////// CONFIRM PASSWORD FOR USERS SIGNING UP /////////////
                if (_authMode == AuthMode.Signup)
                  TextFormField(
                    enabled: _authMode == AuthMode.Signup,
                    decoration: InputDecoration(labelText: 'Confirm Password'),
                    obscureText: true,
                    validator: _authMode == AuthMode.Signup
                        ? (value) {
                            if (value != _passwordController.text) {
                              return 'Passwords do not match!';
                            }
                            return null;
                          }
                        : null,
                  ),
                Padding(
                  padding: EdgeInsets.only(top: 15),
                ),
                if (_isLoading) CircularProgressIndicator(),
                if (!_isLoading)
                  //SUBMIT BUTTON
                  ElevatedButton(
                    child:
                        Text(_authMode == AuthMode.Login ? 'Login' : 'Sign Up'),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(0, 0, 0, 1),
                      ),
                    ),
                    onPressed: _submit,
                  ),
                TextButton(
                  child: Text(
                      '${_authMode == AuthMode.Login ? 'SIGNUP' : 'LOGIN'} INSTEAD'),
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.resolveWith(
                          (state) => Colors.black87)),
                  onPressed: _switchAuthMode,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
