import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:course2/expand.dart';
import 'package:course2/signin-cubit/signin-cubit.dart';
import 'package:course2/signin-cubit/signin-states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FirebaseScreen extends StatefulWidget {
  const FirebaseScreen({super.key});

  @override
  State<FirebaseScreen> createState() => _FirebaseScreenState();
}

class _FirebaseScreenState extends State<FirebaseScreen> {
  Future signin() async {
    print("start");
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'kawthar@g.com', password: '123456');
    print("end");
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(),
      child: BlocConsumer<SigninCubit, SigninStates>(
        listener: (context, state) {
          // TODO: implement listener
       // if(state is SigninSuccessfulState)
       //    AwesomeDialog(
       //        context: context,
       //        dialogType: DialogType.info,
       //        animType: AnimType.rightSlide,
       //        title: 'Dialog Title',
       //        desc: 'Dialog description here.............',
       //        btnCancelOnPress: () {},
       //    btnOkOnPress: () {},
       //    )..show;

        },
        builder: (context, state) {
          return   state is SigninLoadingState ?

        CircularProgressIndicator():
         Scaffold(
            body: Center(
              child: IconButton(
                icon: Icon(Icons.enhance_photo_translate, color: Colors.black,),
                onPressed: () {
                  SigninCubit.getSigninCubitobject(context).signin(context);
                  // signin().then((value) =>
                  //     Navigator.push(context, MaterialPageRoute(builder: (
                  //         context) {
                  //       return ExpandScreen(index: 1);
                  //     },)));
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
