import 'package:flutter/material.dart';

class SavedJobsPage extends StatefulWidget {
  const SavedJobsPage({super.key});

  @override
  State<SavedJobsPage> createState() => _SavedJobsPageState();
}

class _SavedJobsPageState extends State<SavedJobsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Saved Jobs"),
      ),
    );
  }
}
