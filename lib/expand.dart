import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ExpandScreen extends StatefulWidget {
  final int index ;

  const ExpandScreen({super.key,required this.index});

  @override
  State<ExpandScreen> createState() => _ExpandScreenState();
}

class _ExpandScreenState extends State<ExpandScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Container(
       width: MediaQuery.of(context).size.width,
       child: Column(
         children: [
           Expanded(
             child: Container(
               color: Colors.amber,
               // width: 200,
               // height: 100,
             ),
           ),
           Text(FirebaseAuth.instance.currentUser!.email.toString()),
           Expanded(
             child: Container(
               color: Colors.red,
               // width: 400,
               // height: 200,
             ),
           )
         ],
       ),
     ),

    );
  }
}
