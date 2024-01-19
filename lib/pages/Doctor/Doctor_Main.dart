

import 'package:flutter/material.dart';
import 'package:hospital/pages/Doctor/Appointments.dart';
import 'package:hospital/pages/Doctor/Currently_treating.dart';
import 'package:hospital/pages/Doctor/Died.dart';
import 'package:hospital/pages/Doctor/Patient_Treated.dart';
import 'package:hospital/pages/Doctor/Performance.dart';
class DoctorMainPage extends StatefulWidget {
  const DoctorMainPage({super.key});

  @override
  State<DoctorMainPage> createState() => _DoctorMainPageState();
}

class _DoctorMainPageState extends State<DoctorMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextButton(onPressed: ()=>{Navigator.push(context, MaterialPageRoute(builder: (context)=>Appointments()))}, child: Text("Appointments")),
          TextButton(onPressed: ()=>{Navigator.push(context, MaterialPageRoute(builder: (context)=>PatientTreated()))}, child: Text("Patient Treated")),
          TextButton(onPressed: ()=>{Navigator.push(context, MaterialPageRoute(builder: (context)=>CurrentlyTreating()))}, child: Text("Currently Treating")),
          TextButton(onPressed: ()=>{Navigator.push(context, MaterialPageRoute(builder: (context)=>Died()))}, child: Text("Patient Died")),

          TextButton(onPressed: ()=>{Navigator.push(context, MaterialPageRoute(builder: (context)=>Performance()))}, child: Text("Performance")),
        ],
      ),
    );
  }
}
