import 'package:flutter/material.dart';
import 'package:flutter_cluit_app/widgets/large_text.dart';
class CustomButtonPeopleNumbers extends StatelessWidget {

  Color buttonColors;
  Widget widget;
    CustomButtonPeopleNumbers({required this.widget,required this.buttonColors
   ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin:const EdgeInsets.all(3),
      decoration: BoxDecoration(
        color: buttonColors,
          border: Border.all(
              color: Colors.black
          ),
          boxShadow:const [BoxShadow(color: Colors.black12,spreadRadius: 0,blurRadius: 5,),],
          borderRadius: BorderRadius.circular(10)
      ),
      width: MediaQuery.of(context).size.width/7,
      child: Center(child:widget),
    );
  }
}
