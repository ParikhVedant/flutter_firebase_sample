import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  LoginPage loginPage = new LoginPage();
  runApp(loginPage);
}

class LoginPage extends StatefulWidget {
  State<LoginPage> createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State<LoginPage> {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: Scaffold(
        appBar: _loginPageScaffoldAppBar(),
        body: Builder(builder: _loginPageSaffoldBody),
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();

  Widget _loginPageSaffoldBody(BuildContext context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: EdgeInsets.all(32),
        children: <Widget>[
          Center(
            child: Icon(
              Icons.person,
              size: 128,
              color: Theme.of(context).primaryColor,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          TextFormField(
            validator: (String content) {
              if (content.length == 0) {
                return "Please enter valid email";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelText: "Email",
              hintText: "Enter Your Email",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          TextFormField(
            obscureText: true,
            validator: (String content) {
              if (content.length < 8) {
                return "Minimum 8 digit password";
              } else {
                return null;
              }
            },
            decoration: InputDecoration(
              labelText: "Password",
              hintText: "Enter Your Password",
              border: OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 16,
          ),
          RaisedButton(
            color: Theme.of(context).accentColor,
            padding: EdgeInsets.only(
              left: 48,
              right: 48,
              top: 8,
              bottom: 8,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4),
            ),
            onPressed: () {
              // If statement is validating the input fields.
              if (_formKey.currentState.validate()) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Checking",
                    ),
                  ),
                  // TODO: Login Validation
                );
              }
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Icon(
                  Icons.lock_open,
                ),
                SizedBox(width: 4),
                Text(
                  "Submit",
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _loginPageScaffoldAppBar() {
    return AppBar(
      title: Text(
        "Login",
      ),
      // actions: <Widget>[
      //   Icon(
      //     Icons.add,
      //   ),
      //   Icon(
      //     Icons.share,
      //   ),
      // ],
    );
  }
}
