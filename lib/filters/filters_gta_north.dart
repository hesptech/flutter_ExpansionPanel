import 'package:flutter/material.dart';

//import 'package:b_w0/helpers/shared_preferences.dart';
import 'package:flutter_expansionpanel/constants.dart';

class FiltersGtaNorth extends StatefulWidget {
  const FiltersGtaNorth({Key? key}) : super(key: key);

  @override
  State<FiltersGtaNorth> createState() => _FiltersGtaNorthState();
}

class _FiltersGtaNorthState extends State<FiltersGtaNorth> {

  late List<bool> _openCloseIcons;
  late List<PropertiesGtaNorth> _propertiesGtaNorth;
  late List<PropertiesGtaNorthOther> _propertiesGtaNorthOther;
  late List<String> _filtersGtaNorth;

  //bool citySelectAllGtaNorth = Preferences.filtersGtaNorthLoggedOut.length == 4;
  bool citySelectAll = false;

  @override
  void initState() {
    super.initState();

    _openCloseIcons = <bool>[
      false,
    ];
    
    _propertiesGtaNorth = <PropertiesGtaNorth>[
      const PropertiesGtaNorth('Vaughan'),
      const PropertiesGtaNorth('Markham'),
      const PropertiesGtaNorth('Richmond Hill'),
    ];
    _propertiesGtaNorthOther = <PropertiesGtaNorthOther>[
      const PropertiesGtaNorthOther('Newmarket'),
      const PropertiesGtaNorthOther('Aurora'),
      const PropertiesGtaNorthOther('King City'),
      const PropertiesGtaNorthOther('Whitchurch/Stouffville'),
      const PropertiesGtaNorthOther('Georgina'),
      const PropertiesGtaNorthOther('East Gwillingbury'),
    ];
    _filtersGtaNorth = [];
  }

