import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class Menu extends StatelessWidget {
  Menu();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text("Cineflex")),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(onPressed: (){
            
          }, child: Text("Recent movies "))
        ],
      ),
    );
  }
}