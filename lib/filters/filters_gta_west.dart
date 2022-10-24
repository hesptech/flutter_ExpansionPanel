import 'package:flutter/material.dart';

//import 'package:flutter_expansionpanel/helpers/shared_preferences.dart';
import 'package:flutter_expansionpanel/constants.dart';

class FiltersGtaWest extends StatefulWidget {
  const FiltersGtaWest({Key? key}) : super(key: key);

  @override
  State<FiltersGtaWest> createState() => _FiltersGtaWestState();
}

class _FiltersGtaWestState extends State<FiltersGtaWest> {

  late List<bool> _openCloseIcons;
  late List<PropertiesGtaWest> _propertiesGtaWest;
  late List<PropertiesGtaWestOther> _propertiesGtaWestOther;
  late List<String> _filtersGtaWest;

  //bool citySelectAllGtaWest = Preferences.filtersGtaWestLoggedOut.length == 4;
  bool citySelectAllGtaWest = false;

  @override
  void initState() {
    super.initState();

    _openCloseIcons = <bool>[
      false,
    ];

    _propertiesGtaWest = <PropertiesGtaWest>[
      const PropertiesGtaWest('Etobicoke'),
      const PropertiesGtaWest('Missisauga'),
      const PropertiesGtaWest('Brampton'),
      const PropertiesGtaWest('Oakville'),
      const PropertiesGtaWest('Milton'),
      const PropertiesGtaWest('Burlington'),
    ];
    _propertiesGtaWestOther = <PropertiesGtaWestOther>[
      const PropertiesGtaWestOther('Halton Hills'),
      const PropertiesGtaWestOther('Celedon'),
    ];
    _filtersGtaWest = [];
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
              const Text('GTA West', style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w500, ),),
              TextButton(
                onPressed: () {
                  setState(() {
                    _filtersGtaWest.clear();
                    if(citySelectAllGtaWest) {
                      citySelectAllGtaWest = false;
                    } else {
                      citySelectAllGtaWest = true;
                      for (var element in _propertiesGtaWest) {
                        _filtersGtaWest.add(element.name);
                      } 
                    }
                    //Preferences.filtersGtaWestLoggedOut = _filtersGtaWest;                      
                  });
                },
                child: Text( citySelectAllGtaWest ? 'Unselect all' : 'Select all', style: const TextStyle( fontSize: 14, fontWeight: FontWeight.w400, color: kSecondaryColor),),
              ),
            ],
          ),
        ),
        const SizedBox( height: 14.0, ),        
        Wrap(
          children: propertiesGtaWestWidgets.toList(),
        ),
        const SizedBox( height: 14.0, ),
        ExpansionTile(
          title: const Text('Other', style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w500, ),),
          trailing: Icon(
            _openCloseIcons[0] ? Icons.remove : Icons.add,
            color: kPrimaryColor,
            size: 18.0,
          ),
          children: [
            const SizedBox( height: 14.0,),
            Wrap(
              children: propertiesGtaWestOtherWidgets.toList(),
            ),            
          ], 
          onExpansionChanged: (bool expanded) {
            setState(() => _openCloseIcons[0] = expanded );
          },         
        )
        //Text('Prefs. filterRoomsLoggedOut: ${Preferences.filtersGtaWestLoggedOut}'),
        //Text('Prefs. filterRoomsLoggedIn: ${Preferences.filtersGtaWestLoggedIn}'),
      ],
    );    
  }

  Iterable<Widget> get propertiesGtaWestWidgets sync* {
    for (PropertiesGtaWest propertiesGtaWest in _propertiesGtaWest) {
      yield Padding(
        padding: const EdgeInsets.symmetric( horizontal: 5.0 ),
        child: ChoiceChip(
          label: Container(
            width: 160,
            alignment: Alignment.center,
            child: Text(propertiesGtaWest.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: _filtersGtaWest.contains(propertiesGtaWest.name) ? Colors.white : kPrimaryColor),),
          ),
          labelPadding: const EdgeInsets.all(0.0),
          backgroundColor: const Color(0xFFFFFFFF),
          selectedColor: kPrimaryColor,
          shape: const RoundedRectangleBorder(side: BorderSide(), borderRadius: BorderRadius.all(Radius.circular(8))),
          side: const BorderSide( color: kPrimaryColor ),
          selected: _filtersGtaWest.contains(propertiesGtaWest.name),
          onSelected: ( bool selected ) {
            setState(() {
                selected ? _filtersGtaWest.add(propertiesGtaWest.name) : _filtersGtaWest.removeWhere((String name) => name == propertiesGtaWest.name) ;
                //Preferences.filtersGtaWestLoggedOut = _filtersGtaWest;
            });            
          },
        )
      );
    }
  }

  Iterable<Widget> get propertiesGtaWestOtherWidgets sync* {
    for (PropertiesGtaWestOther propertiesGtaWestOther in _propertiesGtaWestOther) {
      yield Padding(
        padding: const EdgeInsets.symmetric( horizontal: 5.0, ),
        child: ChoiceChip(
          label: Container(
            width: 160,
            alignment: Alignment.center,
            child: Text(propertiesGtaWestOther.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: _filtersGtaWest.contains(propertiesGtaWestOther.name) ? Colors.white : kPrimaryColor),),
          ),
          labelPadding: const EdgeInsets.all(0.0),
          backgroundColor: const Color(0xFFFFFFFF),
          selectedColor: kPrimaryColor,
          shape: const RoundedRectangleBorder(side: BorderSide(), borderRadius: BorderRadius.all(Radius.circular(8))),
          side: const BorderSide( color: kPrimaryColor ),
          selected: _filtersGtaWest.contains(propertiesGtaWestOther.name),
          onSelected: ( bool selected ) {
            setState(() {
                selected ? _filtersGtaWest.add(propertiesGtaWestOther.name) : _filtersGtaWest.removeWhere((String name) => name == propertiesGtaWestOther.name) ;
                //Preferences.filtersGtaWestLoggedOut = _filtersGtaWest;
            });            
          },        
        ),
      );
    }
  }
}


class PropertiesGtaWest {
  const PropertiesGtaWest(this.name);
  final String name;
}

class PropertiesGtaWestOther {
  const PropertiesGtaWestOther(this.name);
  final String name;
}