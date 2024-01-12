import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Utils/Utils.dart';
import 'Owner_Login.dart';
class OwnerSignup extends StatefulWidget {
  const OwnerSignup({super.key});

  @override
  State<OwnerSignup> createState() => _OwnerSignupState();
}
var formkey=GlobalKey<FormState>();
var username=TextEditingController();
var email=TextEditingController();
var password=TextEditingController();
var hospitalname=TextEditingController();
class _OwnerSignupState extends State<OwnerSignup> {
  final Map<String, dynamic> postData = {
    'username':username.text,
    'password': password.text,
    'email': email.text,

    'hospitalname':hospitalname.text,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Form( key: formkey,
              child: TextFormField(
                controller: username,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: 'Username',
                  border: OutlineInputBorder()
                ),

              ),
            ),
            Form(
              child: TextFormField(
                controller: email,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Email',
                    border: OutlineInputBorder()
                ),
              ),
            ),
            Form(
              child: TextFormField(
                controller: password,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Password',
                    border: OutlineInputBorder(),

                ),
              ),
            ),
        Form(
          child: TextFormField(
            controller: hospitalname,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: 'Hospital Name',
                border: OutlineInputBorder()
            ),
          ),
        ),
            ElevatedButton(onPressed: ()async{
            final response = await http.post(Uri.parse('http://10.0.2.2:3000/ownerregister'),

            body: {
              'username':username.text.toString(),
              'password': password.text.toString(),
              'email': email.text.toString(),

              'hospitalname':hospitalname.text.toString(),
            });
            if(response.body=="success")
              {
                utils().toastmessage('Account created');
                Navigator.push(context, MaterialPageRoute(builder: (context)=>OwnerLogin()));

              }
            else
              {
                utils().toastmessage('Something went wrong');
              }
            }, child: Text('Signup'))

          ],
        ),
      ),
    );
  }
}
