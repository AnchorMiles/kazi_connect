import 'package:flutter/material.dart';
import 'package:kazi_connect/utils.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String dayTime = "Evening", userName = getUserName();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            elevation: 0.5,
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
        Padding(
          padding: const EdgeInsets.only(bottom: 8, left: 8, right: 8),
          child: SizedBox(
            height: 200,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.asset(
                "assets/image_holder.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
        )
      ],
    );
  }
}
