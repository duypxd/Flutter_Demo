import 'dart:io';

class Car {
  late String name;
  late int yearOfProduction;

  // Case 1: Constructor
  // Car(String name, int yearOfProduction) {
  //   this.name = name;
  //   this.yearOfProduction = yearOfProduction;
  // }

  // Case 2: New way
  // Car(this.name, this.yearOfProduction);

  // Case 3:
  Car({required this.name, this.yearOfProduction = 2000});

  // case 4:

  @override
  String toString() {
    return '${this.name} - ${this.yearOfProduction}';
  }

  void doSomeThing() {
    print('I am do something....');
    // this.handleEvent();
  }

  void sayHello(String userName, [int? age = 26]) {
    print('Hello $userName - $age tuoi');
  }

  // Function handleEvent;
}
