import 'package:flutter/material.dart';

class ImageScreen extends StatelessWidget {
  final  String index ;
  const ImageScreen({super.key,required this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
       // height: 400,
        color: Colors.amber,
        child: Column(
          children: [
            Container(
              color: Colors.red,
              child: Hero(
                  tag:'assets/$index.jpg' ,
                  child: Image.asset('assets/$index.jpg',
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
