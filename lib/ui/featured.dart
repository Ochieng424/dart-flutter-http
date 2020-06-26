import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:http/http.dart' as http;
import 'package:transmall_featured/cart.dart';
import 'dart:convert';

class Featured extends StatefulWidget {
  static const String routeName = "/featured";
  @override
  _FeaturedState createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {
  var url = "https://dev.kescript.co.ke/api/v1/featured-products";
  var data;
  final Cart carty = Cart();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchProducts();
  }

  fetchProducts() async {
    var res = await http.get(url);
    data = jsonDecode(res.body);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Featured Products"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.shopping_cart, color: Colors.white,), onPressed: null),
          RaisedButton(
            child: Observer(builder:(_) => Text("${(carty.cart).length}")),
            textColor: Colors.white,
          )
        ],
      ),
      body: data != null
          ? ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(data[index]['title']),
                  subtitle: Text(
                    "Ksh ${data[index]['price']}",
                    style: TextStyle(color: Colors.blue),
                  ),
                  trailing: RaisedButton(
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: (){
                      carty.addToCart(data[index]);
                      debugPrint('PRESSED');
                      setState(() {

                      });
                    },
                    child: Icon(Icons.add),
                  ),
                  leading: Container(
                    width: 50,
                    height: 50,
                    child: Image.network(
                      data[index]['files'][0]['filePath'],
                      loadingBuilder: (context, child, progress) {
                        return progress == null
                            ? child
                            : CircularProgressIndicator();
                      },
                      fit: BoxFit.contain,
                      semanticLabel: data[index]['title'],
                    ),
                  )
                );
              },
              itemCount: data.length,
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
