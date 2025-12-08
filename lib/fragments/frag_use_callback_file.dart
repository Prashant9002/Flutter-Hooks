import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(AppFourth());
}

class AppFourth extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return screen();
  }
}

class screen extends HookWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "use callback file",
          style: TextStyle(
            color: Colors.purple,
            fontWeight: FontWeight.bold
          ),
        ),
      ),
      body: body(),
    );
  }
}

class body extends HookWidget{
  @override
  Widget build(BuildContext context) {

    var counter = useState(0);
    final incrementedValue = useCallback(
        (){
          counter.value++;
        },[counter.value]
    );
    return Container(
      child: Padding(padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "value ${counter.value}",
                style: TextStyle(
                  fontSize: 20,
                    color: Colors.purple,
                    fontWeight: FontWeight.bold
                ),
              ),
            ],
          ),

          TextButton(
              onPressed:incrementedValue
              ,
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