import 'package:flutter/material.dart';
class Chat extends StatefulWidget {
  String sendername,receivername;
   Chat({super.key,required this.receivername,required this.sendername});

  @override
  State<Chat> createState() => _ChatState();
}

class _ChatState extends State<Chat> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(

          ),
          TextFormField(),
        ],
      ),
    );
  }
}
