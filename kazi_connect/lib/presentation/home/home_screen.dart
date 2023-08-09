import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

int currentPageIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  List<IconData> bottomBarIconsData = [
    Icons.home_outlined,
    Icons.business_center_outlined,
    Icons.message_outlined,
    Icons.account_box_outlined
  ];

  List<String> appbarTitles = [
    "Kazi Connect",
    "Jobs",
    "Messages",
    "Profile",
  ];

  List<String> bottomBarIconLabels = [
    "Home",
    "Jobs",
    "Messages",
    "Profile",
  ];

  List<Widget> homeScreenPages = const [
    Column(),
    Column(),
    Column(),
    Column(),
  ];

  Widget _getBottomBar() => BottomNavigationBar(
        currentIndex: currentPageIndex,
        onTap: (index) => setState(() => currentPageIndex = index),
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        type: BottomNavigationBarType.fixed,
        items: List.generate(
          bottomBarIconsData.length,
          (index) => BottomNavigationBarItem(
            icon: Icon(bottomBarIconsData[index]),
            label: bottomBarIconLabels[index],
          ),
          growable: false,
        ),
        selectedIconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        selectedItemColor: Theme.of(context).primaryColor,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          appbarTitles[currentPageIndex],
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: homeScreenPages[currentPageIndex],
      bottomNavigationBar: _getBottomBar(),
    );
  }
}
