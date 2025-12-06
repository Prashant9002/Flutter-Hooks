import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main(){
  return runApp(App());
}

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return _App();
  }
}

class _App extends HookWidget{
  @override
  Widget build(BuildContext context) {
    var count = useState(0);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "App for useState()",
          style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold
          ),
        )
      ),

      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(bottom: 10),child:
              Text(
                count.value.toString(),
                style: TextStyle(
                    color: Colors.purple,
                    fontSize: 40
                ),
              ),),
              TextButton(
                  onPressed: ()=>{
                    count.value++
                  },
                  style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all(Colors.blue),
                    backgroundColor: MaterialStateProperty.all(Colors.black),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)
                      )
                    )
                  ),
                  child: Padding(padding: EdgeInsets.all(10),
                  child: Text(
                    "Click me",
                    style: TextStyle(
                        color: Colors.white,
                    ),
                  ),
                  )
              )
            ],
          ),
        ),
      ),
    );
  }

}