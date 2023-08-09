import 'package:flutter/material.dart';

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
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 380),
              const Divider(),
              ListTile(
                onTap: () {},
                title: const Text("Help & Support"),
                leading: const Icon(Icons.help_outline),
              ),
              ListTile(
                onTap: () {},
                title: const Text("Terms of Service"),
                leading: const Icon(Icons.playlist_add_check_circle_outlined),
              ),
              ListTile(
                onTap: () {},
                title: const Text("Privacy Policy"),
                leading: const Icon(Icons.privacy_tip_outlined),
              ),
              ListTile(
                onTap: () {},
                title: const Text("About"),
                leading: const Icon(Icons.help_outline),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        // centerTitle: true,
        title: Text(
          appbarTitles[currentPageIndex],
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        actions: [
          IconButton(onPressed: () {},tooltip: "Search", icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, tooltip: "Post a Job",icon: const Icon(Icons.add)),
          PopupMenuButton(
              position: PopupMenuPosition.under,
              onSelected: (value) {
                switch (value) {
                  case "Saved Jobs":
                    {}
                  case "Applied Jobs":
                    {}
                  case "Invite Friends":
                    {}
                  case "Feedback":
                    {}
                }
              },
              itemBuilder: (ctx) {
                return const [
                  PopupMenuItem(
                      value: "Saved Jobs",
                      child: Row(
                        children: [
                          Icon(Icons.bookmark_border_rounded),
                          SizedBox(
                            width: 12,
                          ),
                          Text("Saved Jobs")
                        ],
                      )),
                  PopupMenuItem(
                      value: "Applied Jobs",
                      child: Row(
                        children: [
                          Icon(Icons.view_timeline_outlined),
                          SizedBox(
                            width: 12,
                          ),
                          Text("Applied Jobs")
                        ],
                      )),
                  PopupMenuItem(
                      value: "Invite Friends",
                      child: Row(
                        children: [
                          Icon(Icons.share),
                          SizedBox(
                            width: 12,
                          ),
                          Text("Invite Friends")
                        ],
                      )),
                  PopupMenuItem(
                      value: "Feedback",
                      child: Row(
                        children: [
                          Icon(Icons.feedback_outlined),
                          SizedBox(
                            width: 12,
                          ),
                          Text("Feedback")
                        ],
                      )),
                ];
              })
        ],
      ),
      body: homeScreenPages[currentPageIndex],
      bottomNavigationBar: _getBottomBar(),
    );
  }
}
