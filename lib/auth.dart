import 'package:course2/expand.dart';
import 'package:course2/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.userChanges(),
        builder: (context, snapshot) {
       if   ( snapshot.hasData )
              return ExpandScreen(index: 4);
          else return  MyHomePage();
        },
      ),
    );
  }
}
