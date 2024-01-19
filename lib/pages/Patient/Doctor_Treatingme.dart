import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../Utils/Utils.dart';
import '../chat.dart';

class DoctorTreating extends StatefulWidget {
  const DoctorTreating({super.key});

  @override
  State<DoctorTreating> createState() => _DoctorTreatingState();
}




class _DoctorTreatingState extends State<DoctorTreating> {
  var data;
  var patient;

  Future<void> getinformation()async{


    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final  patientname = await prefs.getString('patientname');
    patient=patientname;
    final response=await http.get(Uri.parse('http://10.0.2.2:3000/doctortreating?search=${patientname}'));

    data =jsonDecode(response.body.toString());

    return data;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold( body: Center(
      child: FutureBuilder(

        future: getinformation(),
        builder: (context,snapshot){
          if(snapshot.connectionState==ConnectionState.waiting)
          {
            return CircularProgressIndicator();
          }
          else
          {
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context,index)
                {
                  return ListTile(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Chat(sendername: patient,receivername: data[index]['username'],)));
                  },

                    title: Text(data[index]['username'].toString()),
                    subtitle: Row(children: [Text(data[index]['speciality'].toString()),
                      Text(', click to Chat ')
                    ]),

                  );
                }
            );
          }
        },
      ),

    ),);
  }
}
