import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../utils.dart';
import '../popupmenu_destinations/applied_jobs.dart';
import '../popupmenu_destinations/saved_jobs.dart';

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
        elevation: 0.2,
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
              style: TextStyle(color: titleColor),
            ),
            onTap: onTap,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 600),
      child: ListView(
        children: [
          ListTile(
            leading: SizedBox(
              height: 60,
              width: 60,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: CachedNetworkImage(
                  imageUrl: userprofileUrl,
                  fit: BoxFit.cover,
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
            title: Text(
              username,
            ),
            subtitle: Text(userEmail),
            onTap: () {
              showDialog(
                  context: context,
                  builder: (ctx) => AlertDialog(
                        title: const Center(child: Text("Actions")),
                        content: Wrap(
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
                                      content: const Text(
                                          "Are you sure you want to sign out?"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(ctx);
                                            FirebaseAuth.instance.signOut();
                                            Navigator.popUntil(context,
                                                (route) => route.isFirst);
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
                                      icon: const Icon(
                                        Icons.delete_forever_outlined,
                                        color: Colors.red,
                                      ),
                                      title: const Text("Sign Out"),
                                      content: const Text(
                                          "Are you sure you want to sign out?"),
                                      actions: [
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pop(ctx);
                                            showDialog(
                                                context: context,
                                                builder: (ctx) {
                                                  return AlertDialog(
                                                    title: const Text(
                                                        'Warning: Account Deletion'),
                                                    content: const Column(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Are you sure you want to delete your account?',
                                                          style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                        SizedBox(height: 4),
                                                        Text(
                                                          'Deleting your account will permanently remove all your data.',
                                                          style: TextStyle(
                                                              fontSize: 14),
                                                        ),
                                                      ],
                                                    ),
                                                    actions: [
                                                      ElevatedButton(
                                                        onPressed: () async {
                                                          // Implement the logic for confirming account deletion
                                                          Navigator.of(context)
                                                              .pop();

                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            const SnackBar(
                                                              content: Text(
                                                                  'Deleting account data...'),
                                                            ),
                                                          );

                                                          // await FirebaseFirestore.instance
                                                          //     .collection("users")
                                                          //     .doc(userID)
                                                          //     .delete()
                                                          //     .whenComplete(
                                                          //       () async => await FirebaseStorage.instance
                                                          //       .ref('users_folder/$userID/')
                                                          //       .delete()
                                                          //       .whenComplete(
                                                          //         () async => await FirebaseAuth
                                                          //         .instance.currentUser!
                                                          //         .delete()
                                                          //         .whenComplete(
                                                          //           () async => await FirebaseAuth
                                                          //           .instance
                                                          //           .signOut()
                                                          //           .whenComplete(
                                                          //             () => Navigator.popUntil(
                                                          //             context,
                                                          //                 (route) =>
                                                          //             route.isFirst),
                                                          //       ),
                                                          //     ),
                                                          //   ),
                                                          // );
                                                        },
                                                        child: const Text(
                                                          'Delete Account',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.red),
                                                        ),
                                                      ),
                                                      TextButton(
                                                        onPressed: () {
                                                          Navigator.of(ctx)
                                                              .pop();
                                                        },
                                                        child: const Text(
                                                            'Cancel'),
                                                      ),
                                                    ],
                                                  );
                                                });
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
                          ],
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Navigator.pop(ctx);
                              },
                              child: const Text("Close"))
                        ],
                      ));
            },
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: const Icon(
              Icons.email_outlined,
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
            leading: Icon(
              Icons.phone_outlined,
              color: Theme.of(context).primaryColor,
            ),
            title: const Text("Phone"),
            subtitle: const Text("+254712345678"),
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: Icon(
              Icons.file_copy_outlined,
              color: Theme.of(context).primaryColor,
            ),
            title: const Text("Resume"),
            subtitle: const Text("(optional)"),
          ),
          const SizedBox(height: 8),
          ListTile(
            leading: Icon(
              Icons.insert_drive_file_outlined,
              color: Theme.of(context).primaryColor,
            ),
            title: const Text("Bio"),
            subtitle: const Text("Update your bio"),
          ),
          const SizedBox(height: 8.0),
          ListTile(
            leading: Icon(
              Icons.account_circle_outlined,
              color: Theme.of(context).primaryColor,
            ),
            title: const Text("Status"),
            subtitle: const Text("Job Seeker"),
          ),
          const SizedBox(height: 8.0),
          ListTile(
            leading: Icon(
              Icons.business,
              color: Theme.of(context).primaryColor,
            ),
            title: const Text("Interest"),
            subtitle: const Text("Information Technology"),
          ),
          const SizedBox(height: 18.0),
          Wrap(
            children: [
              bodyItem(
                  iconData: Icons.bookmark_border_rounded,
                  iconColor: Theme.of(context).primaryColor,
                  title: "Saved Jobs",
                  titleColor: Theme.of(context).primaryColor,
                  onTap: () {
                    nextPage(context: context, page: const SavedJobsPage());
                  }),
              bodyItem(
                  iconData: Icons.bookmark_border_rounded,
                  iconColor: Theme.of(context).primaryColor,
                  title: "Applied Jobs",
                  titleColor: Theme.of(context).primaryColor,
                  onTap: () {
                    nextPage(context: context, page: const AppliedJobsPage());
                  }),
            ],
          ),
        ],
      ),
    );
  }
}
