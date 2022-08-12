import 'package:flutter/material.dart';
import 'package:flutter_cluit_app/pages/nav_page/bar_item_page.dart';
import 'package:flutter_cluit_app/pages/home_page.dart';
import 'package:flutter_cluit_app/pages/nav_page/my_page.dart';
import 'package:flutter_cluit_app/pages/nav_page/search_page.dart';
import 'package:flutter_cluit_app/widgets/colors.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  List page= const[
    HomePage(),
    BarItemPage(),
    SearchPage(),
    MyPage(),
  ];
  int currentIndex =0;
  void onTap(int index){
    setState((){
      currentIndex =index;
    });
  }
  Widget build(BuildContext context) {

    return Scaffold(
    body: page[currentIndex],

       bottomNavigationBar: BottomNavigationBar(
         elevation: 0,

         selectedItemColor: AppColors. mainColor,
         unselectedItemColor: AppColors.mainTextColor,
         showSelectedLabels: false,
         showUnselectedLabels: false,
         type: BottomNavigationBarType.fixed,
         selectedFontSize: 0,
         unselectedFontSize: 0,backgroundColor: Colors.white,
         currentIndex:currentIndex ,
         items:const [
           BottomNavigationBarItem(
             label: 'Home ',
             icon:Icon(Icons.apps) ,
           ),
           BottomNavigationBarItem(
             label:'Bar',
             icon:Icon(Icons.bar_chart) ,
           ),
           BottomNavigationBarItem(
             label:'Search',
             icon:Icon(Icons.search_rounded) ,
           ),   BottomNavigationBarItem(
             label:'My Page',
             icon:Icon(Icons.person) ,
           ),
         ],

         onTap:onTap,
       ),

    );
  }
}
