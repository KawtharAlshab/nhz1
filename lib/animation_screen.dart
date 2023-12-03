import 'dart:developer';

import 'package:flutter/material.dart';

class AnimationScreen extends StatefulWidget {
  const AnimationScreen({super.key});

  @override
  State<AnimationScreen> createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen> {
double width= 200 ;

Color color = Colors.red ;

double opacity = 1 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedContainer(
        duration: Duration(seconds: 1),
        width: width,
        color: color,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {
              setState(() {
                log((width==300).toString());
                width==200?width =300:width=200;
                // width = 300;

                // width = 300 ;
              });
            }, child: Text(
              'change width'
            )),
            ElevatedButton(onPressed: () {
              setState(() {
               color=Colors.amber ;
              });
            }, child: Text(
                'change color'
            )),    ElevatedButton(onPressed: () {
              setState(() {
                opacity = 0;
              });
            }, child: Text(
                'change opacity'
            )),
            AnimatedOpacity(
              duration: Duration(seconds: 3),
              opacity: opacity,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.amber,
              ),
            )

          ],
        ),
      ),
    );
  }
}
