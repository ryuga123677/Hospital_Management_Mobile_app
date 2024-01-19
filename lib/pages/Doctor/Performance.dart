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
              return Text(data.toString());
            }
          },
        ),

      ),

    );
  }
}
