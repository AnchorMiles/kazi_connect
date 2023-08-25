import 'package:flutter/material.dart';
import 'package:kazi_connect/presentation/widgets/message_item.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({super.key});

  @override
  State<MessagesPage> createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        messageItem(context: context),
        messageItem(context: context),
        messageItem(context: context),
        messageItem(context: context),
        messageItem(context: context),
        messageItem(context: context),
        messageItem(context: context),
        messageItem(context: context),
        messageItem(context: context),
        messageItem(context: context),
        messageItem(context: context),
        messageItem(context: context),
        messageItem(context: context),
        messageItem(context: context),
        messageItem(context: context),
        messageItem(context: context),
        messageItem(context: context),
        messageItem(context: context),
        messageItem(context: context),
        messageItem(context: context),
        messageItem(context: context),
        messageItem(context: context),
        messageItem(context: context),
        messageItem(context: context),
      ],
    );
  }
}
