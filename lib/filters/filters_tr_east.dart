import 'package:flutter/material.dart';
import 'package:flutter_expansionpanel/constants.dart';


class FiltersTrEast extends StatefulWidget {
  const FiltersTrEast({Key? key}) : super(key: key);

  @override
  State<FiltersTrEast> createState() => _FiltersTrEastState();
}

class _FiltersTrEastState extends State<FiltersTrEast> {

  late List<bool> _openCloseIcons;
  late List<PropertiesTrEast> _propertiesTrEast;
  late List<String> _filtersSearchTrEast;
  late List<String> _filtersSearchTrEastLoggedIn;

  bool citySelectAll = false;
  final isLoggedIn = false;


  @override
  void initState() {
    super.initState();

    _openCloseIcons = <bool>[
      false,
      false,
      false,
      false,
      false,
    ]; 

    _propertiesTrEast = <PropertiesTrEast>[
      const PropertiesTrEast('Danforth'),
      const PropertiesTrEast('Beaches'),
      const PropertiesTrEast('East York'),
      const PropertiesTrEast('Leslieville/Riverdale'),
      const PropertiesTrEast('Scarborough'),
    ];

    _filtersSearchTrEast = [];
    _filtersSearchTrEastLoggedIn = [];
  }

  @override
  Widget build(BuildContext context) {

    return 
      ExpansionTile(
        title: const Text('Toronto East', style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w500, ),),
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
                    _filtersSearchTrEast.clear() ;
                    if(citySelectAll) {
                      citySelectAll = false;
                    } else {
                      citySelectAll = true;
                      for (var element in _propertiesTrEast) {
                        _filtersSearchTrEast.add(element.name) ;
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
            children:  propertiesTrEastWidgets.toList(),
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
          padding: const EdgeInsets.fromLTRB(16.0, 0.0, 15.0, 0.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Toronto East', style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.w500, ),),
              TextButton(
                onPressed: () {
                  setState(() {
                    _filtersSearchTrEast.clear() ;
                    if(citySelectAll) {
                      citySelectAll = false;
                    } else {
                      citySelectAll = true;
                      for (var element in _propertiesTrEast) {
                        _filtersSearchTrEast.add(element.name) ;
                      }
                    }
                    //isLoggedIn ? Preferences.userFiltersTrEastLoggedIn = _filtersSearchTrEastLoggedIn : Preferences.userFiltersTrEast = _filtersSearchTrEast ;
                  });  
                }, 
                child: Text(citySelectAll ? 'Unselect all' : 'Select all', style: const TextStyle( fontSize: 14, fontWeight: FontWeight.w400, color: kSecondaryColor),),
              )
            ],
          ),
        ),
        const SizedBox( height: 14.0, ),  
        Wrap(
          children: propertiesTrEastWidgets.toList(),
        ),
        //Text('Prefs. notLoged city: ${Preferences.userFiltersTrEast}'),
        //Text('Prefs. notLoged city: ${_filtersSearchTrEast.join(', ')}'),
      ],
    ); */
  }

  Iterable<Widget> get propertiesTrEastWidgets sync* {
    for ( PropertiesTrEast propertiesTrEast in _propertiesTrEast) {
      yield Padding(
        padding: const EdgeInsets.symmetric( horizontal: 5.0, ),
        child: ChoiceChip(
          label: Container(
            width: 150,
            alignment: Alignment.center,
            child: Text(propertiesTrEast.name, style: TextStyle( fontSize: 16, fontWeight: FontWeight.w400, color: _filtersSearchTrEast.contains(propertiesTrEast.name) ? Colors.white : kPrimaryColor),),
          ),
          labelPadding: const EdgeInsets.all(0.0),
          backgroundColor: const Color(0xFFFFFFFF),
          selectedColor: kPrimaryColor,
          shape: const RoundedRectangleBorder(side: BorderSide(), borderRadius: BorderRadius.all(Radius.circular(8))),
          side: const BorderSide( color: kPrimaryColor ),
          selected: _filtersSearchTrEast.contains(propertiesTrEast.name),
          onSelected: ( bool selected ) {
            setState(() {
              if ( isLoggedIn ) {
                selected ? _filtersSearchTrEastLoggedIn.add(propertiesTrEast.name) : _filtersSearchTrEastLoggedIn.removeWhere((String name) => name == propertiesTrEast.name) ;
                //Preferences.userFiltersTrEastLoggedIn = _filtersSearchTrEastLoggedIn;
              } else {
                selected ? _filtersSearchTrEast.add(propertiesTrEast.name) : _filtersSearchTrEast.removeWhere((String name) => name == propertiesTrEast.name) ;
                //Preferences.userFiltersTrEast = _filtersSearchTrEast;
              }
            });
          },
        ),
      );
    }
  }
}


class PropertiesTrEast {
  const PropertiesTrEast(this.name);
  final String name;
}