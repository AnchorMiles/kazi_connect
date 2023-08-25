import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:page_transition/page_transition.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

// Navigation - next page
dynamic nextPage({required context, required page}) {
  Navigator.push(
      context, PageTransition(type: PageTransitionType.fade, child: page));
}

// Navigation - replace
dynamic nextPageReplace({required context, required page}) {
  Navigator.pushReplacement(
      context, PageTransition(type: PageTransitionType.fade, child: page));
}

// TODO: update phone number and email address
Future<void> makePhoneCall() async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: "+254797228948",
  );
  await launchUrl(launchUri);
}

Future<void> makeDirectPhoneCall() async {
  //when call permission is granted:
  await FlutterPhoneDirectCaller.callNumber('+254797228948');
  //else not granted, just show phone number
  if (await Permission.phone.isDenied) {
    makePhoneCall();
  }
}

// TODO: Add message here to be sent to the admin
Future<void> openWhatsApp({String message = ""}) async {
  final uri = Uri.parse("https://wa.me/254797228948");
  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    /// It is assumed that all users have downloaded WhatsApp
    // can't launch url
  }
}

sendEmail() async {
  String email = Uri.encodeComponent("info@kaziconnect.com");
  String subject = Uri.encodeComponent("[Insert Subject]");
  String body = Uri.encodeComponent("");
  Uri mail = Uri.parse("mailto:$email?subject=$subject&body=$body");
  await launchUrl(mail);
}

String getUserName() {
  final user = FirebaseAuth.instance.currentUser;

  String? displayName = user?.displayName;
  String? email = user?.email;

  if (displayName != null) {
    return displayName.toString();
  }
  return email.toString();
}

/// shares data to other apps
onShareData(context, text, subject) async {
  final RenderBox box = context.findRenderObject();

  await Share.share(text,
      subject: subject,
      sharePositionOrigin: box.localToGlobal(Offset.zero) & box.size);
}
