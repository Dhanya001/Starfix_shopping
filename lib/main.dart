import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:starfix_shopping/Screen/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Starfix Shopping',
        theme: ThemeData(brightness: Brightness.light,primaryColor: Colors.white),
        //  0xffFFF8DC
        darkTheme: ThemeData(brightness: Brightness.dark,primaryColor: Color(0xff121212)),
        themeMode: ThemeMode.light,
      home: Homepage()
    );
  }
}
//testing purpose
/*Future<void> fetchProducts() async {
  final url = 'https://fakestoreapi.com/products';
  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    print(jsonData);
  } else {
    print('Failed to load products');
  }
}*/

/*
Scaffold(
        appBar: AppBar(
          title: Text('E-Commerce App'),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text('Fetch Products'),
            onPressed: () async {
              await fetchProducts();
            },
          ),
        ),
      ),
 */