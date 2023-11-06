import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Search extends StatelessWidget {
  Search();

  TextEditingController _tc = TextEditingController();

  void makeresult(String str){
    //make a search using str
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
            title:
            TextField(
              controller: _tc,
            ),
            actions: [
              IconButton(onPressed: (){
                makeresult(_tc.text.toString());
              }, icon: Icon(Icons.search)),
            ],
          ),
        body: Container(
          child: Column(
            children: [
              Text("Found result : "),
              SizedBox(
                height: 500,
                width: 40,
              ),
              ElevatedButton(onPressed: (){
                Navigator.of(context).pop();
              }, child: Text("Back to previous page")),
            ],
          ),
        ),
      )
    );
  }
}