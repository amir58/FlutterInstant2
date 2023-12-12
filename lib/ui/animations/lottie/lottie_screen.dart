import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieScreen extends StatefulWidget {
  const LottieScreen({super.key});

  @override
  State<LottieScreen> createState() => _LottieScreenState();
}

class _LottieScreenState extends State<LottieScreen>
    with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 1500,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lottie'),
      ),
      body: ListView(
        children: [
          // Load a Lottie file from your assets
          GestureDetector(
            onTap: () {
              // _controller.forward();
              _controller.animateTo(1);
              print('forward');
            },
            child: Center(
              child: Lottie.asset(
                'assets/animations/logo.json',
                controller: _controller,
                repeat: false,
                // onLoaded: (composition) {
                //   _controller.duration = composition.duration;
                // },
              ),
            ),
          ),

          // Load a Lottie file from a remote url
          Lottie.network(
            'https://raw.githubusercontent.com/xvrh/lottie-flutter/master/example/assets/Mobilo/A.json',
            // repeat: true,
            // reverse: true,
          ),

          // Load an animation and its images from a zip file
          // Lottie.asset('assets/lottiefiles/angel.zip'),
        ],
      ),
    );
  }
}
