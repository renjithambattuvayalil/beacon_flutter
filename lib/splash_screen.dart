import 'dart:async';

import 'package:beacon_flutter_mobapp/language_selection_screen.dart';
import 'package:beacon_flutter_mobapp/utils/images.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //creating a delay of 5 seconds
    Timer(const Duration(seconds: 5), onClose);
  }

  void onClose() {
    if (mounted) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) {
        return const LanguageSelectionScreen();
      }));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12, //this is required to avoid white space
      body: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: double.infinity,
            child: Image.asset(Images.building, fit: BoxFit.fill),
          ),
          SizedBox(
            width: double.infinity,
            child: Image.asset(Images.curtain, fit: BoxFit.fill),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 150),
              Image.asset(Images.logo),
              const Text(
                'B E A C O N',
                style: TextStyle(fontSize: 40, color: Colors.white),
              ),
              const Spacer(),
              const Text(
                'By KANZ',
                style: TextStyle(color: Colors.white, fontSize: 15),
              ),
              const SizedBox(height: 10),
              const Text(
                'Copyright © 2022 All Rights Reserved',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ],
      ),
    );
  }
}
