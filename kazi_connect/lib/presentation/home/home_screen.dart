import 'package:flutter/material.dart';

import '../../utils.dart';
import 'bottomnav_pages/profile.dart';
import 'popupmenu_destinations/applied_jobs.dart';
import 'popupmenu_destinations/feedback.dart';
import 'popupmenu_destinations/saved_jobs.dart';

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
    ProfilePage(),
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
    TextStyle appbarTextStyle =
        TextStyle(color: Theme.of(context).primaryColor);
    List<Text> appbarTitles = [
      Text(style: appbarTextStyle, "Kazi Connect"),
      Text(style: appbarTextStyle, "Jobs"),
      Text(style: appbarTextStyle, "Messages"),
      Text(style: appbarTextStyle, "Profile"),
    ];

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
        title: AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            child: appbarTitles[currentPageIndex]),
        actions: [
          if (currentPageIndex == 1)
            IconButton(
                onPressed: () {},
                tooltip: "Search",
                icon: const Icon(Icons.search)),
          IconButton(
              onPressed: () {},
              tooltip: "Post a Job",
              icon: const Icon(Icons.add)),
          PopupMenuButton(
              position: PopupMenuPosition.under,
              onSelected: (value) {
                switch (value) {
                  case "Saved Jobs":
                    {
                      nextPage(context: context, page: const SavedJobsPage());
                    }
                  case "Applied Jobs":
                    {
                      nextPage(context: context, page: const AppliedJobsPage());
                    }

                  case "Invite Friends":
                    {
                      onShareData(
                          context,
                          "https://play.google.com/store/apps/details?id=com.ancormiles.connect",
                          'Kazi Connect App Link');
                    }
                  case "Feedback":
                    {
                      nextPage(context: context, page: const FeedbackPage());
                    }
                }
              },
              itemBuilder: (ctx) {
                return [
                  if (currentPageIndex != 3)PopupMenuItem(
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
                  if (currentPageIndex != 3) PopupMenuItem(
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
