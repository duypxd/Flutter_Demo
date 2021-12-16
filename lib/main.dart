import 'package:flutter/material.dart';
import 'calculation.dart';
import 'cart.dart';

void main() {
  // for(int i = 0; i < numbers.length; i++) {
  //   print(numbers[i]);
  // }

  // numbers.forEach((number) {
  //   print(number);
  // });

  var myCar = Car(name: 'Mua xe Mercedes', yearOfProduction: 2022);
  myCar.doSomeThing();

  myCar.sayHello('DuyPham', 25);

  // myCar.handleEvent = () {
  //   print('chua chay dc');
  // };

  List<Car> cars = <Car>[
    Car(name: 'Xe 0', yearOfProduction: 1000),
    Car(name: 'Xe 1', yearOfProduction: 1999),
    Car(name: 'xe 2', yearOfProduction: 2000),
    Car(name: 'xe 4', yearOfProduction: 3000),
  ];
  ;
  cars.add(Car(name: 'Xe 3', yearOfProduction: 2001));
  // cars.sort((car1, car2) => car1.yearOfProduction - car2.yearOfProduction);
  cars.sort((car1, car2) => car1.name.compareTo(car2.name));
  cars[1].yearOfProduction = 2222;

  cars = cars
      .where((car) => car.yearOfProduction > 1000 && car.name.toLowerCase().contains('xe'))
      .toList();

  cars = cars.where((car) => car.yearOfProduction != 3000).toList();


  // Map
  Map<String, dynamic> personA = Map();
  personA['name'] = 'DuyPham';
  personA['age'] = 26;
  print(personA);

  Map<double, double> point = Map();
  point[1] = 1;
  point[2.0] = 3.2;
  print(point);

  runApp(Center(
      child: Text(
    '${cars.toString()}',
    textDirection: TextDirection.ltr,
    style: TextStyle(fontSize: 20),
  )));
}
