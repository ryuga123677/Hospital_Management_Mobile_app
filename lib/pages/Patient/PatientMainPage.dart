import 'package:flutter/material.dart';
import 'package:hospital/pages/Patient/DoctorList.dart';
import 'package:hospital/pages/Patient/Doctor_Treatingme.dart';
import 'package:hospital/pages/Patient/Reports.dart';
class PatientMainPage extends StatefulWidget {
  const PatientMainPage({super.key});

  @override
  State<PatientMainPage> createState() => _PatientMainPageState();
}

class _PatientMainPageState extends State<PatientMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextButton(onPressed: ()=>{Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorList()))}, child: Text("Doctors Avaliable")),
          TextButton(onPressed: ()=>{Navigator.push(context, MaterialPageRoute(builder: (context)=>DoctorTreating()))}, child: Text("Doctor Treating me")),
          TextButton(onPressed: ()=>{Navigator.push(context, MaterialPageRoute(builder: (context)=>Report()))}, child: Text("Present Reports")),
        ],
      ),
    );
  }
}
