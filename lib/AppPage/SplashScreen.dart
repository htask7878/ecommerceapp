import 'package:firebasepractice/Model.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Screen() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.pushReplacement(context, MaterialPageRoute(
      builder: (context) {
        return Home();
      },
    ));
  }

  @override
  void initState() {
    super.initState();
    Screen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ColoredBox(
        color: Model.orange,
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("image/baskets.png"),
              width: 120,
              color: Colors.white,
              height: 120,
            ),
            Text("SHOP",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                )),
          ],
        )),
      )),
    );
  }
}