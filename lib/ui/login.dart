import 'package:flutter/material.dart';
import 'package:transmall_featured/ui/featured.dart';

class Login extends StatefulWidget {
  static const String routeName = "/login";

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final formKey = GlobalKey<FormState>();
  String _email;
  String _password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Center(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: <Widget>[
                    Center(
                      child: Text(
                        "Please sign in!",
                        style: TextStyle(fontSize: 25, color: Colors.green),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (String value) {
                        if(value.isEmpty) {
                          return "Email is required";
                        }

                        if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value)){
                          return "Enter a valid email";
                        }

                        return null;
                      },
                      onSaved: (String value){
                        _email = value;
                      },
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Email",
                          labelText: "Email"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      validator: (String value){
                        if(value.isEmpty){
                          return "Password is required";
                        }

                        if(value.length < 8){
                          return "Password must have atleast 8 characters";
                        }

                        return null;
                      },
                      onSaved: (String value){
                        _password = value;
                      },
                      obscureText: true,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Enter Password",
                          labelText: "Password"),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RaisedButton(
                      onPressed: () {
                        if(!formKey.currentState.validate()){
                          return;
                        }
                        Navigator.pushNamed(context, Featured.routeName);
                      },
                      child: Text("Sign in"),
                      color: Colors.green,
                      textColor: Colors.white,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
