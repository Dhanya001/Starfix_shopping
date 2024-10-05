import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:starfix_shopping/Screen/UserDetailsPage.dart';

class Userpage extends StatefulWidget {

  @override
  State<Userpage> createState() => _UserpageState();
}

class _UserpageState extends State<Userpage> {
  List<dynamic> _users = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userData();
  }

  Future<void> _userData() async{
    final url='https://fakestoreapi.com/users';
    final response=await http.get(Uri.parse(url));
    if(response.statusCode==200){
      final jsondata=jsonDecode(response.body);
      setState(() {
        _users=jsondata;
      });
    } else {
      print('Failed to load users');
    }
  }

  Future<void> _getSorteduser(String sortBy) async {
    final url = 'https://fakestoreapi.com/users';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsondata = jsonDecode(response.body);
      setState(() {
        _users = jsondata;
        if (sortBy == 'asc') {
          _users.sort((a, b) => a['id'].compareTo(b['id']));
        } else if (sortBy == 'desc') {
          _users.sort((a, b) => b['id'].compareTo(a['id']));
        }
      });
    }
  }

  /*Future<void> _SearchProducts(String query) async {
    final url = 'https://fakestoreapi.com/products?limit=5&q=$query';
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsondata = jsonDecode(response.body);
      setState(() {
        _Products = jsondata;
      });
    }
  }*/

  Future<void> _addNewuser() async {
    final url = 'https://fakestoreapi.com/users';
    final response = await http.post(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'email':'John@gmail.com',
          'username':'johnd',
          //'password':'m38rmF$',//$ not accepted...
          'password':'m38rmF',
          'name': [
            {'firstname': 'John', 'lastname': 'Doe'},
          ],
          'address': [
            {'city':'kilcoole',
              'street':'7835 new road',
              'number':3,
              'zipcode':'12926-3874',
              'geolocation' :[{
                'lat':'-37.3159',
                'long':'81.1496',},
              ]
            },
          ],
          'phone':'1-570-236-7033',
        }));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      print(response.body);
    }
  }

  Future<void> _updateuserdeatails() async {
    final url = 'https://fakestoreapi.com/users/7';
    final response = await http.put(Uri.parse(url),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'email':'John@gmail.com',
          'username':'johnd',
          //'password':'m38rmF$',//$ not accepted...
          'password':'m38rmF',
          'name': [
            {'firstname': 'John', 'lastname': 'Doe'},
          ],
          'address': [
            {'city':'kilcoole',
              'street':'7835 new road',
              'number':3,
              'zipcode':'12926-3874',
              'geolocation' :[{
                'lat':'-37.3159',
                'long':'81.1496',},
              ]
            },
          ],
          'phone':'1-570-236-7033',
        }));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      print(response.body);
    }
  }

  Future<void> _deleteuser() async {
    final url = 'https://fakestoreapi.com/users/6';
    final response = await http.delete(Uri.parse(url));
    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Details",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.supervised_user_circle_rounded),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Add New Cart'),
                onTap: () {
                  _addNewuser();
                },
              ),
              PopupMenuItem(
                child: Text('Update Cart'),
                onTap: () {
                  _updateuserdeatails();
                },
              ),
              PopupMenuItem(
                child: Text('Delete Cart'),
                onTap: () {
                  _deleteuser();
                },
              ),
            ],
          ),
          PopupMenuButton(
            icon: Icon(Icons.sort),
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Sort by ID (Desc)'),
                onTap: () {
                  _getSorteduser('desc');
                },
              ),
              PopupMenuItem(
                child: Text('Sort by ID (Asc)'),
                onTap: () {
                  _getSorteduser('asc');
                },
              ),
            ],
          ),
        ],
      ),
      body: _users.isEmpty?
      Center(
          child: CircularProgressIndicator()):
      ListView.builder(
          itemCount: _users.length,
          itemBuilder: (context,index){
            final _user=_users[index];
            return ListTile(
              title: Text('${_user['name']['firstname']} ${_user['name']['lastname']}'),
              subtitle: Text(_user['email']),
              leading: CircleAvatar(
                child: Text(_user['name']['firstname'][0]),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>UserDetailsPage(user:_user)),
                  );
              },
            );
      })
    );
  }
}
