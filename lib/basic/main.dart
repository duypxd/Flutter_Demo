import 'package:flutter/material.dart';
// import 'StatelessWidget.dart';
// import 'StatefulWidget.dart';
// import 'AddLibToFlutter.dart';
import 'LayoutWidget.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        accentColor: Colors.red,
        primaryColor: Colors.red,
      ),
      home: LayoutWidget(),
    ));
