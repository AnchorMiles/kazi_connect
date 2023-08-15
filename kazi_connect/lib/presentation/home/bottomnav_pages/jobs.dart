import 'package:flutter/material.dart';
import 'package:kazi_connect/presentation/widgets/message_item.dart';

import '../../widgets/job_item.dart';

class JobsPage extends StatefulWidget {
  const JobsPage({super.key});

  @override
  State<JobsPage> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        jobItem(),
        jobItem(),
        jobItem(),
        jobItem(),
        jobItem(),
        jobItem(),
        jobItem(),
        jobItem(),
        jobItem(),
        jobItem(),
        jobItem(),
        jobItem(),
        jobItem(),
        jobItem(),
        jobItem(),
        jobItem(),
        jobItem(),
        jobItem(),
        jobItem(),
        jobItem(),
        jobItem(),
        jobItem(),
        jobItem(),
        jobItem(),
        jobItem(),
        jobItem(),
        jobItem(),
        jobItem(),
        jobItem(),
        jobItem(),
      ],
    );
  }
}
