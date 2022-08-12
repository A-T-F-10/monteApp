import 'package:flutter/material.dart';
import 'package:flutter_cluit_app/pages/nav_page/detail_page.dart';
import 'package:flutter_cluit_app/widgets/large_text.dart';
import 'package:get/get.dart';
class CustomPlaces extends StatelessWidget {
  List mountainImage ;
   CustomPlaces({required this.mountainImage, Key? key}) : super(key: key);
  Map mountainNameAndLocation ={
    'Russia':' Narodnaya',
    'Morocco':' Toubkal',
    'Namibia':'Brandberg',
    'Australia':' Field',
    'Austria':'Austria',
    'South Africa':' Castle',
  };
  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemCount: mountainImage.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index){
          return GestureDetector(
            onTap: (){
              Get.to(DetailPage(),arguments: {
               'imageList': mountainImage[index],
                'mapValue':mountainNameAndLocation.values.elementAt(index),
                'mapKay':mountainNameAndLocation.keys.elementAt(index),
                'index':index,
              });
            },
            child: Container(
              width: MediaQuery.of(context).size.width/1.7,
              margin:const EdgeInsets.all(10),
              decoration: BoxDecoration(

                  borderRadius: BorderRadius.circular(20),
                  image: DecorationImage(
                      colorFilter:ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.darken) ,
                      fit: BoxFit.cover,
                      image: AssetImage('img/mountain/'+mountainImage[index])
                  )
              ),
              child:  Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    LargeTextWidget(text: mountainNameAndLocation.values.elementAt(index),color: Colors.white,size: 25,),
                 const   SizedBox(height: 10,),
                    Row(
                      children: [
                     const   Icon(Icons.location_on,color: Colors.white,size: 20),

                      const  SizedBox(width: 10,),
                        LargeTextWidget(text: mountainNameAndLocation.keys.elementAt(index),
                          color: Colors.white70,size: 13,fontWeight: FontWeight.normal,),
                      ],
                    ),
                   const SizedBox(height: 10,)
                  ],
                ),
              ) ,
            ),
          ) ;

        });
  }
}
