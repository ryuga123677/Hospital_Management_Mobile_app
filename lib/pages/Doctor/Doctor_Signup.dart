import 'package:flutter/material.dart';
import 'package:hospital/pages/Doctor/Doctor_Login.dart';
import 'package:http/http.dart' as http;

import '../Utils/Utils.dart';

class DoctorSignup extends StatefulWidget {
  const DoctorSignup({super.key});

  @override
  State<DoctorSignup> createState() => _DoctorSignupState();
}
var formkey=GlobalKey<FormState>();
var username=TextEditingController();
var email=TextEditingController();
var password=TextEditingController();
var hospitalname=TextEditingController();
var speciality=TextEditingController();
class _DoctorSignupState extends State<DoctorSignup> {
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
                controller: hospitalname,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.local_hospital_outlined),
                    hintText: 'Hospital Name',
                    border: OutlineInputBorder()
                ),
              ),
              TextField(
                controller: speciality,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.health_and_safety_outlined),
                    hintText: 'Speciality',
                    border: OutlineInputBorder()
                ),
              ),
              ElevatedButton(onPressed: ()async{
                final response = await http.post(Uri.parse('http://10.0.2.2:3000/doctorregister'),

                    body: {
                      'username':username.text.toString(),
                      'password': password.text.toString(),
                      'email': email.text.toString(),

                      'hospitalname':hospitalname.text.toString(),
                      'speciality':speciality.text.toString(),
                    });
                if(response.body=="success")
                {
                  utils().toastmessage('Account created');
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorLogin()));

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
