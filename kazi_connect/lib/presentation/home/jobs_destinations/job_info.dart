import 'package:flutter/material.dart';
import 'package:kazi_connect/presentation/widgets/job_item.dart';

import '../../../utils.dart';

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
          centerTitle: true,
          title: const Text("Job Info"),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.bookmark_add_outlined,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
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
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Send Application",
                  style: TextStyle(color: Theme.of(context).primaryColor),
                ),
              ),
            ),
          ],
        ));
  }
}
