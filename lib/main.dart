import 'package:flutter/material.dart';
import 'fragments/frag_1.dart';
import 'fragments/frag_use_effect_file.dart';

void main() {
  runApp(const Screen());
}

class Screen extends StatelessWidget{

  const Screen({ Key ? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: _Screen(),
    );
  }
}

class _Screen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => fragment();
}

class fragment extends State<_Screen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Application title",
          style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.purple
        ),
        leading: IconButton(
          icon: Icon(Icons.ac_unit),
          onPressed: ()=>{
            Navigator.push(context, 
            MaterialPageRoute(builder: (context)=>AppSecond())
            )
          },
        ),
      ),
    );
  }

}