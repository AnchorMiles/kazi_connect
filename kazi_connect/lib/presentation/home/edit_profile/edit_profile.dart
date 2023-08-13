import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kazi_connect/theming.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  String userprofileUrl =
      FirebaseAuth.instance.currentUser!.photoURL.toString();
  String userEmail = FirebaseAuth.instance.currentUser!.email.toString();

  File? image;

  Future pickImageGallery() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('An error occurred: $e')));
    }
  }

  Future pickImageCamera() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTemp = File(image.path);
      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('An error occurred: $e')));
    }
  }

  Widget _getImage() {
    if (image != null) {
      return SizedBox(
        width: 100,
        height: 100,
        child: ClipRRect(
            borderRadius: BorderRadius.circular(100.0),
            child: Image.file(
              image!,
              fit: BoxFit.cover,
            )),
      );
    } else {
      // return current image
      return Center(
        child: SizedBox(
          height: 100,
          width: 100,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: CachedNetworkImage(
              fit: BoxFit.cover,
              imageUrl: userprofileUrl,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                child: CircularProgressIndicator(
                  value: downloadProgress.progress,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              errorWidget: (cx, url, downloadProgress) {
                return const Center(
                    child: Text(
                  "no image selected",
                  style: TextStyle(fontSize: 20),
                  textAlign: TextAlign.center,
                ));
              },
            ),
          ),
        ),
      );
    }
  }

  bool loading = false,
      showErrorText = false,
      navigatedToNextPage = false,
      editingImage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Edit Profile",
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(width: 40,),
              _getImage(),
              IconButton(
                  onPressed: () {
                    setState(() => editingImage = !editingImage);
                  },
                  icon: const Icon(Icons.edit)),
            ],
          ),
          if (editingImage)const SizedBox(height: 4),
          if (editingImage)const Text("Get image from:"),
          if (editingImage)const SizedBox(height: 4),
          if (editingImage)  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              OutlinedButton(
                  onPressed: () async => pickImageGallery(),
                  child: Text(
                    "Gallery",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                    ),
                  )),
              const SizedBox(width: 12),
              OutlinedButton(
                  onPressed: () async => pickImageCamera(),
                  child: Text(
                    "Camera",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                    ),
                  )),
            ],
          ),
          if (image != null && editingImage)
            SizedBox(height: 8),if (image != null && editingImage)
            ElevatedButton(
                onPressed: () async {
                  if (image == null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Please select an image to be saved"),
                      ),
                    );
                  } else {
                    editingImage = !editingImage;
                    String photoURL = "";

                    setState(() {
                      loading = true;
                    });

                    await FirebaseStorage.instance
                        .ref("users/$userEmail")
                        .child("ProfilePhoto.png")
                        .putFile(image!)
                        .then((snapshot) async {
                      photoURL = await snapshot.ref.getDownloadURL();
                    }).whenComplete(() async {
                      if (photoURL != "") {
                        await FirebaseAuth.instance.currentUser!
                            .updatePhotoURL(photoURL)
                            .whenComplete(() {
                          setState(() {
                            loading = false;
                          });

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content:
                                  Text("Profile picture saved successfully"),
                            ),
                          );
                        });
                      } else {
                        setState(() {
                          loading = false;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                                "Please ensure you have a well set internet connection and try again"),
                          ),
                        );
                      }
                    });
                  }
                },
                child: SizedBox(
                  width: 300,
                  child: loading
                      ? Center(
                          child: SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                        )
                      : Center(
                        child: Text(
                          "Save",
                          style: TextStyle(
                              fontSize: 20,
                              color: Theme.of(context).primaryColor),
                        ),
                      ),
                )),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Divider(),
          ),
        ],
      ),
    );
  }
}
