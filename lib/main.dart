import 'package:flutter/material.dart';
import 'package:flutter_expansionpanel/filters/filters.dart';
import 'package:flutter_expansionpanel/filters/filters_location.dart';
import 'package:flutter_expansionpanel/widgets_formatting.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: FiltersScreen()), 
    );
  }
}


class FiltersScreen extends StatelessWidget {
  const FiltersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: const <Widget>[
          SizedBox( height: 28.0,),
          GreenDivider(),
          FiltersPropertyType(),
          GreenDivider(),
          FiltersLocation(),
          GreenDivider(),
          SizedBox( height: 14.0,),
        ],
      )      
    );
  }
}
