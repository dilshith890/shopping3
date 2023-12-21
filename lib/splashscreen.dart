import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shopping3/login.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 2));
    _animationController.forward();
    Timer(Duration(seconds: 3), () {

    });
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (context) => login()));
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScopeNode currentfocus = FocusScope.of(context);
        if(!currentfocus.hasPrimaryFocus && currentfocus.focusedChild != null );
        currentfocus.focusedChild?.unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ScaleTransition(
                  scale: Tween<double>(begin: 0,end: 1).animate(
                    CurvedAnimation(parent: _animationController,curve: Curves.easeOut),

                  ),
                  child: Image.asset('lib/image/splashscreen.png')
              )

            ],
          ),
        ),
        bottomNavigationBar:SizedBox(height: 40, child: Text('POWERED BY M10',
            textAlign:TextAlign.center,
            style: TextStyle(color: Colors.red,fontStyle:FontStyle.italic )),),



      ),
    );
  }
}
