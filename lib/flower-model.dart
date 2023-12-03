import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'flower-model.g.dart';
@HiveType(typeId: 1)
class FlowerModel{
  @HiveField(1)
  String name ;
  @HiveField(2)
  String color ;

  FlowerModel({required this.name,required this.color});
}