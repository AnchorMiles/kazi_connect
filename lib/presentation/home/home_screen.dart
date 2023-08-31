import 'package:flutter/material.dart';
import 'package:kazi_connect/presentation/home/appbar_destinations/search_page.dart';
import 'package:kazi_connect/presentation/home/bottomnav_pages/home.dart';
import 'package:kazi_connect/presentation/home/bottomnav_pages/jobs.dart';
import 'package:kazi_connect/presentation/home/drawer_destinations/about.dart';
import 'package:kazi_connect/presentation/home/drawer_destinations/help_support.dart';
import 'package:kazi_connect/presentation/home/drawer_destinations/notifications.dart';
import 'package:kazi_connect/presentation/home/drawer_destinations/terms_of_service.dart';
import 'package:kazi_connect/presentation/home/edit_profile/edit_profile.dart';

import '../../utils.dart';
import 'appbar_destinations/applied_jobs.dart';
import 'appbar_destinations/feedback.dart';
import 'appbar_destinations/saved_jobs.dart';
import 'bottomnav_pages/messages.dart';
import 'bottomnav_pages/profile.dart';

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

  List<IconData> bottomBarSelectedIconsData = [
    Icons.home,
    Icons.business_center,
    Icons.message,
    Icons.account_box
  ];

  List<String> bottomBarIconLabels = [
    "Home",
    "Jobs",
    "Messages",
    "Profile",
  ];

  List<Widget> homeScreenPages = const [
    HomePage(),
    JobsPage(),
    MessagesPage(),
    ProfilePage(),
  ];

  Widget _getBottomBar() => NavigationBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (index) =>
            setState(() => currentPageIndex = index),
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        destinations: List.generate(
          bottomBarIconsData.length,
          (index) => NavigationDestination(
            icon: Icon(bottomBarIconsData[index]),
            selectedIcon: Icon(bottomBarSelectedIconsData[index]),
            label: bottomBarIconLabels[index],
          ),
          growable: false,
        ),
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
        elevation: 16,
        child: SingleChildScrollView(
          child: Card(
            elevation: 0,
            child: Column(
              children: [
                const SizedBox(height: 380),
                const Divider(),
                ListTile(
                  onTap: () {
                    nextPage(context: context, page: const NotificationsPage());
                  },
                  title: const Text("Notifications"),
                  leading: const Icon(Icons.notifications_none),
                ),
                ListTile(
                  onTap: () {
                    nextPage(context: context, page: const HelpSupportPage());
                  },
                  title: const Text("Help & Support"),
                  leading: const Icon(Icons.help_outline),
                ),
                ListTile(
                  onTap: () {
                    nextPage(
                        context: context, page: const TermsOfServicePage());
                  },
                  title: const Text("Terms of Service"),
                  leading: const Icon(Icons.playlist_add_check_circle_outlined),
                ),
                ListTile(
                  onTap: () {},
                  title: const Text("Privacy Policy"),
                  leading: const Icon(Icons.privacy_tip_outlined),
                ),
                ListTile(
                  onTap: () {
                    nextPage(context: context, page: const AboutPage());
                  },
                  title: const Text("About"),
                  leading: const Icon(Icons.help_outline),
                ),
              ],
            ),
          ),
        ),
      ),
      appBar: AppBar(
        // centerTitle: true,
        title: AnimatedSwitcher(
            duration: const Duration(seconds: 1),
            child: appbarTitles[currentPageIndex]),
        actions: [
          if (currentPageIndex == 0 || currentPageIndex == 1)
            IconButton(
                tooltip: "Search",
                onPressed: () {
                  nextPage(context: context, page: const SearchPage());
                },
                icon: const Icon(Icons.search)),
          if (currentPageIndex == 3)
            IconButton(
                tooltip: "Edit Profile",
                onPressed: () =>
                    nextPage(context: context, page: const EditProfilePage()),
                icon: Icon(
                  Icons.edit,
                  color: Theme.of(context).primaryColor,
                )),
          if (currentPageIndex == 0 || currentPageIndex == 1)
            IconButton(
                tooltip: "Post a Job",
                onPressed: () {},
                icon: const Icon(Icons.add)),
          if (currentPageIndex != 3)
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
                        nextPage(
                            context: context, page: const AppliedJobsPage());
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
                    if (currentPageIndex != 3)
                      const PopupMenuItem(
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
                    if (currentPageIndex != 3)
                      const PopupMenuItem(
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
                    const PopupMenuItem(
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
                    const PopupMenuItem(
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
