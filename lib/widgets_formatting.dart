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


class BtChoiceChip extends StatelessWidget {
  final String btText;
  final Color? btColor;
  final Color? btBackgroundColor;
  final Color? btSelectedColor;
  final Color? btSideBorderColor;
  final bool? btSelected;
  final void Function(bool) btOnSelected;


  const BtChoiceChip({Key? key, required this.btText, this.btColor, this.btBackgroundColor, this.btSelectedColor, this.btSideBorderColor, this.btSelected, required this.btOnSelected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChoiceChip(
      label: Container(
        width: 140,          
        alignment: Alignment.center,
        child: Text(btText, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: btColor ?? kPrimaryColor,),),
      ),
      backgroundColor: btBackgroundColor ?? Colors.white,
      selectedColor: btSelectedColor ?? kPrimaryColor,
      shape: const RoundedRectangleBorder(side: BorderSide(), borderRadius: BorderRadius.all(Radius.circular(8))),
      side: BorderSide( color: btSideBorderColor ?? kPrimaryColor ),
      selected: btSelected ?? false,
      onSelected: btOnSelected,
    );    
  }
}
