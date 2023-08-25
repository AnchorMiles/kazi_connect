import 'package:flutter/material.dart';
import 'package:kazi_connect/presentation/widgets/job_item.dart';

Widget notificationItem() {
  return ListTile(
    title: const Text("Notification Title"),
    subtitle: Text(
      loremIpsumText,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
    ),
  );
}
