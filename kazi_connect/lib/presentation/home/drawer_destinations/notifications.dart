import 'package:flutter/material.dart';
import 'package:kazi_connect/presentation/widgets/notification_item.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Notifications"),
        actions: [
          IconButton(
              tooltip: "Clear Notifications",
              onPressed: () =>
                  showDialog(
                      context: context,
                      builder: (ctx) =>
                          AlertDialog(
                            icon: Icon(Icons.clear_all),
                            title: Text("Clear Notifications"),
                            content: Text(
                                "Please confirm that you are clearing your notifications"),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(ctx);
                                    //TODO: Add logic to clear notifications
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text(
                                            "\$name's notifications cleared;")));
                                  },
                                  child: const Text("Okay")),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(ctx);
                                  },
                                  child: const Text("Cancel")),
                            ],
                          )),
              icon: const Icon(Icons.clear_all))
        ],
      ),
      body: ListView(
        children: [
          notificationItem(),
          notificationItem(),
          notificationItem(),
          notificationItem(),
          notificationItem(),
          notificationItem(),
          notificationItem(),
          notificationItem(),
          notificationItem(),
          notificationItem(),
          notificationItem(),
          notificationItem(),
          notificationItem(),
          notificationItem(),
        ],
      ),
    );
  }
}
