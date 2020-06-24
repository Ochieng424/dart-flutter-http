import 'package:flutter/material.dart';
import 'package:transmall_featured/ui/featured.dart';
import 'package:transmall_featured/ui/login.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login(),
    theme: ThemeData(
      primarySwatch: Colors.green
    ),
    routes: {
      Login.routeName: (context) => Login(),
      Featured.routeName: (context) => Featured()
    },
  ));
}
