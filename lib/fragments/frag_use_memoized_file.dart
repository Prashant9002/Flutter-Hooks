import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

//useMemoized() is used to run expensive code only once, or only when specific values change.

//why do we need it :
//Because in Flutter, the build() method runs many times.
//If you do heavy work inside build(), the app becomes slow.
void main() {
  runApp(App_Third());
}


class App_Third extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return screen();
  }
}

class screen extends HookWidget{
  @override
  Widget build(BuildContext context) {
    final value =  useState(0);
    final incremented_value = useMemoized(
        (){
          print("Heavy Calculation....");
          return value.value * 100;
        },[value.value]
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "use memorized file",
          style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold
          ),
        ),
      ),

      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "value ${value.value} ,",
                  style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),

                SizedBox(width: 20,),

                Text(
                  "Incremented value $incremented_value",
                  style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.bold,
                    fontSize: 20
                  ),
                ),
              ],
            ),

            SizedBox(height: 20,),

            TextButton(
                onPressed: ()=>{
                  value.value++
                },
                style: ButtonStyle(
                    shadowColor: MaterialStateProperty.all(Colors.purpleAccent),
                    backgroundColor: MaterialStateProperty.all(Colors.purple),
                    shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)
                        )
                    )
                ),
                child: Padding(padding: EdgeInsets.all(4),
                  child: Text(
                    "Plus++",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }

}
