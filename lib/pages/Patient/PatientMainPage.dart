import 'package:flutter/material.dart';
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
          TextButton(onPressed: ()=>{}, child: Text("Doctors Avaliable")),
          TextButton(onPressed: ()=>{}, child: Text("Doctor Treating me")),
          TextButton(onPressed: ()=>{}, child: Text("Present Reports")),
        ],
      ),
    );
  }
}
