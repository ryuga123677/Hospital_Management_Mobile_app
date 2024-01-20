import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../Utils/Utils.dart';
import 'Owner_Login.dart';
class OwnerSignup extends StatefulWidget {
  const OwnerSignup({super.key});

  @override
  State<OwnerSignup> createState() => _OwnerSignupState();
}
var formkey=GlobalKey<FormState>();
var username=TextEditingController();
var email=TextEditingController();
var password=TextEditingController();
var hospitalname=TextEditingController();
class _OwnerSignupState extends State<OwnerSignup> {
  final Map<String, dynamic> postData = {
    'username':username.text,
    'password': password.text,
    'email': email.text,

    'hospitalname':hospitalname.text,
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            // child: Image.asset('images/bg.jpg', // Replace with your image path
            // fit: BoxFit.fill,),
            decoration: BoxDecoration(
              color: Colors.white, // Specify a background color if needed
              image: DecorationImage(
                image: AssetImage('images/bg.jpg'), // Replace with your image path
                repeat: ImageRepeat.repeat, // Set the repeat property
              ),),

          ),
          Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Register your hospital here',style: TextStyle(color: Colors.green.shade900,fontSize: 18),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form( key: formkey,
                  child: TextFormField(

                    controller: username,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(

                      prefixIcon: Icon(Icons.person),
                      hintText: 'Username',

                      border: OutlineInputBorder(

                        borderRadius: BorderRadius.circular(20)
                      )
                    ),

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  child: TextFormField(
                    controller: email,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: 'Email',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        )
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  child: TextFormField(
                    controller: password,
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        hintText: 'Password',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)
                        ),

                    ),
                  ),
                ),
              ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: TextFormField(
                controller: hospitalname,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Hospital Name',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20)
                    )
                ),
              ),
            ),
          ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(

                    onTap: ()async{

                final response = await http.post(Uri.parse('http://10.0.2.2:3000/ownerregister'),

                body: {
                  'username':username.text.toString(),
                  'password': password.text.toString(),
                  'email': email.text.toString(),

                  'hospitalname':hospitalname.text.toString(),
                });
                if(response.body=="success")
                  {
                    utils().toastmessage('Account created');
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>OwnerLogin()));

                  }
                else
                  {
                    utils().toastmessage('Something went wrong');
                  }
                },


                  // Set the background color here
                       child: Container(
                         height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Color(0xfff8e896),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow:  [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(2, 2), // Set the offset to create the shadow on the bottom and right
                          // Adjust the blur radius as needed
                        ),
                      ],
                    ),

                    child: Align(
                        alignment: Alignment.center,
                        child: Text('Signup',style: TextStyle(color: Colors.black),)))),
              )

            ],
          ),
        ),]
      ),
    );
  }
}
