import 'package:flutter/material.dart';

class MessageBoxPage extends StatefulWidget {
  const MessageBoxPage({super.key});

  @override
  State<MessageBoxPage> createState() => _MessageBoxPageState();
}

class _MessageBoxPageState extends State<MessageBoxPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Sender Name"),
        actions: const [
          Icon(
            Icons.account_circle_outlined,
            size: 38,
          )
        ],
      ),
    );
  }
}
