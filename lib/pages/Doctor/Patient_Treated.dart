import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class PatientTreated extends StatefulWidget {
  const PatientTreated({super.key});

  @override
  State<PatientTreated> createState() => _PatientTreatedState();
}

class _PatientTreatedState extends State<PatientTreated> {
  var data;
  var name;
  Future<void> getinformation()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final  doctorname = await prefs.getString('doctorname');
    name=doctorname;
    final response=await http.get(Uri.parse('http://10.0.2.2:3000/patienttreated?search=${doctorname}'));

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
