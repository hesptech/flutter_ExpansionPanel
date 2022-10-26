import '../constants.dart';
import 'package:flutter/material.dart';


class FiltersKitchens extends StatefulWidget {
  const FiltersKitchens({Key? key}) : super(key: key);

  @override
  State<FiltersKitchens> createState() => _FiltersKitchensState();
}

class _FiltersKitchensState extends State<FiltersKitchens> {

  late List<PropertiesKitchens> _propertiesKitchens;
  late List<String> _filtersSearchKitchens;
  late int _defaultChoiceIndex;

  @override
  void initState() {
    super.initState();

    _propertiesKitchens = <PropertiesKitchens>[
      const PropertiesKitchens('1+'),
      const PropertiesKitchens('2+'),
      const PropertiesKitchens('3+'),
      const PropertiesKitchens('4+'),
      const PropertiesKitchens('5+'),
    ];
    _filtersSearchKitchens = [];
    _defaultChoiceIndex = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB( 14.0, 0, 14.0, 28.0 ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('KITCHENS', style: TextStyle(fontSize: 18, color: kPrimaryColor),),
            ],
          ),
          //const Text('BATHROOMS', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: kSecondaryColor),),
          Wrap(
            children: propertiesKitchensWidgets.toList(),
          ),
        ],
      ),
    );
  }

  Iterable<Widget> get propertiesKitchensWidgets sync* {
    for (PropertiesKitchens propertiesKitchens in _propertiesKitchens) {
      yield Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: ChoiceChip(
          label: Container(
            width: 30,
            alignment: Alignment.center,
            child: Text(propertiesKitchens.name, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: _defaultChoiceIndex == _propertiesKitchens.indexOf(propertiesKitchens) ? Colors.white : kPrimaryColor),),
          ), 
          labelPadding: const EdgeInsets.all(0.0),
          backgroundColor: const Color(0xFFFFFFFF),
          selectedColor: kPrimaryColor,
          shape: const RoundedRectangleBorder(side: BorderSide(), borderRadius: BorderRadius.all(Radius.circular(8))),
          side: const BorderSide( color: kPrimaryColor ),
          selected: _defaultChoiceIndex == _propertiesKitchens.indexOf(propertiesKitchens),
          onSelected: ( bool selected ) {
            setState(() {
              _defaultChoiceIndex = selected ? _propertiesKitchens.indexOf(propertiesKitchens) : 0 ;
              selected ? _filtersSearchKitchens.add(propertiesKitchens.name) : _filtersSearchKitchens.removeWhere((String name) => name == propertiesKitchens.name);

            });
          },
        ),
      );
    }
  }
}


class PropertiesKitchens {
  const PropertiesKitchens(this.name);
  final String name;
}