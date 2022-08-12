import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cluit_app/widgets/colors.dart';
import 'package:flutter_cluit_app/widgets/large_text.dart';

class CustomButton extends StatelessWidget {
   bool isCustomButtonFlexed;
  double widthButton;
  double textSize ;
  String buttonText;
  Function() onTap;
double height;
   CustomButton({this.height= 50, this.textSize=16, this.buttonText='',required this.isCustomButtonFlexed ,
     required this.widthButton,required this.onTap ,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
  onTap: onTap,
      child: Container(
        width: widthButton,
        height: height,
        decoration:BoxDecoration(
          color: AppColors.mainColor,
        borderRadius: BorderRadius.circular(10),),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            isCustomButtonFlexed? Container(
              width: widthButton/2,
              height: height,
          child: Center(child: LargeTextWidget(text: buttonText,color: Colors.white,size: textSize),),
          decoration: BoxDecoration(
              color: AppColors.mainColor,
            borderRadius: BorderRadius.circular(10),)
            ):Container(),


            Container(
              height: height,
              width:  isCustomButtonFlexed? widthButton/2.5:widthButton,
              decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage("img/button-one.png"),
                  fit: BoxFit.cover
                )
              ) ,
            ),
          ],
        ),
      ),
    );
  }
}
