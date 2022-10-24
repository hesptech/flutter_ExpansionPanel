import 'package:flutter/material.dart';

//import 'package:b_w0/helpers/shared_preferences.dart';
import 'package:flutter_expansionpanel/constants.dart';


class FiltersTrWest extends StatefulWidget {
  const FiltersTrWest({Key? key}) : super(key: key);

  @override
  State<FiltersTrWest> createState() => _FiltersTrWestState();
}

class _FiltersTrWestState extends State<FiltersTrWest> {

  late List<PropertiesTrWest> _propertiesTrWest;
  late List<String> _filtersTrWest;

  //bool citySelectAllTrWest = Preferences.filtersTrWestLoggedOut.length == 4;
  bool citySelectAllTrWest = false;

  @override
  void initState() {
    super.initState();
    
    _propertiesTrWest = <PropertiesTrWest>[
      const PropertiesTrWest('High Park and around'),
      const PropertiesTrWest('Junction Park and around'),
      const PropertiesTrWest('Etobicoke'),
      const PropertiesTrWest('Mimico'),
      const PropertiesTrWest('Other'),
    ];
    _filtersTrWest = [];
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
        //const SizedBox( height: 14.0, ),
        Padding(
          padding: const EdgeInsets.fromLTRB(14.0, 0.0, 14.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              const Text('Toronto West', style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w500, ),),
              TextButton(
                onPressed: () {
                  setState(() {
                    _filtersTrWest.clear();
                    if(citySelectAllTrWest) {
                      citySelectAllTrWest = false;
                    } else {
                      citySelectAllTrWest = true;
                      for (var element in _propertiesTrWest) {
                        _filtersTrWest.add(element.name);
                      } 
                    }
                    //Preferences.filtersTrWestLoggedOut = _filtersTrWest;                      
                  });
                },
                child: Text( citySelectAllTrWest ? 'Unselect all' : 'Select all', style: const TextStyle( fontSize: 14, fontWeight: FontWeight.w400, color: kSecondaryColor),),
              ),
            ],
          ),
        ),
        const SizedBox( height: 14.0, ),        
        Wrap(
          children: propertiesTrWestWidgets.toList(),
        ),
        //Text('Prefs. filterRoomsLoggedOut: ${Preferences.filtersTrWestLoggedOut}'),
        //Text('Prefs. filterRoomsLoggedIn: ${Preferences.filtersTrWestLoggedIn}'),
      ],
    );    
  }

  Iterable<Widget> get propertiesTrWestWidgets sync* {
    for (PropertiesTrWest propertiesTrWest in _propertiesTrWest) {
      yield Padding(
        padding: const EdgeInsets.symmetric( horizontal: 5.0 ),
        child: ChoiceChip(
          label: Container(
            width: 160,
            alignment: Alignment.center,
            child: Text(propertiesTrWest.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: _filtersTrWest.contains(propertiesTrWest.name) ? Colors.white : kPrimaryColor),),
          ),
          labelPadding: const EdgeInsets.all(0.0),
          backgroundColor: const Color(0xFFFFFFFF),
          selectedColor: kPrimaryColor,
          shape: const RoundedRectangleBorder(side: BorderSide(), borderRadius: BorderRadius.all(Radius.circular(8))),
          side: const BorderSide( color: kPrimaryColor ),
          selected: _filtersTrWest.contains(propertiesTrWest.name),
          onSelected: ( bool selected ) {
            setState(() {
                selected ? _filtersTrWest.add(propertiesTrWest.name) : _filtersTrWest.removeWhere((String name) => name == propertiesTrWest.name) ;
                //Preferences.filtersTrWestLoggedOut = _filtersTrWest;
            });            
          },
        )
      );
    }
  }
}

class PropertiesTrWest {
  const PropertiesTrWest(this.name);
  final String name;
}