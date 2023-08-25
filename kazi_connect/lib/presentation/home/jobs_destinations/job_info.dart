import 'package:flutter/material.dart';
import 'package:kazi_connect/presentation/widgets/job_item.dart';

class JobInfoPage extends StatefulWidget {
  const JobInfoPage({super.key});

  @override
  State<JobInfoPage> createState() => _JobInfoPageState();
}

class _JobInfoPageState extends State<JobInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Job Info"),
          actions: [
            IconButton(
              tooltip: "Save",
              onPressed: () {},
              icon: Icon(
                Icons.bookmark_add_outlined,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(width: 10),
            OutlinedButton(
              onPressed: () {},
              child: Text(
                "Send Application",
                style: TextStyle(color: Theme.of(context).primaryColor),
              ),
            ),
            const SizedBox(width: 10),
          ],
        ),
        body: ListView(children: [
          ListTile(
            leading: const Icon(
              Icons.account_circle_outlined,
              size: 32,
            ),
            title: Text("Owner"),
            subtitle: Text(
              "Verified",
              style: TextStyle(color: Theme.of(context).primaryColor),
            ),
          ),
          ListTile(
            title: const Text("Job Title"),
            subtitle: Text(
              loremIpsumText,
            ),
          ),
          const ListTile(
            title: Text("Type"),
            subtitle: Text(
              "Full Time",
            ),
          ),
          const ListTile(
            title: Text("Salary"),
            subtitle: Text(
              "Ksh. 20,000 per month",
            ),
          ),
          const ListTile(
            title: Text("Requirements"),
            subtitle: Text(
              "- Requirement Text Requirement Text\n"
              "- Requirement Text Requirement Text\n"
              "- Requirement Text Requirement Text\n"
              "- Requirement Text Requirement Text\n"
              "- Requirement Text Requirement Text",
            ),
          ),
          const ListTile(
            title: Text("What you will do"),
            subtitle: Text(
              "- Task Text Task Text\n"
              "- Task Text Task Text\n"
              "- Task Text Task Text\n"
              "- Task Text Task Text\n"
              "- Task Text Task Text",
            ),
          ),
        ]));
  }
}
