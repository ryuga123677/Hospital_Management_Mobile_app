import 'package:flutter/material.dart';
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
          TextButton(onPressed: ()=>{}, child: Text("Appointments")),
          TextButton(onPressed: ()=>{}, child: Text("Patient Treated")),
          TextButton(onPressed: ()=>{}, child: Text("Currently Treating")),
          TextButton(onPressed: ()=>{}, child: Text("Patient Died")),

          TextButton(onPressed: ()=>{}, child: Text("Performance")),
        ],
      ),
    );
  }
}
