import 'package:flutter/material.dart';
import 'package:hospital/pages/Owner/Owner_Login.dart';

import 'Doctor/Doctor_Login.dart';
import 'Doctor/Doctor_Signup.dart';
import 'Owner/Owner_Signup.dart';
import 'Patient/Patient_Login.dart';
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
      body: Column(
        children: [
          TextButton(onPressed: ()=>{  Navigator.push(context, MaterialPageRoute(builder: (context)=>OwnerSignup()))}, child: Text("Register Your Hospital here")),
    TextButton(onPressed: ()=>{  Navigator.push(context, MaterialPageRoute(builder: (context)=>OwnerLogin()))}, child: Text("Owner Login")),
    TextButton(onPressed: ()=>{  Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorSignup()))}, child: Text("Doctor Signup")),
    TextButton(onPressed: ()=>{  Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorLogin()))}, child: Text("Doctor Login")),

    TextButton(onPressed: ()=>{  Navigator.push(context, MaterialPageRoute(builder: (context)=>PatientSignup()))}, child: Text("Patient Signup")),
    TextButton(onPressed: ()=>{  Navigator.push(context, MaterialPageRoute(builder: (context)=>PatientLogin()))}, child: Text("Patient Login")),
        ],
      ),
    );
  }
}
