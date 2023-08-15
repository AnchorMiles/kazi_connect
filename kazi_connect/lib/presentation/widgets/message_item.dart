import 'package:flutter/material.dart';
import 'package:kazi_connect/presentation/home/messages_destinations/message_box.dart';
import 'package:kazi_connect/utils.dart';

Widget messageItem({required BuildContext context}) {
  return ListTile(
    leading: Icon(
      Icons.account_circle_outlined,
      size: 48,
    ),
    title: Text("Sender Name"),
    subtitle: Text("Message Title"),
    onTap: () {
      nextPage(context: context, page: MessageBoxPage());
    },
  );
}
