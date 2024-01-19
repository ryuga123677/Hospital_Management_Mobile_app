import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
class Died extends StatefulWidget {
  const Died({super.key});

  @override
  State<Died> createState() => _DiedState();
}

class _DiedState extends State<Died> {
  var data;
  var name;
  Future<void> getinformation()async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    final  doctorname = await prefs.getString('doctorname');
    name=doctorname;
    final response=await http.get(Uri.parse('http://10.0.2.2:3000/died?search=${doctorname}'));

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
