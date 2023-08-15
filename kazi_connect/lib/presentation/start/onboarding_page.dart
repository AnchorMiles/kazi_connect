import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:kazi_connect/presentation/home/home_screen.dart';

import 'auth_gate.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const AuthGate()),
    );
  }

  Widget _buildFullscreenImage() {
    return Image.asset(
      'assets/fullscreen.jpg',
      fit: BoxFit.cover,
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
    );
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: Colors.white,
      imagePadding: EdgeInsets.zero,
    );
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // If user is signed in, return HomeScreen
          if (snapshot.hasData) {
            return const HomeScreen();
          }
          return Scaffold(
            appBar: AppBar(
              toolbarHeight: 0,
            ),
            body: IntroductionScreen(
              key: introKey,
              globalBackgroundColor: Colors.white,
              allowImplicitScrolling: true,
              autoScrollDuration: 6000,
              // 6 seconds
              infiniteAutoScroll: true,
              globalHeader: Align(
                alignment: Alignment.topRight,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 16, right: 16),
                    child: _buildImage('logo.png', 100),
                  ),
                ),
              ),
              pages: [
                PageViewModel(
                  title: "Welcome to Kazi Connect",
                  body:
                      "Connecting You to short-term, full-time jobs and freelancers in Kenya",
                  image: _buildImage('welcome_image.jpg'),
                  decoration: pageDecoration,
                ),
                PageViewModel(
                  title: "Discover Job Opportunities",
                  body:
                      "Explore a variety of short-term job listings across different industries and roles.",
                  image: _buildImage('discover_jobs_image.jpg'),
                  decoration: pageDecoration,
                ),
                PageViewModel(
                  title: "Easy Application Process",
                  body:
                      "Apply for jobs with a few taps, making your job search efficient and hassle-free.",
                  image: _buildImage('easy_application_image.jpg'),
                  decoration: pageDecoration,
                ),
                PageViewModel(
                  title: "Direct Interaction with Employers",
                  body:
                      "Communicate directly with potential employers, ask questions, and schedule interviews.",
                  image: _buildImage('employer_interaction_image.jpg'),
                  decoration: pageDecoration,
                ),
                PageViewModel(
                  title: "Your Privacy Matters",
                  body:
                      "We prioritize the security of your data and personal information.",
                  image: _buildImage('privacy_security_image.jpg'),
                  decoration: pageDecoration,
                ),
                PageViewModel(
                  title: "Ready to Get Started?",
                  body:
                      "Join Kazi Connect and take the next step towards finding employment.",
                  image: _buildImage('get_started_image.jpg'),
                  decoration: pageDecoration,
                ),
              ],
              onDone: () => _onIntroEnd(context),
              onSkip: () => _onIntroEnd(context),
              // You can override onSkip callback
              showSkipButton: true,
              skipOrBackFlex: 0,
              nextFlex: 0,
              showBackButton: false,
              //rtl: true, // Display as right-to-left
              back: const Icon(Icons.arrow_back),
              skip: const Text('Skip',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              next: const Icon(Icons.arrow_forward),
              done: const Text('Done',
                  style: TextStyle(fontWeight: FontWeight.w600)),
              curve: Curves.fastLinearToSlowEaseIn,
              controlsMargin: const EdgeInsets.all(16),
              controlsPadding: kIsWeb
                  ? const EdgeInsets.all(12.0)
                  : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
              dotsDecorator: const DotsDecorator(
                size: Size(10.0, 10.0),
                color: Color(0xFFBDBDBD),
                activeSize: Size(22.0, 10.0),
                activeShape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
              ),
              dotsContainerDecorator: const ShapeDecoration(
                color: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
              ),
            ),
          );
        });
  }
}
