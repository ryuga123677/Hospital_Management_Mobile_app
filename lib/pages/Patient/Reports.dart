import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  var data;
  var name;
  void initState() {
getinformation();
  }
  Future<void> getinformation()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final  patientname = await prefs.getString('patientname');
  name=patientname;

    final response=await http.get(Uri.parse('http://10.0.2.2:3000/seereports?name=${patientname}'));

    data =jsonDecode(response.body.toString());
    print(data);
    return data;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Text('Name-'),
              Text(name),
            ],
          ),
          Row(
            children: [
              Text('Disease-'),
              Text(data['disease']),
            ],
          ),
          Row(
            children: [
              Text('Symptoms-'),
              Text(data['symptoms']),
            ],
          ),
          Row(
            children: [
              Text('Medicines-'),
              Text(data['medicines']),
            ],
          ),
          Row(
            children: [
              Text('Diet-'),
              Text(data['diet']),
            ],
          ),

        ],
      ),
    );
  }
}
