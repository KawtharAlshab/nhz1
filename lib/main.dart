import 'package:course2/animation_screen.dart';
import 'package:course2/auth.dart';
import 'package:course2/listScreen.dart';
import 'package:course2/post-screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'expand.dart';
import 'firebaseScreen.dart';
import 'flower-model.dart';
import 'hive-screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Hive.initFlutter();
  await Hive.openBox('Flower');
   Hive.registerAdapter(FlowerModelAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,

      home: PostScreen(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Color iconColor = Colors.black;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  Future signin() async {
    print("start");
    showDialog(
      context: context,
      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: 'kawthar@g.com', password: '123456');
    Navigator.pop(context);
    print("end");
  }
  Future signup() async {
    print("start");
    showDialog(
      context: context,

      builder: (context) {
        return Center(child: CircularProgressIndicator());
      },
    );
    await FirebaseAuth.instance.createUserWithEmailAndPassword(email: 'Alshab@g.com', password: '123456');
    Navigator.pop(context);
    print("end");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        // color: Colors.pink,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Spacer(),
              Focus(
                onFocusChange: (hasFocus) {
                  if (hasFocus) {
                    iconColor = Colors.red;
                  } else {
                    iconColor = Colors.grey;
                  }
                  setState(() {});
                },
                child: TextFormField(
                  //   autovalidateMode:AutovalidateMode.onUserInteraction ,
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter username';
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "eman",
                    label: Text(
                      'UserName',
                      style: TextStyle(
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.w600),
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: iconColor,
                    ),
                    enabled: true,

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(
                            color: Colors.cyan,
                            style: BorderStyle.none,
                            width: 12)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Colors.black, width: 2)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide(color: Colors.green, width: 4)),
                    // contentPadding: EdgeInsets.all(5)
                  ),
                  keyboardType: TextInputType.text,
                  maxLength: 6,
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "****",
                  label: Text(
                    'Password',
                    style: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  prefixIcon: Icon(Icons.lock),
                  enabled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(
                          color: Colors.cyan,
                          style: BorderStyle.none,
                          width: 12)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.black, width: 2)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                      borderSide: BorderSide(color: Colors.green, width: 4)),

                  // contentPadding: EdgeInsets.all(5)
                ),
                keyboardType: TextInputType.visiblePassword,
                maxLength: 10,
              ),

//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: ClipRRect(
//                 borderRadius: BorderRadius.circular(25),
//                 child: Image.network(fit: BoxFit.cover,'https://images.pexels.com/photos/1408221/pexels-photo-1408221.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1')),
//           ),
//
//        Text("kawthar")

              // Spacer(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.cyan,
                            foregroundColor: Colors.black,
                            minimumSize: Size(100, 70),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25))),
                        onPressed: () {
                          // setState(() {
                          //
                          // });
                          formKey.currentState!.validate();
                          signin().then((value) {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return ExpandScreen(
                                  index: 1,
                                );
                              },
                            ));
                          });
                        },
                        child: Text('LogIn')),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.cyan,
                            foregroundColor: Colors.black,
                            minimumSize: Size(100, 70),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25))),
                        onPressed: () {
                          // setState(() {
                          //
                          // });
                          // formKey.currentState!.validate();
                          signup().then((value) {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return ExpandScreen(
                                  index: 1,
                                );
                              },
                            ));
                          });
                        },
                        child: Text('signup')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
