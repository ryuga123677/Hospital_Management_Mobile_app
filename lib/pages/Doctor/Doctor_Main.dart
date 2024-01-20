

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
                      child: TextButton(onPressed: ()=>{Navigator.push(context, MaterialPageRoute(builder: (context)=>Appointments()))}, child: Text("Appointments",style: TextStyle(color: Colors.black),))),
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
                      child: TextButton(onPressed: ()=>{Navigator.push(context, MaterialPageRoute(builder: (context)=>PatientTreated()))}, child: Text("Patient Treated",style: TextStyle(color: Colors.black),))),
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
                      child: TextButton(onPressed: ()=>{Navigator.push(context, MaterialPageRoute(builder: (context)=>CurrentlyTreating()))}, child: Text("Currently Treating",style: TextStyle(color: Colors.black),))),
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
                      child: TextButton(onPressed: ()=>{Navigator.push(context, MaterialPageRoute(builder: (context)=>Died()))}, child: Text("Patient Died",style: TextStyle(color: Colors.black),))),
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
                      child: TextButton(onPressed: ()=>{Navigator.push(context, MaterialPageRoute(builder: (context)=>Performance()))}, child: Text("Performance",style: TextStyle(color: Colors.black),))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
