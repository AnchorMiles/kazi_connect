import 'package:flutter/material.dart';
import 'package:kazi_connect/presentation/home/drawer_destinations/about.dart';
import 'package:kazi_connect/presentation/home/drawer_destinations/help_support.dart';
import 'package:kazi_connect/presentation/home/edit_profile/edit_profile.dart';
import 'package:kazi_connect/presentation/home/homepage_destinations/how_it_works.dart';
import 'package:kazi_connect/presentation/home/homepage_destinations/tips_and_advice.dart';
import 'package:kazi_connect/utils.dart';

import '../../../logic/get_daytime.dart';
import '../appbar_destinations/applied_jobs.dart';
import '../appbar_destinations/saved_jobs.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String userName = getUserName();

  Widget bodyItem({
    required IconData iconData,
    required Color iconColor,
    required String title,
    required Color titleColor,
    required dynamic onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        elevation: 0.2,
        child: SizedBox(
          width: 189,
          height: 60,
          child: ListTile(
            leading: Icon(
              iconData,
              color: iconColor,
            ),
            title: Text(
              title,
              style: TextStyle(color: titleColor),
            ),
            onTap: onTap,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String dayTime = getDaytime();

    return ListView(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: Card(
            elevation: 0.2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text.rich(
                TextSpan(
                    text: "Good ",
                    style: const TextStyle(fontSize: 20),
                    children: [
                      TextSpan(text: "$dayTime\n"),
                      TextSpan(
                          text: userName,
                          style: TextStyle(
                              fontSize: 22,
                              color: Theme.of(context).primaryColor))
                    ]),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(24),
            child: Image.asset(
              "assets/person_in_office.png",
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Card(
            elevation: 0.2,
            child: ListTile(
              title: Text("Kazi Connect"),
              subtitle: Text("A platform to find all types of hustles"),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 0.2,
            child: ListTile(
              leading: Icon(
                Icons.work_outline,
                color: Theme.of(context).primaryColor,
              ),
              title: Text(
                "How it works",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
              onTap: () => nextPage(context: context, page: const HowItWorks()),
            ),
          ),
        ),
        Wrap(
          children: [
            bodyItem(
                iconData: Icons.bookmark_border_rounded,
                iconColor: Theme.of(context).primaryColor,
                title: "Saved Jobs",
                titleColor: Theme.of(context).primaryColor,
                onTap: () {
                  nextPage(context: context, page: const SavedJobsPage());
                }),
            bodyItem(
                iconData: Icons.file_copy_outlined,
                iconColor: Theme.of(context).primaryColor,
                title: "Applied Jobs",
                titleColor: Theme.of(context).primaryColor,
                onTap: () {
                  nextPage(context: context, page: const AppliedJobsPage());
                }),
            bodyItem(
                iconData: Icons.tips_and_updates_outlined,
                iconColor: Theme.of(context).primaryColor,
                title: "Get Tips",
                titleColor: Theme.of(context).primaryColor,
                onTap: () {
                  nextPage(context: context, page: const TipsAndAdvice());
                }),
            bodyItem(
                iconData: Icons.account_box_outlined,
                iconColor: Theme.of(context).primaryColor,
                title: "Edit Profile",
                titleColor: Theme.of(context).primaryColor,
                onTap: () {
                  nextPage(context: context, page: const EditProfilePage());
                }),
            bodyItem(
                iconData: Icons.info_outline,
                iconColor: Theme.of(context).primaryColor,
                title: "About Us",
                titleColor: Theme.of(context).primaryColor,
                onTap: () {
                  nextPage(context: context, page: const AboutPage());
                }),
            bodyItem(
                iconData: Icons.contact_support_outlined,
                iconColor: Theme.of(context).primaryColor,
                title: "Help & Support",
                titleColor: Theme.of(context).primaryColor,
                onTap: () {
                  nextPage(context: context, page: const HelpSupportPage());
                }),
          ],
        ),
      ],
    );
  }
}
