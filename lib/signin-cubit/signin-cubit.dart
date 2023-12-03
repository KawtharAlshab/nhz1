import 'package:bloc/bloc.dart';
import 'package:course2/signin-cubit/signin-states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninCubit extends Cubit<SigninStates>{
  SigninCubit():super(SigninInitState());
static SigninCubit getSigninCubitobject (context)=>BlocProvider.of(context);
  Future signin(BuildContext context) async{
    // showDialog(context: context, builder: (context) {
    //   emit(SigninLoadingState());
    //   return CircularProgressIndicator();
    // },);
    emit(SigninLoadingState());
      FirebaseAuth.instance.signInWithEmailAndPassword(email: 'kawthar@g.com',password: '123456').then((value) =>emit(SigninSuccessfulState())
      ).catchError((error){
        emit(SigninFauilerState());
      });
    // Navigator.pop(context);
  //  print("end");
  }


}