import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';

import '../../../utils.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  double tileFontSize = 18.0;

  String userprofileUrl =
  FirebaseAuth.instance.currentUser!.photoURL.toString();
  String userEmail = FirebaseAuth.instance.currentUser!.email.toString();
  String username = FirebaseAuth.instance.currentUser!.displayName.toString();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 28.0),
          ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: SizedBox(
              height: 200,
              width: 200,
              child: CachedNetworkImage(
                imageUrl: userprofileUrl,
                fit: BoxFit.fill,
                errorWidget: (ctx, url, downloadProgress) {
                  return Icon(
                    Icons.account_circle_outlined,
                    size: 120,
                    color: Theme.of(context).primaryColor,
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 14.0),
          ListTile(
            title: Text(
              "$username\n$userEmail",
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 18.0),
          // Other list tiles...
          ListTile(
            title: Text(
              "Sign out",
              style: TextStyle(fontSize: tileFontSize),
            ),
            leading: Icon(
              Icons.logout,
              color: Theme.of(context).primaryColor,
            ),
            onTap: () {
              showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                  icon: Icon(
                    Icons.logout,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: const Text("Sign Out"),
                  content: const Text("Are you sure you want to sign out?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                        FirebaseAuth.instance.signOut();
                        Navigator.popUntil(context, (route) => route.isFirst);
                      },
                      child: const Text("Okay"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(ctx);
                      },
                      child: const Text("Cancel"),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
