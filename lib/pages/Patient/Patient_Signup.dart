import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Owner/Owner_Login.dart';
import '../Utils/Utils.dart';
import 'Patient_Login.dart';
class PatientSignup extends StatefulWidget {
  const PatientSignup({super.key});

  @override
  State<PatientSignup> createState() => _PatientSignupState();
}
var formkey=GlobalKey<FormState>();
var username=TextEditingController();
var email=TextEditingController();
var password=TextEditingController();
var hospitalname=TextEditingController();
var age=TextEditingController();
class _PatientSignupState extends State<PatientSignup> {
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
                controller: email,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    hintText: 'Email',
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
                controller: age,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.health_and_safety_outlined),
                    hintText: 'Age',
                    border: OutlineInputBorder()
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
                final response = await http.post(Uri.parse('http://10.0.2.2:3000/patientregister'),

                    body: {
                      'username':username.text.toString(),
                      'password': password.text.toString(),
                      'email': email.text.toString(),
                      'age': age.text.toString(),
                      'hospitalname':hospitalname.text.toString(),
                    });
                if(response.body=="success")
                {
                  utils().toastmessage('Account created');
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>PatientLogin()));

                }
                else
                {
                  utils().toastmessage('Something went wrong');
                }
              }, child: Text('Signup'))

            ],
          ),
        ),
      ),
    );
  }
}
