import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Watchlist extends StatelessWidget {
  Watchlist();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Cineflex"),),
        body: Column(
          children: [
            Text("No data"),
          ],
        ),
      ),
    );
  }
}