import 'package:flutter/material.dart';

import 'package:flutter_expansionpanel/constants.dart';


class FiltersCityGtaCentral extends StatefulWidget {
  const FiltersCityGtaCentral({Key? key}) : super(key: key);

  @override
  State<FiltersCityGtaCentral> createState() => _FiltersCityGtaCentralState();
}

class _FiltersCityGtaCentralState extends State<FiltersCityGtaCentral> {

  late List<PropertiesCityGtaCentral> _propertiesCityGtaCentral;
  late List<String> _filtersCityGtaCentral;

  //bool citySelectAllGtaCentral = Preferences.filtersCityGtaCentralLoggedOut.length == 4;
  bool citySelectAllGtaCentral = false;


  @override
  void initState() {
    super.initState();
    _propertiesCityGtaCentral = <PropertiesCityGtaCentral>[
      const PropertiesCityGtaCentral('Downtown Toronto'),
      const PropertiesCityGtaCentral('Midtown Toronto'),
      const PropertiesCityGtaCentral('Leaside'),
      const PropertiesCityGtaCentral('Toronto New York'),
    ];
    _filtersCityGtaCentral = [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox( height: 1.0, ),
        Padding(
          padding: const EdgeInsets.fromLTRB(14.0, 0.0, 14.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              const Text('Toronto Central', style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w500, ),),
              TextButton(
                onPressed: () {
                  setState(() {
                    _filtersCityGtaCentral.clear();
                    if(citySelectAllGtaCentral) {
                      citySelectAllGtaCentral = false;
                    } else {
                      citySelectAllGtaCentral = true;
                      for (var element in _propertiesCityGtaCentral) {
                        _filtersCityGtaCentral.add(element.name);
                      } 
                    }
                    //Preferences.filtersCityGtaCentralLoggedOut = _filtersCityGtaCentral;                      
                  });
                },
                child: Text( citySelectAllGtaCentral ? 'Unselect all' : 'Select all', style: const TextStyle( fontSize: 14, fontWeight: FontWeight.w400, color: kSecondaryColor),),
              ),
            ],
          ),
        ),

        const SizedBox( height: 14.0, ),        
        Wrap(
          children: propertiesCityGtaCentralWidgets.toList(),
        ),
        //Text('Prefs. filterRoomsLoggedOut: ${Preferences.filtersCityGtaCentralLoggedOut}'),
        //Text('Prefs. filterRoomsLoggedIn: ${Preferences.filtersCityGtaCentralLoggedIn}'),
      ],
    );
  }


  Iterable<Widget> get propertiesCityGtaCentralWidgets sync* {
    for (PropertiesCityGtaCentral propertiesCityGtaCentral in _propertiesCityGtaCentral) {
      yield Padding(
        padding: const EdgeInsets.symmetric( horizontal: 5.0 ),
        child: ChoiceChip(
          label: Container(
            width: 150,
            alignment: Alignment.center,
            child: Text(propertiesCityGtaCentral.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: _filtersCityGtaCentral.contains(propertiesCityGtaCentral.name) ? Colors.white : kPrimaryColor),),
          ),
          labelPadding: const EdgeInsets.all(0.0),
          backgroundColor: const Color(0xFFFFFFFF),
          selectedColor: kPrimaryColor,
          shape: const RoundedRectangleBorder(side: BorderSide(), borderRadius: BorderRadius.all(Radius.circular(8))),
          side: const BorderSide( color: kPrimaryColor ),
          selected: _filtersCityGtaCentral.contains(propertiesCityGtaCentral.name),
          onSelected: ( bool selected ) {
            setState(() {
                selected ? _filtersCityGtaCentral.add(propertiesCityGtaCentral.name) : _filtersCityGtaCentral.removeWhere((String name) => name == propertiesCityGtaCentral.name) ;
                //Preferences.filtersCityGtaCentralLoggedOut = _filtersCityGtaCentral;
            });            
          },
        )
      );
    }
  }
}

class PropertiesCityGtaCentral {
  const PropertiesCityGtaCentral(this.name);
  final String name;
}
