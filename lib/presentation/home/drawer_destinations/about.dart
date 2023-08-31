import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "About us",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: ListView(
        children: [],
      ),
    );
  }
}
