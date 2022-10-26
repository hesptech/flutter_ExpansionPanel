import 'package:flutter/material.dart';
import 'package:flutter_expansionpanel/constants.dart';


class FiltersCityGtaNorth extends StatefulWidget {
  const FiltersCityGtaNorth({Key? key}) : super(key: key);

  @override
  State<FiltersCityGtaNorth> createState() => _FiltersCityGtaNorthState();
}

class _FiltersCityGtaNorthState extends State<FiltersCityGtaNorth> {

  late List<PropertiesCityGtaNorth> _propertiesCityGtaNorth;
  late List<String> _filtersSearchCityGtaNorth;
  late List<String> _filtersSearchCityGtaNorthLoggedIn;
  bool citySelectAllGtaNorth = true;
  final isLoggedIn = false;


  @override
  void initState() {
    super.initState();

    _propertiesCityGtaNorth = <PropertiesCityGtaNorth>[
      const PropertiesCityGtaNorth('Danforth'),
      const PropertiesCityGtaNorth('Beaches'),
      const PropertiesCityGtaNorth('East York'),
      const PropertiesCityGtaNorth('Leslieville/Riverdale'),
      const PropertiesCityGtaNorth('Scarborough'),
    ];

    _filtersSearchCityGtaNorth = [];
    _filtersSearchCityGtaNorthLoggedIn = [];
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox( height: 1.0, ),
        const Divider( 
          thickness: 1.0, 
          color: kPrimaryColor, 
          indent: 12.0, 
          endIndent: 12.0, 
          height: 0,
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 15.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Toronto East', style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w500, ),),
              TextButton(
                onPressed: () {
                  setState(() {
                    isLoggedIn ? _filtersSearchCityGtaNorthLoggedIn.clear() : _filtersSearchCityGtaNorth.clear() ;
                    if(citySelectAllGtaNorth) {
                      citySelectAllGtaNorth = false;
                    } else {
                      citySelectAllGtaNorth = true;
                      for (var element in _propertiesCityGtaNorth) {
                        isLoggedIn ? _filtersSearchCityGtaNorthLoggedIn.add(element.name) : _filtersSearchCityGtaNorth.add(element.name) ;
                      }
                    }
                    //isLoggedIn ? Preferences.userFiltersCityGtaNorthLoggedIn = _filtersSearchCityGtaNorthLoggedIn : Preferences.userFiltersCityGtaNorth = _filtersSearchCityGtaNorth ;
                  });  
                }, 
                child: Text(citySelectAllGtaNorth ? 'Select all' : 'Select all', style: const TextStyle( fontSize: 14, fontWeight: FontWeight.w400, color: kSecondaryColor),),
              )
            ],
          ),
        ),
        const SizedBox( height: 14.0, ),  
        Wrap(
          children: propertiesCityGtaNorthWidgets.toList(),
        ),
        //Text('Prefs. notLoged city: ${Preferences.userFiltersCityGtaNorth}'),
        //Text('Prefs. notLoged city: ${_filtersSearchCityGtaNorth.join(', ')}'),
      ],
    );
  }

  Iterable<Widget> get propertiesCityGtaNorthWidgets sync* {
    for ( PropertiesCityGtaNorth propertiesCityGtaNorth in _propertiesCityGtaNorth) {
      yield Padding(
        padding: const EdgeInsets.symmetric( horizontal: 5.0, ),
        child: ChoiceChip(
          label: Container(
            width: 150,
            alignment: Alignment.center,
            child: Text(propertiesCityGtaNorth.name, style: const TextStyle( fontSize: 16, fontWeight: FontWeight.w400, color: kPrimaryColor, ), ),
          ),
          labelPadding: const EdgeInsets.all(0.0),
          backgroundColor: const Color(0xFFFFFFFF),
          selectedColor: kSecondaryColor,
          shape: const RoundedRectangleBorder(side: BorderSide(), borderRadius: BorderRadius.all(Radius.circular(8))),
          side: const BorderSide( color: kPrimaryColor ),
          selected: isLoggedIn ? _filtersSearchCityGtaNorthLoggedIn.contains(propertiesCityGtaNorth.name) : _filtersSearchCityGtaNorth.contains(propertiesCityGtaNorth.name),
          onSelected: ( bool selected ) {
            setState(() {
              if ( isLoggedIn ) {
                selected ? _filtersSearchCityGtaNorthLoggedIn.add(propertiesCityGtaNorth.name) : _filtersSearchCityGtaNorthLoggedIn.removeWhere((String name) => name == propertiesCityGtaNorth.name) ;
                //Preferences.userFiltersCityGtaNorthLoggedIn = _filtersSearchCityGtaNorthLoggedIn;
              } else {
                selected ? _filtersSearchCityGtaNorth.add(propertiesCityGtaNorth.name) : _filtersSearchCityGtaNorth.removeWhere((String name) => name == propertiesCityGtaNorth.name) ;
                //Preferences.userFiltersCityGtaNorth = _filtersSearchCityGtaNorth;
              }
            });
          },
        ),
      );
    }
  }
}


class PropertiesCityGtaNorth {
  const PropertiesCityGtaNorth(this.name);
  final String name;
}