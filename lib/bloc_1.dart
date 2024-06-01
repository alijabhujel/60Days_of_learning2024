import 'package:flutter/material.dart';

class Equitable_Test extends StatelessWidget {
  const Equitable_Test({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        Person person = Person(age: 20, name: 'Alija');
        Person person1 = Person(age: 20, name: 'Alija');
        print(person == person1);
      }),
    );
  }
}

class Person {
  final int age;
  final String name;

  Person({required this.age, required this.name});
  //  @override
  // List<Object> get props => [name, age];
}
