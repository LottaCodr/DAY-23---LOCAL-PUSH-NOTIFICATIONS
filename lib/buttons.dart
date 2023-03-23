import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// class CustomButtons {
//
//   CustomButtons({
//
// });
//
  

  //  buildButton(){
  //   return ElevatedButton.icon(
  //       onPressed: () => onClicked,
  //       icon: myIcon,
  //       label: Text(title)
  //   );
  // }


class Mybuttons extends StatelessWidget {
  String title;
  Icon myIcon;
  Function onClicked;


   Mybuttons({Key? key,
    required this.title,
    required this.myIcon,
    required this.onClicked
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
             onPressed: () => onClicked,
              icon: myIcon,
              label: Text(title),

      // style: ButtonStyle(
      //   iconColor: Colors.white,
      // ),
    );
  }
}



