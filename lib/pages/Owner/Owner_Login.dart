import 'package:flutter/material.dart';
import 'package:hospital/pages/Owner/Owner_Main.dart';

import '../Utils/Utils.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
class OwnerLogin extends StatefulWidget {
  const OwnerLogin({super.key});

  @override
  State<OwnerLogin> createState() => _OwnerLoginState();
}
var formkey=GlobalKey<FormState>();
var username=TextEditingController();
var email=TextEditingController();
var password=TextEditingController();
var hospitalname=TextEditingController();

class _OwnerLoginState extends State<OwnerLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              TextField(
                controller: username,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Username',
                    border: OutlineInputBorder()
                ),

              ),

              TextField(
                controller: password,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: 'Password',
                  border: OutlineInputBorder(),

                ),
              ),
              ElevatedButton(onPressed: ()async{
                final response = await http.post(Uri.parse('http://10.0.2.2:3000/ownerlogin'),

                    body: {
                      'username':username.text.toString(),
                      'password': password.text.toString(),
                    });
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                if(response.body=="success")
                {
                  utils().toastmessage('Account created');
                  await prefs.setString('ownername', username.text.toString());
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>OwnerMain()));

                }
                else
                {
                  utils().toastmessage('Something went wrong');
                }
              }, child: Text('Login'))


            ],
          ),
        ),
      ),
    );
  }
}
