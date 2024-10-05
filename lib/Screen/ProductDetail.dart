import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Productdetail extends StatefulWidget {
  final id;
  Productdetail(this.id);

  @override
  State<Productdetail> createState() => _ProductdetailState();
}

class _ProductdetailState extends State<Productdetail> {
  bool isFavorite = false;
  Map _products={};
  int _cartCount = 1;

  Future<void> _GetSingleProduct() async{
    final url='https://fakestoreapi.com/products/${widget.id}';
    final response= await http.get(Uri.parse(url));
    if(response.statusCode==200){
      final jsondata=jsonDecode(response.body);
      setState(() {
        _products=jsondata;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _GetSingleProduct();
  }

  void _showPayDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Pay Now'),
          content: Text('Please pay \$${_products['price'] ?? ''}'),
          actions: [
            TextButton(
              child: Text('Pay'),
              onPressed: () {
                // Add logic to handle payment
                Navigator.of(context).pop();
                },
            ),
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
                },
            ),
          ],
        );
        },);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      /*appBar: AppBar(
        title: Text(_products['title'] ?? 'Loading...'),
      ),*/
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 80),
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [

                    //Image Container
                    SizedBox(height: 60,),
                    Container(
                        height: 350,
                        child: Image.network(_products['image'] ?? '')),

                    /*//Add isFavorite icon and share button on continer of image
                    Container(
                      height: 350,
                      child: Stack(
                        children: [
                          // The product image
                          Image.network(_products['image'] ?? '',
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                          // Positioned widgets for icons
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Column(
                              children: [
                                // Favorite Icon
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isFavorite = !isFavorite;
                                    });
                                  },
                                  child: Icon(
                                    Icons.favorite,
                                    color: isFavorite ? Colors.pink : Colors.grey,
                                    size: 30,
                                  ),
                                ),
                                SizedBox(height: 10),
                                // Share Icon
                                GestureDetector(
                                  onTap: () {
                                    // Add your share functionality here
                                  },
                                  child: Icon(
                                    Icons.share,
                                    color: Colors.black,
                                    size: 30,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),*/
                    //Category Container
                    SizedBox(height: 20,),
                    Padding(
                      padding: const EdgeInsets.symmetric(),
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1.5,
                      ),
                    ),
                    Container(
                      child: Text(_products['category'] ?? '',style:  TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
                    ),

                    //Title Container
                    Padding(
                      padding: const EdgeInsets.symmetric(),
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1.5,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Title: ',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                _products['title'] ?? '',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    //Description Container
                    SizedBox(height: 10,),
                    Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              'Description: ',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                _products['description'] ?? '',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 10,),
                    Padding(
                      padding: const EdgeInsets.symmetric(),
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1.5,
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [
                          Text('Qty: ',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                          Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.remove),
                                onPressed: () {
                                  setState(() {
                                    if (_cartCount > 1) {
                                      _cartCount--;
                                    }
                                  });
                                  },
                              ),
                              Text('${_cartCount}',style:  TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
                              IconButton(
                                icon: Icon(Icons.add),
                                onPressed: () {
                                  setState(() {
                                    _cartCount++;
                                  });
                                  },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                    //Price Container

                    Container(
                      child: Row(
                        children: [
                          Text('Price:  ',style: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold),),
                          Expanded(child: Text('\$${_products['price'] ?? ''}',style:  TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),)),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(),
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
          ),

          //Buy and Add Cart Buttons widget
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _showPayDialog,
                      child: Text('Buy Now', style: TextStyle(fontSize: 18)),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Added to cart. Total items: ${_cartCount}'),
                          ),// Show cart count in snack bar
                        );
                      },
                      child: Text('Add to Cart', style: TextStyle(fontSize: 18)),
                    ),
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
