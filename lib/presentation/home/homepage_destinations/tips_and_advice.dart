import 'package:flutter/material.dart';

class TipsAndAdvice extends StatelessWidget {
  const TipsAndAdvice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Job Search Tips and Advice",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
    );
  }
}
