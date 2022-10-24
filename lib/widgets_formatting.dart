import 'package:flutter/material.dart';
import 'package:flutter_expansionpanel/constants.dart';


class GreenDivider extends StatelessWidget {
  const GreenDivider({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) => const Divider( 
    thickness: 2.0, 
    color: kSecondaryColor, 
    indent: 24.0, 
    endIndent: 24.0, 
    height: 0,
  );
}


class BlueDivider extends StatelessWidget {
  const BlueDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const Divider(
    thickness: 1.0, 
    color: kPrimaryColor, 
    indent: 12.0, 
    endIndent: 12.0, 
    height: 0,    
  );
}
