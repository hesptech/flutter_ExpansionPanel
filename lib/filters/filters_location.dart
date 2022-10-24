import 'package:flutter/material.dart';

//import 'package:b_w0/helpers/shared_preferences.dart';
import 'package:flutter_expansionpanel/constants.dart';
import 'package:flutter_expansionpanel/filters/filters_city_gta_central.dart';
import 'package:flutter_expansionpanel/filters/filters_city_gta_north.dart';
import 'package:flutter_expansionpanel/filters/filters_tr_west.dart';
import 'package:flutter_expansionpanel/filters/filters_gta_north.dart';
import 'package:flutter_expansionpanel/filters/filters_gta_east.dart';
import 'package:flutter_expansionpanel/filters/filters_gta_west.dart';


class FiltersLocation extends StatefulWidget {
  const FiltersLocation({Key? key}) : super(key: key);

  @override
  State<FiltersLocation> createState() => _FiltersLocationState();
}

class _FiltersLocationState extends State<FiltersLocation> {

  late List<bool> _openCloseIcons;
  late List<PropertiesToronto> _propertiesToronto;
  late List<String> _filtersPropertyToronto;

  late bool toronto;

  @override
  void initState() {
    super.initState();

    _openCloseIcons = <bool>[
      false,
      false,
      false,
      false,
    ];     

    _propertiesToronto = <PropertiesToronto>[
      const PropertiesToronto('CENTRAL'),
      const PropertiesToronto('EAST'),
      const PropertiesToronto('WEST'),
    ];

    _filtersPropertyToronto = [];
    toronto = false;
  }


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent), 
        child: Column(
          children: [
            ExpansionTile(
              tilePadding: const EdgeInsets.symmetric(horizontal: 24.0),
              childrenPadding: const EdgeInsets.symmetric(horizontal: 10.0),
              title: const Text('LOCATION', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kSecondaryColor),),
              trailing: Icon(
                _openCloseIcons[0] ? Icons.remove : Icons.add,
                color: kSecondaryColor,
              ),
              children: <Widget>[
                ExpansionTile(
                  title: const Text('TORONTO', style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w500, ),),
                  trailing: Icon(
                    _openCloseIcons[1] ? Icons.remove : Icons.add,
                    color: kPrimaryColor,
                    size: 18.0,
                  ),
                  children: const [
                    FiltersCityGtaCentral(),
                    SizedBox( height: 16.0,),
                    FiltersCityGtaNorth(),
                    SizedBox( height: 16.0,),
                    FiltersTrWest(),
                    SizedBox( height: 16.0,)
                  ],
                  onExpansionChanged: (bool expanded) {
                    setState(() => _openCloseIcons[1] = expanded );
                  },
                ),
                const Divider( 
                  thickness: 1.0, 
                  color: kPrimaryColor, 
                  indent: 12.0, 
                  endIndent: 12.0, 
                  height: 0,
                ),
                ExpansionTile(
                  title: const Text('SUBURBS AND CITY OUT SKIRTS', style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w500, ),),
                  trailing: Icon(
                    _openCloseIcons[2] ? Icons.remove : Icons.add,
                    color: kPrimaryColor,
                    size: 18.0,
                  ),
                  children: const [
                    FiltersGtaWest(),
                    SizedBox( height: 16.0,),
                    FiltersGtaNorth(),
                    SizedBox( height: 16.0,),
                    FiltersGtaEast(),
                  ],
                  onExpansionChanged: (bool expanded) {
                    print(expanded);
                    setState(() => _openCloseIcons[2] = expanded );
                  },
                ),                
              ],
              onExpansionChanged: (bool expanded) {
                print(expanded);
                setState(() => _openCloseIcons[0] = expanded );
                if (expanded == false) {
                  setState(() => _openCloseIcons[1] = false );
                  setState(() => _openCloseIcons[2] = false );
                }
              },
            )
          ],
      )
      ),
    );
  }
}


class PropertiesToronto {
  const PropertiesToronto(this.name);
  final String name;
}