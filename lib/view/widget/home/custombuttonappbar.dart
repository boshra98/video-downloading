import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class CustomButtonAppbar extends StatelessWidget {
   final void Function()? onPressed ;
  final String textbutton ;
  final IconData icondata ;
 const   CustomButtonAppbar({Key? key, required this.textbutton, required this.icondata, this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GButton(
        onPressed: onPressed ,
        icon: icondata,
        text: textbutton
    );
  }
  }

