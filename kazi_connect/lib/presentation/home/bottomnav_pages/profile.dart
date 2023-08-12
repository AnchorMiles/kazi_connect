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
  bool isEmailVerified = FirebaseAuth.instance.currentUser!.emailVerified;

  Widget bodyItem({
    required IconData iconData,
    required Color iconColor,
    required String title,
    required Color titleColor,
    required dynamic onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Card(
        child: SizedBox(
          width: 189,
          height: 60,
          child: ListTile(
            leading: Icon(
              iconData,
              color: iconColor,
            ),
            title: Text(
              title,
              style: TextStyle(color: titleColor, fontSize: tileFontSize),
            ),
            onTap: onTap,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: use this to update body of profile page
    dynamic deviceWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(100),
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
            title: Text(
              username,
            ),
            subtitle: Text(userEmail),
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: Icon(
              Icons.email_outlined,
              color: Theme.of(context).primaryColor,
            ),
            title: const Text('Email Verification'),
            subtitle: isEmailVerified
                ? const Text('Status: verified')
                : const Text('Status: not verified'),
            trailing: isEmailVerified
                ? null
                : TextButton(
                    onPressed: () async {
                      if (isEmailVerified) {
                        await FirebaseAuth.instance.currentUser!
                            .sendEmailVerification()
                            .whenComplete(
                              () => ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                      'Verification email sent to $userEmail'),
                                ),
                              ),
                            );
                      }
                    },
                    child: const Text('Send Verification Email'),
                  ),
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: Icon(Icons.phone_outlined, color: Theme.of(context).primaryColor,),
            title: Text("Phone"),
            subtitle: Text("+254712345678"),
            trailing: IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: Icon(Icons.insert_drive_file_outlined, color: Theme.of(context).primaryColor,),
            title: Text("Bio"),
            subtitle: Text("Update your bio"),
            trailing: IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
          ),
          const SizedBox(height: 8.0),
          ListTile(
            leading: Icon(Icons.account_circle_outlined, color: Theme.of(context).primaryColor,),
            title: Text("Status"),
            subtitle: Text("Job Seeker"),
            trailing: IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
          ),
          const SizedBox(height: 8.0),
          ListTile(
            leading: Icon(Icons.business, color: Theme.of(context).primaryColor,),
            title: Text("Interest"),
            subtitle: Text("Information Technology"),
            trailing: IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
          ),
          const SizedBox(height: 18.0),
          Wrap(
            children: [
              bodyItem(
                  iconData: Icons.logout,
                  iconColor: Theme.of(context).primaryColor,
                  title: "Sign out",
                  titleColor: Theme.of(context).primaryColor,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        icon: Icon(
                          Icons.logout,
                          color: Theme.of(context).primaryColor,
                        ),
                        title: const Text("Sign Out"),
                        content:
                            const Text("Are you sure you want to sign out?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(ctx);
                              FirebaseAuth.instance.signOut();
                              Navigator.popUntil(
                                  context, (route) => route.isFirst);
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
                  }),
              bodyItem(
                  iconData: Icons.delete_forever_outlined,
                  iconColor: Colors.red,
                  title: "Delete Account",
                  titleColor: Colors.red,
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (ctx) => AlertDialog(
                        icon: Icon(
                          Icons.logout,
                          color: Colors.red,
                        ),
                        title: const Text("Sign Out"),
                        content:
                            const Text("Are you sure you want to sign out?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(ctx);
                              FirebaseAuth.instance.signOut();
                              Navigator.popUntil(
                                  context, (route) => route.isFirst);
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
                  }),
            ]
            ,
          ),
        ],
      ),
    );
  }
}
