import 'package:flutter/material.dart';

class JobInfoPage extends StatefulWidget {
  const JobInfoPage({super.key});

  @override
  State<JobInfoPage> createState() => _JobInfoPageState();
}

class _JobInfoPageState extends State<JobInfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true,title: Text("Job info"),),
    );
  }
}
