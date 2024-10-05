import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:starfix_shopping/Screen/HomePage.dart';
import 'package:starfix_shopping/Screen/UserPage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _usernamecontroller=TextEditingController();
  final TextEditingController _passwordcontroller=TextEditingController();

  //http post api
  Future<void> _login() async{
    final url='https://fakestoreapi.com/auth/login';
    final response =await http.post(Uri.parse(url),
        body: {
          'username': _usernamecontroller.text,
          'password': _passwordcontroller.text,
        });
    if(response.statusCode==200){
      final jsondata=jsonDecode(response.body);
      print(jsondata);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context)=> Userpage())
      );
    }else{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Invalid username or password",
          style: TextStyle(
            fontSize: 20,
            color: Colors.red,
            fontWeight: FontWeight.bold
          ),),)
      );
    }
  }

  //we need a bool variable to hide password
  bool isVisible = false;

  //we have create global key for our form
  final formkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            //We put all our text field to form to be controlled and not allow empty
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  //Admin login image
                  Image.asset(
                    "assets/user_login.jpg",
                    width: 210,
                  ),

                  //Username Container
                  const SizedBox(height: 15,),
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.deepPurpleAccent.withOpacity(.3)
                    ),
                    child: TextFormField(
                      controller: _usernamecontroller,
                      validator: (value){
                        if(value!.isEmpty){
                          return "User name is required.";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        border: InputBorder.none,
                        hintText: "Username",
                      ),
                    ),
                  ),

                  //Password Container
                  const SizedBox(height: 10,),
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.deepPurpleAccent.withOpacity(.3)
                    ),
                    child: TextFormField(
                      controller: _passwordcontroller,
                      validator: (value){
                        if(value!.isEmpty){
                          return "Password is required.";
                        }
                        return null;
                      },
                      obscureText: !isVisible,
                      decoration: InputDecoration(
                        icon: const Icon(Icons.lock),
                        border: InputBorder.none,
                        hintText: "Password",
                        suffixIcon: IconButton(onPressed: () {
                          //In here password show and hide a toggle button
                          setState(() {
                            //toggle button
                            isVisible=!isVisible;
                          });
                        }, icon: Icon(isVisible? Icons.visibility : Icons.visibility_off)),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10,),

                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.deepPurple
                    ),
                    child: TextButton(onPressed:_login
                        , child: const Text("LOGIN",style: TextStyle(color: Colors.white),)),
                  ),

                  //sign up button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an extisting account?"),
                      TextButton(onPressed: () {
                        //Navigator to New Sing up page
                        //Navigator.push(context, MaterialPageRoute(builder: (context)=>const SignupPage()));
                      }, child: const Text("SIGN UP"))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}