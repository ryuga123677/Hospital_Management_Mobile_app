import 'package:flutter/material.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              TextField(
                controller: username,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person),
                  hintText: 'Username',
                  border: OutlineInputBorder()
                ),

              ),
              TextField(
                controller: email,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Email',
                    border: OutlineInputBorder()
                ),
              ),
              TextField(
                controller: password,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    hintText: 'Password',
                    border: OutlineInputBorder(),

                ),
              ),
          TextField(
            controller: hospitalname,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: 'Hospital Name',
                border: OutlineInputBorder()
            ),
          )

            ],
          ),
        ),
      ),
    );
  }
}
