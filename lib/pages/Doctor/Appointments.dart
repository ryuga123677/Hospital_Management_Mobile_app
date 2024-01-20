import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital/pages/Utils/Utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class Appointments extends StatefulWidget {
  const Appointments({super.key});

  @override
  State<Appointments> createState() => _AppointmentsState();
}

class _AppointmentsState extends State<Appointments> {
  var data;
  var name;
  Future<void> getinformation()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final  doctorname = await prefs.getString('doctorname');
name=doctorname;
    final response=await http.get(Uri.parse('http://10.0.2.2:3000/patientappoints?param=${doctorname}'));

    data =jsonDecode(response.body.toString());

    print(data);
    return data;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent.shade100,
        title: Text('Appointments Requests'),
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
              return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context,index)
                  {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        tileColor: Color(0xfff8e896),

                        shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.black, width: 1),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        title: Row(
                          children: [
                            Text(data[index]['username'].toString()),
                            Spacer(),
                            InkWell(child: Icon(Icons.check),onTap: ()async{
                              final response=await http.post(Uri.parse('http://10.0.2.2:3000/appointmentfix'),
                                  body:{
                                    'username':name,
                                    'patientname':data[index]['username'].toString(),

                              });
                              if(response.body=="success")
                                {
                                  setState(() {
                                    data.removeWhere((obj) => obj['username'] == data[index]['username'].toString());
                                  });
                                  utils().toastmessage('Accepted');
                                }
                              else
                                {
                                  utils().toastmessage('Declined');
                                }

                            },),
                            SizedBox(width: 20,),


                            InkWell(child: Text('X'),onTap: ()async{
                              final response=await http.get(Uri.parse('http://10.0.2.2:3000/appointmentdecline?doctorname=${name}&patientname=${data[index]['username'].toString()}'
                              ));
                              if(response.body=="success")
                              {
                                setState(() {
                                  data.removeWhere((obj) => obj['username'] == data[index]['username'].toString());
                                });
                              }

                            },),
                          ],
                        ),



                      ),
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
