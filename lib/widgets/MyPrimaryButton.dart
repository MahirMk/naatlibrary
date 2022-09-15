import 'package:flutter/material.dart';
import 'package:naatlibrary/resources/StyleResources.dart';

class MyPrimaryButton extends StatelessWidget {

  var btntext="";
  GestureTapCallback onclick;
  MyPrimaryButton({this.btntext,this.onclick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onclick,
      child: Container(
        width: 100,
        height: 40.0,
        color: StyleResources.tealcolor,
        alignment: Alignment.center,
        child: Text(btntext,style: StyleResources.txtwhitecolor),
      ),
    );
  }
}
