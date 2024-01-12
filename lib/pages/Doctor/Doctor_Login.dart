import 'package:flutter/material.dart';
import 'package:hospital/pages/Doctor/Doctor_Main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/Utils.dart';
class DoctorLogin extends StatefulWidget {
  const DoctorLogin({super.key});

  @override
  State<DoctorLogin> createState() => _DoctorLoginState();
}
var formkey=GlobalKey<FormState>();
var username=TextEditingController();
var email=TextEditingController();
var password=TextEditingController();
var hospitalname=TextEditingController();
class _DoctorLoginState extends State<DoctorLogin> {
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
                  prefixIcon: Icon(Icons.password),
                  hintText: 'Password',
                  border: OutlineInputBorder(),

                ),
              ),
              ElevatedButton(onPressed: ()async{
                final response = await http.post(Uri.parse('http://10.0.2.2:3000/doctorlogin'),

                    body: {
                      'username':username.text.toString(),
                      'password': password.text.toString(),
                    });
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                if(response.body=="success")
                {
                  utils().toastmessage('Account created');
                  await prefs.setString('doctorname', username.text.toString());
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorMainPage()));

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
