import 'package:flutter/material.dart';

class LargeTextWidget extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  FontWeight fontWeight;

   LargeTextWidget({Key? key, required this.text,
     this.color= Colors.black,
     this.size=16,this.fontWeight= FontWeight.bold}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
    overflow: TextOverflow.visible,
    style: TextStyle(
       color: color,
      fontSize: size,
      fontWeight: fontWeight
    ),
    );
  }
}
