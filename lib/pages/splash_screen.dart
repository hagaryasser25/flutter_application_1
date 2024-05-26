import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home_view.dart';
import 'package:flutter_application_1/pages/on_boarding_screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    AnimationController _controller;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Lottie.asset(
              'assets/images/logo.json',
              controller: controller,
              onLoaded: (composition) {
              controller
                ..duration = composition.duration
                ..forward().whenComplete(() => Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeView()),
                    ));
            },
              ),
          )
        ],
      ),
    );
  }
}
