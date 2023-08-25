import 'package:easy_dynamic_theme/easy_dynamic_theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';

import 'firebase_options.dart';
import 'presentation/start/onboarding_page.dart';
import 'theming.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  /// The app uses Email and GoogleProvider to sign in.
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
    GoogleProvider(
      /*
      The Google client ID. Primarily required for desktop platforms.
      Ignored on Android and iOS (if iOSPreferPlist is true).
       */
        clientId: ''),
    // ... other providers can be added here if necessary
  ]);

  runApp(EasyDynamicThemeWidget(
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kazi Connect',
      debugShowCheckedModeBanner: false,
      theme: lightThemeData.copyWith(
          colorScheme: lightThemeData.colorScheme.copyWith(
            onPrimary: onPrimaryColor,
            primaryContainer: primaryContainer,
            onPrimaryContainer: onPrimaryContainer,
            secondary: secondaryColor,
            onSecondary: onSecondaryColor,
            secondaryContainer: secondaryContainer,
            onSecondaryContainer: onSecondaryContainer,
            tertiary: tertiaryColor,
            onTertiary: onTertiaryColor,
            tertiaryContainer: tertiaryContainer,
            onTertiaryContainer: onTertiaryContainer,
          )),
      darkTheme: darkThemeData.copyWith(
          colorScheme: darkThemeData.colorScheme.copyWith(
            onPrimary: onPrimaryColorDark,
            primaryContainer: primaryContainerDark,
            onPrimaryContainer: onPrimaryContainerDark,
            secondary: secondaryColorDark,
            onSecondary: onSecondaryColorDark,
            secondaryContainer: secondaryContainerDark,
            onSecondaryContainer: onSecondaryContainerDark,
            tertiary: tertiaryColorDark,
            onTertiary: onTertiaryColorDark,
            tertiaryContainer: tertiaryContainerDark,
            onTertiaryContainer: onTertiaryContainerDark,
          )),
      themeMode: EasyDynamicTheme
          .of(context)
          .themeMode,
      home: const OnBoardingPage(),
    );
  }
}
