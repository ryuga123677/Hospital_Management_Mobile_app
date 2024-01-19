import 'package:flutter/material.dart';
import 'package:hospital/models/Doctorlistmodel.dart';
import 'package:hospital/pages/Doctor/Doctor_Login.dart';
import 'package:hospital/pages/Patient/PatientMainPage.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../Utils/Utils.dart';
class DoctorList extends StatefulWidget {

  const DoctorList({super.key});

  @override
  State<DoctorList> createState() => _DoctorListState();
}

class _DoctorListState extends State<DoctorList> {
  var message='nothing';
var data;

  Future<void> getinformation()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    print('hi');
   final  hospitalname = await prefs.getString('hospitalname');


    final response=await http.get(Uri.parse('http://10.0.2.2:3000/doctorlist?search=${hospitalname}'));

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
                return ListView.builder(
                  itemCount: data.length,
          itemBuilder: (context,index)
          {
            return ListTile(
              onTap: ()async{
                final SharedPreferences prefs = await SharedPreferences.getInstance();
                final  patientname = await prefs.getString('patientname');
                final resp = await http.get(Uri.parse('http://10.0.2.2:3000/appointment?param1=${data[index]['username']}&param2=${patientname}'));
                if(resp.body=="success")
                  {utils().toastmessage('Appointment sent');
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PatientMainPage()));

                  }
                else
                  {
                    utils().toastmessage('Something went wrong');
                  }
              },
              title: Text(data[index]['username'].toString()),
              subtitle: Row(children: [Text(data[index]['speciality'].toString()),
                Text(', click to request appointment')
              ]),

            );
          }
                );
            }
            },
          ),

      ),
    );
  }
}
