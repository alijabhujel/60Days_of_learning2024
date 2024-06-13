// Freezed - to check the null error

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Freezed_Screen extends StatefulWidget {
  const Freezed_Screen({super.key});

  @override
  State<Freezed_Screen> createState() => _Freezed_ScreenState();
}

class _Freezed_ScreenState extends State<Freezed_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        PersonModel personModel = PersonModel(name: 'Alija');
        PersonModel personModel1 = PersonModel(name: 'Alija');

        print(personModel.name.toString());
        print(personModel1.name.toString());

        print(personModel = personModel1); // not equal hash code different
      }),
    );
  }
}

class PersonModel {
  String? name;
  PersonModel({this.name});

  // This method is used to compare if the model values are the same or not
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonModel &&
          runtimeType == other.runtimeType &&
          name == other.name;

  @override
  // TODO: implement hashCode
  int get hashCode => name.hashCode;
}
