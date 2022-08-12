import 'package:flutter/material.dart';
import 'package:flutter_cluit_app/widgets/colors.dart';
import 'package:flutter_cluit_app/widgets/custom_places.dart';
import 'package:flutter_cluit_app/widgets/large_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

List mountainImage = [
  'mountain-reflection.jpg',
  'mountain.jpeg',
  'R (3).jpg',
  'R (4).jpg',
  'R (5).jpg',
  'mountain-platt.jpg',
];

Map exploreImages={
  'balloning.png':'Ballooning',
  'hiking.png': 'hiking',
  'kayaking.png':'Kayaking',
  'snorkling.png':'Snorkling',
};

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController controller = TabController(length: 3, vsync: this);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ///////////////////////////////////////////// menu widget
        Container(
            height: MediaQuery.of(context).size.height / 7.5,
            margin:const EdgeInsets.symmetric(horizontal: 15),
            padding:const EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    showMenu(
                        context: context,
                        position: RelativeRect.fill,
                        elevation: 5,
                        items: const [
                          PopupMenuItem(
                            child: Text('Home'),
                          ),
                          PopupMenuItem(child: Text('Setting')),
                          PopupMenuItem(child: Text('About')),
                        ]);
                  },
                  child: Icon(Icons.menu_rounded, color: Colors.black),
                  style: ButtonStyle(
                      elevation: MaterialStateProperty.all(0),
                      backgroundColor: MaterialStateProperty.all(Colors.white)),
                ),
                const CircleAvatar(
                    radius: 30, backgroundImage: AssetImage('img/person1.jpg'))
              ],
            )),
        const SizedBox(
          height: 10,
        ),
        ///////////////////////////////////////////// Discover Text
        Container(
          margin: EdgeInsets.only(left: MediaQuery.of(context).size.width / 15),
          child: LargeTextWidget(
            text: 'Discover',
            size: 30,
          ),
        ),
        const SizedBox(
          height: 25,
        ),

        /////////////////////////////////////////////////Tab widgets
        Container(
          height: MediaQuery.of(context).size.height / 23,
          width: double.maxFinite,
          child: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.label,
            controller: controller,
            indicatorWeight: 2,
            indicator:
                IndicatorDecoration(color: AppColors.mainColor, radius: 4),
            tabs: const [
              Tab(
                child: Text('Places'),
              ),
              Tab(
                child: Text('Inspiration'),
              ),
              Tab(
                child: Text('Emotions'),
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 10),
          height: MediaQuery.of(context).size.height / 2.2,
          child: TabBarView(
            controller: controller,
            children: [
              CustomPlaces(mountainImage: mountainImage),
              Center(child: Text("data")),
              Center(child: Text("data")),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),

        ///////////////////////////////////////////////////Explore More widgets
        Container(
          margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 15,
              right: MediaQuery.of(context).size.width / 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              LargeTextWidget(
                text: 'Explore More',
                size: 20,
              ),
              GestureDetector(
                  onTap: () {
                    print('See All');
                  },
                  child: LargeTextWidget(
                    text: 'See All',
                    color: AppColors.mainColor,
                    size: 14,
                  )),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),

        /////////////////////////////////////////////////Explore Items Widgets
        Container(
          height: MediaQuery.of(context).size.height / 8,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: exploreImages.length,
              itemBuilder: (context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10),
                      height: MediaQuery.of(context).size.height / 10,
                      width: MediaQuery.of(context).size.width / 4,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage('img/' + exploreImages.keys.elementAt(index)),
                              fit: BoxFit.cover)),
                    ),
                    LargeTextWidget(
                        text: exploreImages.values.elementAt(index),
                        fontWeight: FontWeight.w600,
                        size: 12),
                  ],
                );
              }),
        )
      ],
    );
  }
}

/////////////////////////////////// To classes to make circle pont with Decoration
class IndicatorDecoration extends Decoration {
  final Color color;
  double radius;
  IndicatorDecoration({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return BoxPainterToDecoration(color: color, radius: radius);
  }
}

//////////////////////////////////// Complete circle pont Decoration Painter
class BoxPainterToDecoration extends BoxPainter {
  final Color color;
  double radius;
  BoxPainterToDecoration({required this.color, required this.radius});
  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    //////////// To move circle from width and height with offset object
    final Offset circleOffset =
        Offset(configuration.size!.width / 2, configuration.size!.height);
    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}
