import 'package:flutter/material.dart';
import 'package:mvvm_flutter_example/ui/screen/color_changer_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ColorChangerView(),
    );
  }
}
