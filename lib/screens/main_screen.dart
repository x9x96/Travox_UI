import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travox/screens/pages/bar_item_page.dart';
import 'package:travox/screens/pages/my_page.dart';
import 'package:travox/screens/pages/search_page.dart';

import 'pages/home_page.dart';

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

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: CupertinoTabBar(
        currentIndex: currentIndex,
        onTap: onTap,
        backgroundColor: Colors.white,
        activeColor: Colors.black54,
        inactiveColor: Colors.grey.withOpacity(0.5),
        border: const Border(top: BorderSide(color: Colors.white)),

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart_sharp)),
          BottomNavigationBarItem(icon: Icon(Icons.search)),
          BottomNavigationBarItem(icon: Icon(Icons.person)),
        ],
      ),
    );
  }
}
/*

Scaffold(
body: pages[0],
current
bottomNavigationBar: CupertinoTabBar(
backgroundColor: Colors.grey[50],
activeColor: Colors.black54,
inactiveColor: Colors.grey.withOpacity(0.5),
border: const Border(top: BorderSide(color: Color(0xFFFAFAFA))),
items: [
BottomNavigationBarItem(icon: Icon(Icons.apps),),
BottomNavigationBarItem(icon: Icon(Icons.bar_chart_sharp),),
BottomNavigationBarItem(icon: Icon(Icons.search),),
BottomNavigationBarItem(icon: Icon(Icons.person),),
]),*/
