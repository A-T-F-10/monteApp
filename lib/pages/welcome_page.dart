import 'package:flutter/material.dart';
import 'package:flutter_cluit_app/pages/nav_page/my_main_page.dart';
import 'package:flutter_cluit_app/widgets/colors.dart';
import 'package:flutter_cluit_app/widgets/custom_button.dart';
import 'package:flutter_cluit_app/widgets/large_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List img =[
    "welcome-one.png",
    "welcome-two.png",
    "welcome-three.png"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        itemCount: img.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (_,index){
        return Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                "img/"+img[index],
              )
            )
          ),
          child: Container(
            margin:  EdgeInsets.only(top: MediaQuery.of(context).size.height/10,
                left: MediaQuery.of(context).size.width/15,
            right: MediaQuery.of(context).size.width/15
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                   Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      LargeTextWidget(
                        text: 'Trips',
                        size: MediaQuery.of(context).size.height/17,
                      ), LargeTextWidget(
                        text: 'Mountain',
                        size: MediaQuery.of(context).size.height/19,
                        color: AppColors.mainTextColor,
                        fontWeight: FontWeight.normal,
                      ),Container(
                        padding:const EdgeInsets.only(top: 10),
                        width: MediaQuery.of(context).size.width/1.5,
                        child: LargeTextWidget(
                          text: 'Mountain hikes give you an incredible sense of freedom along with endurance test',
                          size: MediaQuery.of(context).size.height/50,
                          color: AppColors.textColor2,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                   const   SizedBox(
                        height: 20,
                      ),
                      CustomButton(
                          isCustomButtonFlexed:false, widthButton: 120, onTap: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MainPage()));
                          }),
                    ],
                  ),


                Column(
                  children: List.generate(img.length, (ind) {
                    return Container(
                    margin: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/150 ,horizontal: MediaQuery.of(context).size.width/100),
                    decoration: BoxDecoration(
                       color: ind==index? AppColors.mainColor :AppColors.mainTextColor,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    height: ind==index? 20:6,
                    width: 5,
                  );

                  }))

              ],
            ),
          ),
        ) ;
      }),
    );
  }
}
