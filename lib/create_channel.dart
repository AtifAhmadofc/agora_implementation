import 'package:agora_implementation/call_screen.dart';
import 'package:flutter/material.dart';

class CreateChannel extends StatelessWidget {
   CreateChannel({Key? key}) : super(key: key);


  TextEditingController channelName=TextEditingController();
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: channelName,
            ),

            TextButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>CallScreen(channelName:channelName.text.trim())));
            }, child: const Text("Submit"))
          ],
        ),
      ),
    );
  }
}
