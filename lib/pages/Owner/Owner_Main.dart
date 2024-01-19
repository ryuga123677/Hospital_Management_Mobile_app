import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hospital/pages/Utils/Utils.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class OwnerMain extends StatefulWidget {
  const OwnerMain({super.key});

  @override
  State<OwnerMain> createState() => _OwnerMainState();
}

class _OwnerMainState extends State<OwnerMain> {
  var data;

  Future<void> getinformation()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final  ownername = await prefs.getString('ownername');


    final response=await http.get(Uri.parse('http://10.0.2.2:3000/doctorlistowner?search=${ownername}'));

    data =jsonDecode(response.body.toString());
    print(data);
    return data;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body:Center(
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

                    title: Text(data[index]['username'].toString()),
                    subtitle: Row(children: [Text(data[index]['speciality'].toString()),
                      Text(data[index]['performance'].toString()),
                      InkWell(child: Icon(Icons.delete),onTap: ()async{
                        final SharedPreferences prefs = await SharedPreferences.getInstance();
                        final  ownername = await prefs.getString('ownername');

                        final response = await http.delete(Uri.parse('http://10.0.2.2:3000/removedoctor?doctor=${data[index]['username'].toString()}&owner=${ownername}'));
                        if(response.body=="success")
                          {
                            utils().toastmessage('Doctor removed');
                          }
                        else
                          {
                            utils().toastmessage('something went wrong');
                          }
                      },

                      )
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
