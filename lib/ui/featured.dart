import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Featured extends StatefulWidget {
  @override
  _FeaturedState createState() => _FeaturedState();
}

class _FeaturedState extends State<Featured> {
  var url = "https://dev.kescript.co.ke/api/v1/featured-products";
  var data;

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
                  trailing: Icon(Icons.shopping_cart),
                  leading: Image.network(
                    data[index]['files'][0]['filePath'],
                    loadingBuilder: (context, child, progress) {
                      return progress == null
                          ? child
                          : CircularProgressIndicator();
                    },
                    width: 100,
                    height: 100,
                    semanticLabel: data[index]['title'],
                  ),
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
