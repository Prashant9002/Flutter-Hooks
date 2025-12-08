import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main(){
   runApp(AppSecond());
}

class AppSecond extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return screen();
  }

}

class screen extends HookWidget{
  @override
  Widget build(BuildContext context) {
    var show = useState(false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "use effect file"
        ),
      ),

      body: Padding(padding: EdgeInsets.all(10),
      child: Column(
        children: [
          ElevatedButton(
              onPressed: ()=>{
                print("Thread 007 ${show.value}"),
                show.value = !show.value
              },
              style: ButtonStyle(
                  shape:MaterialStateProperty.all(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)
                      )
                  )
              ),
              child: Text(
                "Click",
                style: TextStyle(
                  color: Colors.black,
                ),
              )
          ),
          SizedBox(height: 20,),

          if(show.value)  DialogBox()
        ],
      ),
      )
    );
  }
}

class DialogBox extends HookWidget{
  @override
  Widget build(BuildContext context) {

    useEffect(
        (){
          print("Thread 007 Widget Created");
          return (){
            print("Thread 007 Widget life Cycle ended");
          };
        }
    );
    return Container(
      height: 200,
      width: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.purple,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Hello there i'm showing !!",
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),
          )
        ],
      ),
    );
  }

}
