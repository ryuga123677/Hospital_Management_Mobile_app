import 'package:flutter/material.dart';
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
          TextButton(onPressed: ()=>{}, child: Text("Register Your Hospital here")),
    TextButton(onPressed: ()=>{}, child: Text("Owner Login")),
    TextButton(onPressed: ()=>{}, child: Text("Doctor Signup")),
    TextButton(onPressed: ()=>{}, child: Text("Doctor Login")),

    TextButton(onPressed: ()=>{}, child: Text("Patient Signup")),
    TextButton(onPressed: ()=>{}, child: Text("Patient Login")),
        ],
      ),
    );
  }
}
