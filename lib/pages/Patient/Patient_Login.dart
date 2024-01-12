import 'package:flutter/material.dart';
import 'package:hospital/pages/Patient/PatientMainPage.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/Utils.dart';
class PatientLogin extends StatefulWidget {
  const PatientLogin({super.key});

  @override
  State<PatientLogin> createState() => _PatientLoginState();
}
var formkey=GlobalKey<FormState>();
var username=TextEditingController();
var password=TextEditingController();
var hospitalname=TextEditingController();
class _PatientLoginState extends State<PatientLogin> {
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
              TextField(
                controller: hospitalname,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.local_hospital_outlined),
                    hintText: 'Hospital Name',
                    border: OutlineInputBorder()
                ),
              ),
              ElevatedButton(onPressed: ()async{
                final response = await http.post(Uri.parse('http://10.0.2.2:3000/patientlogin'),

                    body: {
                      'username':username.text.toString(),
                      'password': password.text.toString(),

                      'hospitalname': hospitalname.text.toString(),
                    });
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                if(response.body=="success")
                {
                  utils().toastmessage('Account created');
                  await prefs.setString('patientname', username.text.toString());
                  await prefs.setString('hospitalname', hospitalname.text.toString());
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PatientMainPage()));

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
