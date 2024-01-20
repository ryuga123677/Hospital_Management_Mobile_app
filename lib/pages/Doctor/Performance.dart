import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class Performance extends StatefulWidget {
  const Performance({super.key});

  @override
  State<Performance> createState() => _PerformanceState();
}

class _PerformanceState extends State<Performance> {
  var data;
  var name;
  Future<void> getinformation()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final  doctorname = await prefs.getString('doctorname');
    name=doctorname;
    final response=await http.get(Uri.parse('http://10.0.2.2:3000/performance?search=${doctorname}'));

    data =jsonDecode(response.body.toString());

    print(data);
    return data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.tealAccent.shade100,
        title: Text('My Performance'),
      ),
      backgroundColor: Colors.tealAccent.shade100,
      body: Center(
        child: FutureBuilder(

          future: getinformation(),
          builder: (context,snapshot){
            if(snapshot.connectionState==ConnectionState.waiting)
            {
              return CircularProgressIndicator();
            }
            else
            {
              return Container(
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
                      child: Text(data.toString())));
            }
          },
        ),

      ),

    );
  }
}
