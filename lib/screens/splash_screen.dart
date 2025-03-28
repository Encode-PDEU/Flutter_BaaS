import 'package:flutter/material.dart';
import 'package:notes/screens/home_screen.dart';
import 'package:quickanimate/quickanimate.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(milliseconds: 1500),
      () {
        Navigator.pushReplacement(
          context,
          PageTransitionAnimation(
              page: const SlideAnimation(
                intervalBegin: 0.5,
                beginOffset: Offset(-0.2, 0),
                duration: Duration(milliseconds: 1200),
                child: HomeScreen()
              ),
              mode: PageTransitionMode.slide,
              beginOffset: const Offset(1, 0),
              endOffset: const Offset(-0.2, 0),
              duration: const Duration(milliseconds: 900),
              curve: Curves.easeInOutCubic
            )
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xff1E1E1E),
      body: Center(
        child: ScaleAnimation(
          duration: Duration(milliseconds: 1500),
          curve: Curves.fastLinearToSlowEaseIn,
          child: Image(
            image: AssetImage("assets/images/logo.png"),
          ),
        ),
      ),
    );
  }
}