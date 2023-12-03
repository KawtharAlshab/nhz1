import 'package:course2/flower-model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class HiveScreen extends StatefulWidget {
  const HiveScreen({super.key});

  @override
  State<HiveScreen> createState() => _HiveScreenState();
}

class _HiveScreenState extends State<HiveScreen> {
  @override
  Widget build(BuildContext context) {
    var flowerBox = Hive.box('Flower');
    flowerBox.put('name', 'kawthar');
    flowerBox.put('user2', FlowerModel(name: 'jpjp', color: 'dddd'));
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Center(child: Text(flowerBox.get('user2'
            '',).color.toString())),
      ),
    );
  }
}
