import 'package:flutter/material.dart';
import 'package:flutter_expansionpanel/constants.dart';

import 'package:flutter_expansionpanel/filters/filters.dart';
import 'package:flutter_expansionpanel/filters/filters_bathrooms.dart';
import 'package:flutter_expansionpanel/filters/filters_bedrooms.dart';
import 'package:flutter_expansionpanel/filters/filters_bottom_bar.dart';
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
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: const MyHomePage(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: kPrimaryColor,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
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
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: const Text('Personalize Listing'),
      ),
      body: const SafeArea(child: FiltersScreen()), 
      bottomNavigationBar: const FiltersBottomBar(),
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
        children: <Widget>[
          Container(
            height: 5,
            color: kSecondaryColor,
          ),
          //const SizedBox( height: 14.0,),
          const FiltersPriceRange(),
          const FiltersClassIconsBt(),
          const SizedBox( height: 28.0,), 
          const GreenDivider(),
          const FiltersPropertyType(),
          const GreenDivider(),
          const FiltersLocation(),
          const GreenDivider(),
          const FiltersBedrooms(),
          const FiltersBathrooms(),
          const FiltersMore(),
          const SizedBox( height: 14.0,),
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
