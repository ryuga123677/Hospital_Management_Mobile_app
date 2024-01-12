import 'package:flutter/material.dart';
import 'package:hospital/models/Doctorlistmodel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
class DoctorList extends StatefulWidget {

  const DoctorList({super.key});

  @override
  State<DoctorList> createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  var message='nothing';


  Stream<Doctorlistmodel> getinformation()async*{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final  hospitalname = prefs.getInt('hospitalname');
    final response=await http.get(Uri.parse('http://10.0.2.2:3000/doctorlist?search=${hospitalname}'));

    var data =await jsonDecode(response.body.toString());
     yield Doctorlistmodel.fromJson(data);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Center(
    child: StreamBuilder<Doctorlistmodel>(
      stream: getinformation(),
      builder: (BuildContext context,AsyncSnapshot<Doctorlistmodel> snapshot){
    if(!snapshot.hasData)
      {
        return CircularProgressIndicator();
      }
    else
      {
        return ListView.builder(

            itemBuilder: (context,index)
            {
              return ListTile(
                title: Text('hi'),
              );
            }
        );
      }
      },
    ),

        ),
      ),
    );
  }
}
