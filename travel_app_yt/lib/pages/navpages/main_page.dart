import 'package:flutter/material.dart';
import 'package:travel_app_yt/pages/home_page.dart';
import 'package:travel_app_yt/pages/navpages/bar_item_page.dart';
import 'package:travel_app_yt/pages/navpages/my_page.dart';
import 'package:travel_app_yt/pages/navpages/search_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    const HomePage(),
    const BarItemPage(),
    const SearchPage(),
    const MyPage(),
  ];

  int currentindex = 0;

  void onTap(int index) {
    setState(() {
      currentindex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentindex],
      bottomNavigationBar: BottomNavigationBar(
          unselectedFontSize: 0,
          selectedFontSize:
              0, //se schiacciamo in mezzo tra due icone non va in nessuna delle due (senza queste due linee lo farebbe)
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          onTap: onTap,
          currentIndex: currentindex,
          selectedItemColor: Colors.black54,
          unselectedItemColor: Colors.grey.withOpacity(0.5),
          showUnselectedLabels: false,
          showSelectedLabels: false,
          elevation: 0,
          // ignore: prefer_const_literals_to_create_immutables
          items: [
            const BottomNavigationBarItem(
                label: "Home", icon: Icon(Icons.apps)),
            const BottomNavigationBarItem(
                label: "Bar", icon: Icon(Icons.bar_chart_sharp)),
            const BottomNavigationBarItem(
                label: "Search", icon: Icon(Icons.search)),
            const BottomNavigationBarItem(
                label: "My", icon: Icon(Icons.person)),
          ]),
    );
  }
}
