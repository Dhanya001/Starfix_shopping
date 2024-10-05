import 'package:flutter/material.dart';

class UserDetailsPage extends StatelessWidget {
  final Map<String, dynamic> user;

  UserDetailsPage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[400],
        title: Text('${user['name']['firstname']} ${user['name']['lastname']}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(text: TextSpan(
              children: [
                TextSpan(
                  text: 'Name :  ',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
                ),
                TextSpan(
                  text: '${user['name']['firstname']} ${user['name']['lastname']}',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),),
            /*Text(
              'Name: ${user['name']['firstname']} ${user['name']['lastname']}',
              style: TextStyle(fontSize: 18),
            ),*/
            SizedBox(height: 10),
            RichText(text: TextSpan(
              children: [
                TextSpan(
                  text: 'Email :  ',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
                ),
                TextSpan(
                  text: '${user['email']}',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),),
            /*Text(
              'Email: ${user['email']}',
              style: TextStyle(fontSize: 16),
            ),*/
            SizedBox(height: 10),
            RichText(text: TextSpan(
              children: [
                TextSpan(
                  text: 'Username :  ',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
                ),
                TextSpan(
                  text: '${user['username']}',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),),
            /*Text(
              'Username: ${user['username']}',
              style: TextStyle(fontSize: 16),
            ),*/
            SizedBox(height: 10),
            RichText(text: TextSpan(
              children: [
                TextSpan(
                  text: 'Phone :  ',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
                ),
                TextSpan(
                  text: '${user['phone']}',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),),
            /*Text(
              'Phone: ${user['phone']}',
              style: TextStyle(fontSize: 16),
            ),*/
            SizedBox(height: 10),
            RichText(text: TextSpan(
              children: [
                TextSpan(
                  text: 'Address :  ',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
                ),
                TextSpan(
                  text: '${user['address']['number']} ${user['address']['street']}',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),),
            /*Text(
              'Address: ${user['address']['number']} ${user['address']['street']},',
              style: TextStyle(fontSize: 16),
            ),*/
            SizedBox(height: 10),
            RichText(text: TextSpan(
              children: [
                TextSpan(
                  text: 'City :  ',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
                ),
                TextSpan(
                  text: '${user['address']['city']}, ${user['address']['zipcode']}',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),),
            /*Text(
              'City: ${user['address']['city']}, ${user['address']['zipcode']},',
              style: TextStyle(fontSize: 16),
            ),*/

            SizedBox(height: 10),
            RichText(text: TextSpan(
              children: [
                TextSpan(
                  text: 'Geo Location : ',style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
                ),
                TextSpan(
                  text: 'Lat(${user['address']['geolocation']['lat']}), Long(${user['address']['geolocation']['long']})',
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ],
            ),),
            /*Text(
              'Long(${user['address']['geolocation']['long']})',
              style: TextStyle(fontSize: 16),
            ),*/
          ],
        ),
      ),
    );
  }
}
