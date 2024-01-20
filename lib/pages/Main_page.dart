import 'package:flutter/material.dart';
import 'package:hospital/pages/Owner/Owner_Login.dart';

import 'Doctor/Doctor_Login.dart';
import 'Doctor/Doctor_Signup.dart';
import 'Owner/Owner_Signup.dart';
import 'Patient/Patient_Login.dart';
import 'package:get/get.dart';
import 'Patient/Patient_Signup.dart';
class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome to Our Hospital Management System',style: TextStyle(color: Colors.green.shade900,fontSize: 18),),
              Padding(
                padding:EdgeInsets.all(16.0),
                child: Container(

                    height: MediaQuery.of(context).size.height*.05,
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

                    child: TextButton(onPressed: ()=>{  Navigator.push(context, MaterialPageRoute(builder: (context)=>OwnerSignup()))}, child: Text("Register Your Hospital here",style: TextStyle(color: Colors.black),))),
              ),
              Container(

                  height: MediaQuery.of(context).size.height*.05,
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

                  child: TextButton(onPressed: ()=>{  Navigator.push(context, MaterialPageRoute(builder: (context)=>OwnerLogin()))}, child: Text("Owner Login",style: TextStyle(color: Colors.black),))),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(

                    height: MediaQuery.of(context).size.height*.05,
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
                    child: TextButton(onPressed: ()=>{  Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorSignup()))}, child: Text("Doctor Signup",style: TextStyle(color: Colors.black),))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(

                    height: MediaQuery.of(context).size.height*.05,
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
                    child: TextButton(onPressed: ()=>{  Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorLogin()))}, child: Text("Doctor Login",style: TextStyle(color: Colors.black),))),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(

                    height: MediaQuery.of(context).size.height*.05,
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
                    child: TextButton(onPressed: ()=>{  Navigator.push(context, MaterialPageRoute(builder: (context)=>PatientSignup()))}, child: Text("Patient Signup",style: TextStyle(color: Colors.black),))),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(

                    height: MediaQuery.of(context).size.height*.05,
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
                    child: TextButton(onPressed: ()=>{  Navigator.push(context, MaterialPageRoute(builder: (context)=>PatientLogin()))}, child: Text("Patient Login",style: TextStyle(color: Colors.black),))),
              ),
            ],
          ),
        ),]
      ),
    );
  }
}
