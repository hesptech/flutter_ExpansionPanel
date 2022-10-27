import 'package:flutter/material.dart';

import 'package:flutter_expansionpanel/filters/filters.dart';
import 'package:flutter_expansionpanel/filters/filters_bathrooms.dart';
import 'package:flutter_expansionpanel/filters/filters_bedrooms.dart';
import 'package:flutter_expansionpanel/filters/filters_class_icons_bt.dart';
import 'package:flutter_expansionpanel/filters/filters_location.dart';
import 'package:flutter_expansionpanel/filters/filters_more.dart';
import 'package:flutter_expansionpanel/filters/filters_price_range.dart';
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
      debugShowCheckedModeBanner: false,
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
          FiltersPriceRange(),
          FiltersClassIconsBt(),
          SizedBox( height: 28.0,), 
          GreenDivider(),
          FiltersPropertyType(),
          GreenDivider(),
          FiltersLocation(),
          GreenDivider(),
          FiltersBedrooms(),
          FiltersBathrooms(),
          FiltersMore(),
          SizedBox( height: 14.0,),
          /* 
          // to work, delete const from children array + import constants
          BtChoiceChip(
            btText: 'bttext', btColor: kPrimaryColor, btBackgroundColor: Colors.white, btSelectedColor: kPrimaryColor, btSideBorderColor: kPrimaryColor, btSelected: false, 
            btOnSelected: (randomargument){},  
          ) */
        ],
      )      
    );
  }
}
