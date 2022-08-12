import 'package:flutter/material.dart';
import 'package:flutter_cluit_app/widgets/colors.dart';
import 'package:flutter_cluit_app/widgets/custom_buttom_people_numbers.dart';
import 'package:flutter_cluit_app/widgets/custom_button.dart';
import 'package:flutter_cluit_app/widgets/large_text.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var info = Get.arguments;
  int isButtonClick = 0;
  String dco ='''Narodnaya Volya, English People’s Will, or People’s Freedom,19th-century Russian revolutionary organization that regarded terrorist activities as the best means of forcing political reform and overthrowing the tsarist ''';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: double.maxFinite,
        width: double.maxFinite,
        child: Stack(
          children: [
            ////////////////////////////////// Image and App Bar
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.2,
                decoration:  BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage('img/mountain/${info['imageList']}'),
                        fit: BoxFit.cover)),
                child: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 12,
                      right: MediaQuery.of(context).size.width / 15,
                      left: MediaQuery.of(context).size.width / 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.account_circle_sharp,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            ////////////////////////////////Custom Container to create Info
            Positioned(
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width / 15,
                    top: MediaQuery.of(context).size.height / 40,
                    right: MediaQuery.of(context).size.width / 15,
                  ),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50))),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height / 1.6,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///////////////////////////////////////////////// Name of mountains and Money
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LargeTextWidget(
                              text: info['mapValue'],
                              size: 30,
                              color: Colors.black.withOpacity(0.8)),
                          LargeTextWidget(
                            text: '250\$',
                            size: 20,
                            color: AppColors.mainColor,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      ///////////////////////////////////////////////////Locations of mountains
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 18,
                            color: AppColors.mainColor,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          LargeTextWidget(
                            text: info['mapKay'],
                            size: 13,
                            fontWeight: FontWeight.normal,
                            color: AppColors.mainColor,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      /////////////////////////////////////////////////////// Custom star widgets
                      Row(
                        children: [
                          RatingBarIndicator(
                            rating: 3.5,
                            unratedColor: Colors.black12,
                            itemBuilder: (context, index) => Icon(
                              Icons.star,
                              color: AppColors.starColor,
                            ),
                            itemCount: 5,
                            itemSize: 20,
                            direction: Axis.horizontal,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          LargeTextWidget(
                            text: '(3.5)',
                            fontWeight: FontWeight.normal,
                            color: Colors.black45,
                            size: 12,
                          )
                        ],
                      ),
                    const  SizedBox(
                        height: 30,
                      ),
                      /////////////////////////////////////////////////////  Text widgets People group
                      LargeTextWidget(
                        text: "People",
                        size: 25,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ///////////////////Text of People group
                      LargeTextWidget(
                          text: "Number of people in your group",
                          size: 15,
                          fontWeight: FontWeight.normal,
                          color: Colors.black45),
                      //////////////////////////////////////Custom Button People Numbers
                      Container(
                        height: 60,
                        margin: EdgeInsets.all(10),
                        width: double.maxFinite,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context,index){
                          return GestureDetector(
                            onTap: (){
                                setState((){
                                  isButtonClick= index;
                                });
                            },
                            child: CustomButtonPeopleNumbers(
                              widget: LargeTextWidget(
                                  text: '${index+1}',color:index==isButtonClick? Colors.white:Colors.black ,),
                                buttonColors:index==isButtonClick? AppColors.mainColor: Colors.black12.withOpacity(0) ,
                            ),
                          );
                        },
                        itemCount: 5,),
                      ),
                 const     SizedBox(height: 10,),
                      LargeTextWidget(text: 'Description',size: 20,),
                    const  SizedBox(height: 5,),

                      SizedBox(
                          height: 30,
                          child: LargeTextWidget(text:
                          dco,size: 13,)),

                    const  SizedBox(height: 50,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          SizedBox(
                            height: MediaQuery.of(context).size.height/12,
                            width:80,
                            child: CustomButtonPeopleNumbers(
                                widget: Icon(Icons.favorite_border),
                                buttonColors: Colors.white,
                            ),
                          ),


                          CustomButton(buttonText: "Book Trip Now",
                            textSize: 13,
                            isCustomButtonFlexed: true,
                            widthButton: MediaQuery.of(context).size.width/1.8
                            , onTap: (){
                              })],
                      )

                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
