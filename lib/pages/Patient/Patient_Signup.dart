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
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            // child: Image.asset('images/bg.jpg', // Replace with your image path
            // fit: BoxFit.fill,),
            decoration: BoxDecoration(
              color: Colors.white, // Specify a background color if needed
              image: DecorationImage(
                image: AssetImage('images/bg.jpg'), // Replace with your image path
                repeat: ImageRepeat.repeat, // Set the repeat property
              ),),

          ),
          Center(
            child: Form(
              key: formkey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: username,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.person),
                          hintText: 'Username',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                      ),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: email,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          hintText: 'Email',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: password,
                      keyboardType: TextInputType.text,
                      obscureText: true,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.password),
                        hintText: 'Password',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),

                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: age,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.health_and_safety_outlined),
                          hintText: 'Age',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: hospitalname,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                          prefixIcon: Icon(Icons.local_hospital_outlined),
                          hintText: 'Hospital Name',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20))
                      ),
                    ),
                  ),
                  InkWell(onTap: ()async{
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
                  }, child: Container(
                      height: 30,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Color(0xfff8e896),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow:  [
                          BoxShadow(
                            color: Colors.black,
                            offset: Offset(2, 2), // Set the offset to create the shadow on the bottom and right
                            // Adjust the blur radius as needed
                          ),
                        ],
                      ),

                      child: Align(
                          alignment: Alignment.center,
                          child: Text('Signup',style: TextStyle(color: Colors.black),))))

                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
