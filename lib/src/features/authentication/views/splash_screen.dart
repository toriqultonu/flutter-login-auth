import 'package:flutter/material.dart';
import 'package:flutter_auth_app/src/constants/colors.dart';
import 'package:flutter_auth_app/src/features/authentication/views/welcome_screen.dart';

import '../../../constants/image_string.dart';
import '../../../constants/size.dart';
import '../../../constants/text_string.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  bool animate = false;

  @override
  void initState() {
    startAnimation ();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        AnimatedPositioned(
          duration: const Duration(milliseconds: 1600),
          top: animate ? 0: -30,
          left: animate ? 0: -30,
          child: Image(image: AssetImage(tSplashTopIcon)),
        ), // Positioned
        AnimatedPositioned(
          duration: const Duration(milliseconds: 1600),
          top: animate ? 0: -30,
          left: animate ? 0: -30,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              tAppName,
              style: Theme.of(context).textTheme.headline3,
            ),
            Text(
              tAppTagLine,
              style: Theme.of(context).textTheme.headline2,
            )
          ]), // Column ), // Positioned
        ),
        Positioned(
          bottom: 100,
          child: Image(image: AssetImage(tsplashImage)),
        ), //
        Positioned(
            bottom: 40,
            right: tDefaultSize,
            child: Container(
              width: tSplashContainerSize,
              height: tSplashContainerSize,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: tPrimaryColor,
              ),
            )) // BoxDecoration ), // Container ), // Positioned
      ]),
    );
  }

  Future startAnimation () async {
    await Future.delayed(Duration (milliseconds: 500));
    setState (() => animate = true);
    await Future.delayed (Duration (milliseconds: 5000));
    Navigator.pushReplacement ( context, MaterialPageRoute(builder: (context) => WelcomeScreen())); }

}
