import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app_yt/cubit/app_cubit_states.dart';
import 'package:travel_app_yt/cubit/app_cubits.dart';
import 'package:travel_app_yt/misc/colors.dart';
import 'package:travel_app_yt/widgets/app_large_text.dart';
import 'package:travel_app_yt/widgets/app_text.dart';
// ignore_for_file: prefer_const_constructors

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "ballooning.png": "Ballooning",
    "kayaking.png": "Kayaking",
    "hiking.png": "Hiking",
    "snorkling.png": "Snorkling"
  };
  @override
  Widget build(BuildContext context) {
    TabController tabContoller = TabController(length: 3, vsync: this);
    return Scaffold(
        body: BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      if (state is LoadedState) {
        var info = state.places;
        return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            padding: const EdgeInsets.only(top: 70, left: 20),
            child: Row(children: [
              Icon(Icons.menu, size: 30, color: Colors.black54),
              Expanded(child: Container()),
              //menu text
              Container(
                margin: EdgeInsets.only(right: 20),
                width: 50.0,
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey.withOpacity(0.5),
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 2,
          ),
          //discover text
          Container(
            margin: const EdgeInsets.only(left: 20),
            child: AppLargeText(text: "Discover"),
          ),
          SizedBox(
            height: 5,
          ),
          //tab bar
          Align(
            alignment: Alignment.centerLeft,
            child: TabBar(
                labelPadding: const EdgeInsets.only(left: 20, right: 20),
                controller: tabContoller,
                labelColor: Colors.black,
                unselectedLabelColor: Colors.grey,
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                indicator:
                    CircleTabIndicator(color: AppColors.mainColor, radius: 4),
                tabs: const [
                  Tab(text: "Places"),
                  Tab(text: "Inspiration"),
                  Tab(text: "Emotions"),
                ]),
          ),
          Container(
            padding: const EdgeInsets.only(left: 20),
            height: 240,
            width: double.maxFinite,
            child: TabBarView(
              controller: tabContoller,
              children: [
                ListView.builder(
                  itemCount: info.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      margin: EdgeInsets.only(right: 15, top: 10),
                      padding: EdgeInsets.only(left: 20),
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                          image: DecorationImage(
                              image: NetworkImage(
                                "http://mark.bslmeiyu.com/uploads${info[index].img}",
                              ),
                              fit: BoxFit.cover)),
                    );
                  },
                ),
                Text("Noa"),
                Text("Gay")
              ],
            ),
          ),
          SizedBox(height: 15),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppLargeText(
                  text: "Explore More",
                  size: 22,
                ),
                AppText(text: "See all", color: AppColors.textColor1)
              ],
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 104,
            width: double.maxFinite,
            margin: const EdgeInsets.only(left: 20),
            child: ListView.builder(
                itemCount: 4,
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 18),
                    child: Column(
                      children: [
                        Container(
                          //margin: EdgeInsets.only(right: 50),
                          padding: EdgeInsets.only(left: 20),
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                              image: DecorationImage(
                                  image: AssetImage(
                                    "images/${images.keys.elementAt(index)}",
                                  ),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        AppText(
                          text: images.values.elementAt(index),
                          color: AppColors.textColor2,
                        )
                      ],
                    ),
                  );
                }),
          )
        ]);
      } else {
        return Container();
      }
    }));
  }
}

// ignore: must_be_immutable
class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;
  CircleTabIndicator({required this.color, required this.radius});
  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    // ignore: todo
    // TODO: implement createBoxPainter
    return _Circlepainter(color: color, radius: radius);
  }
}

class _Circlepainter extends BoxPainter {
  final Color color;
  double radius;
  _Circlepainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 - radius / 2,
        configuration.size!.height - radius);
    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
