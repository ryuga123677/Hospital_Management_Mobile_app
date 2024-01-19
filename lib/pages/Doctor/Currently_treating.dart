import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class CurrentlyTreating extends StatefulWidget {
  const CurrentlyTreating({super.key});

  @override
  State<CurrentlyTreating> createState() => _CurrentlyTreatingState();
}

class _CurrentlyTreatingState extends State<CurrentlyTreating> {
  var data;
  var name;
  Future<void> getinformation()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final  doctorname = await prefs.getString('doctorname');
    name=doctorname;
    final response=await http.get(Uri.parse('http://10.0.2.2:3000/doctorspatient?search=${doctorname}'));

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

                        title:
                        Row(children: [
                          Text((index+1).toString()),
                          SizedBox(width: 10,),
                          Text(data[index]['username'].toString())
                          ,
                          Spacer(),
                          InkWell(child: Text('Treated'),onTap: ()async{
                            final response = await http.post(Uri.parse('http://10.0.2.2:3000/treated'),body:{
                              'doctorname':name,
                              'patientname':data[index]['username'].toString(),
                            });
                            if(response.body=="success")
                              {
                                setState(() {
                                  data.removeWhere((obj) => obj['username'] == data[index]['username'].toString());
                                });
                              }
                          },),
                          SizedBox(width: 20,),
                          InkWell(child: Text('Not Treated'),onTap: ()async{
                  final response = await http.post(Uri.parse('http://10.0.2.2:3000/nottreated'),body:{
                  'doctorname':name,
                  'patientname':data[index]['username'].toString(),
                  });
                  if(response.body=="success")
                  {
                  setState(() {
                  data.removeWhere((obj) => obj['username'] == data[index]['username'].toString());
                  });
                  }
                  }

                          )
                        ])
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