  @override
  Widget build(BuildContext context) {

    return 
      ExpansionTile(
        title: const Text('GTA North', style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w500, ),),
        trailing: Icon(
          _openCloseIcons[0] ? Icons.remove : Icons.add,
          color: kPrimaryColor,
          size: 18.0,
        ),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  setState(() {
                    _filtersGtaNorth.clear() ;
                    if(citySelectAll) {
                      citySelectAll = false;
                    } else {
                      citySelectAll = true;
                      for (var element in _propertiesGtaNorth) {
                        _filtersGtaNorth.add(element.name) ;
                      }
                    }
                    //isLoggedIn ? Preferences.userFiltersTrEastLoggedIn = _filtersSearchTrEastLoggedIn : Preferences.userFiltersTrEast = _filtersSearchTrEast ;
                  });  
                }, 
                style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  minimumSize: const Size( 50.0, 30.0 ),
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  //alignment: Alignment.centerLeft
                ),
                child: Text(citySelectAll ? 'Unselect all' : 'Select all', style: const TextStyle( fontSize: 14, fontWeight: FontWeight.w400, color: kSecondaryColor),),
              ),
              const SizedBox( width: 28.0),
            ],
          ),
          Wrap(
            children: propertiesGtaNorthWidgets.toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: const [
              SizedBox( width: 16.0, height: 42.0,),
              Text('Other', style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w500, ), textAlign: TextAlign.start, ),
            ],
          ),
          Wrap(
            children: propertiesGtaNorthOtherWidgets.toList(),
          ),
          const SizedBox( height: 16.0,),
        ],
        onExpansionChanged: (bool expanded) {
          setState(() => _openCloseIcons[0] = expanded );
        },
      );



    /* return Column(
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
          padding: const EdgeInsets.fromLTRB(14.0, 0.0, 14.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children:  [
              const Text('GTA North', style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w500, ),),
              TextButton(
                onPressed: () {
                  setState(() {
                    _filtersGtaNorth.clear();
                    if(citySelectAllGtaNorth) {
                      citySelectAllGtaNorth = false;
                    } else {
                      citySelectAllGtaNorth = true;
                      for (var element in _propertiesGtaNorth) {
                        _filtersGtaNorth.add(element.name);
                      } 
                    }
                    //Preferences.filtersGtaNorthLoggedOut = _filtersGtaNorth;                      
                  });
                },
                child: Text( citySelectAllGtaNorth ? 'Unselect all' : 'Select all', style: const TextStyle( fontSize: 14, fontWeight: FontWeight.w400, color: kSecondaryColor),),
              ),
            ],
          ),
        ),
        const SizedBox( height: 14.0, ),        
        Wrap(
          children: propertiesGtaNorthWidgets.toList(),
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
              children: propertiesGtaNorthOtherWidgets.toList(),
            ),            
          ], 
          onExpansionChanged: (bool expanded) {
            setState(() => _openCloseIcons[0] = expanded );
          },         
        )
        //Text('Prefs. filterRoomsLoggedOut: ${Preferences.filtersGtaNorthLoggedOut}'),
        //Text('Prefs. filterRoomsLoggedIn: ${Preferences.filtersGtaNorthLoggedIn}'),
      ],
    ); */    
  }

  Iterable<Widget> get propertiesGtaNorthWidgets sync* {
    for (PropertiesGtaNorth propertiesGtaNorth in _propertiesGtaNorth) {
      yield Padding(
        padding: const EdgeInsets.symmetric( horizontal: 5.0 ),
        child: ChoiceChip(
          label: Container(
            width: 150,
            alignment: Alignment.center,
            child: Text(propertiesGtaNorth.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: _filtersGtaNorth.contains(propertiesGtaNorth.name) ? Colors.white : kPrimaryColor),),
          ),
          labelPadding: const EdgeInsets.all(0.0),
          backgroundColor: const Color(0xFFFFFFFF),
          selectedColor: kPrimaryColor,
          shape: const RoundedRectangleBorder(side: BorderSide(), borderRadius: BorderRadius.all(Radius.circular(8))),
          side: const BorderSide( color: kPrimaryColor ),
          selected: _filtersGtaNorth.contains(propertiesGtaNorth.name),
          onSelected: ( bool selected ) {
            setState(() {
                selected ? _filtersGtaNorth.add(propertiesGtaNorth.name) : _filtersGtaNorth.removeWhere((String name) => name == propertiesGtaNorth.name) ;
                //Preferences.filtersGtaNorthLoggedOut = _filtersGtaNorth;
            });            
          },
        )
      );
    }
  }

  Iterable<Widget> get propertiesGtaNorthOtherWidgets sync* {
    for (PropertiesGtaNorthOther propertiesGtaWestOther in _propertiesGtaNorthOther) {
      yield Padding(
        padding: const EdgeInsets.symmetric( horizontal: 5.0, ),
        child: ChoiceChip(
          label: Container(
            width: 150,
            alignment: Alignment.center,
            child: Text(propertiesGtaWestOther.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: _filtersGtaNorth.contains(propertiesGtaWestOther.name) ? Colors.white : kPrimaryColor),),
          ),
          labelPadding: const EdgeInsets.all(0.0),
          backgroundColor: const Color(0xFFFFFFFF),
          selectedColor: kPrimaryColor,
          shape: const RoundedRectangleBorder(side: BorderSide(), borderRadius: BorderRadius.all(Radius.circular(8))),
          side: const BorderSide( color: kPrimaryColor ),
          selected: _filtersGtaNorth.contains(propertiesGtaWestOther.name),
          onSelected: ( bool selected ) {
            setState(() {
                selected ? _filtersGtaNorth.add(propertiesGtaWestOther.name) : _filtersGtaNorth.removeWhere((String name) => name == propertiesGtaWestOther.name) ;
                //Preferences.filtersGtaWestLoggedOut = _filtersGtaWest;
            });            
          },        
        ),
      );
    }
  }
}


class PropertiesGtaNorth {
  const PropertiesGtaNorth(this.name);
  final String name;
}

class PropertiesGtaNorthOther {
  const PropertiesGtaNorthOther(this.name);
  final String name;
}