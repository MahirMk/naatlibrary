import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../provider/DarkThemeProvider.dart';
import '../resources/StyleResources.dart';

class FirstPageContainer extends StatelessWidget {

  var myimg="";
  var myimgbg="";
  var text="";
  var btntext="";
  GestureTapCallback onclick;
  FirstPageContainer({this.onclick,this.btntext,this.myimg,this.text,this.myimgbg});

  @override
  Widget build(BuildContext context) {
    final themeChange = Provider.of<DarkThemeProvider>(context,listen: true);
    return Container(
      width: 340,
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(color:  (themeChange.isdark)?StyleResources.whitecolor:StyleResources.BlackColor,),
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: AssetImage(myimgbg),
          fit: BoxFit.cover,
          opacity: 200.0,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Opacity(
            opacity: 0.8,
              child: Image.asset(myimg,width: 150)
          ),
          Column(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text(btntext,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,
                    color:  (themeChange.isdark)?StyleResources.whitecolor:StyleResources.BlackColor,
                  ),),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding:  EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: onclick,
                  child: Container(
                    width: 100,
                    decoration: BoxDecoration(
                        border: Border.all( color:  (themeChange.isdark)?StyleResources.whitecolor:StyleResources.BlackColor,),
                    ),
                      child: Center(child: Text(text,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20, color:  (themeChange.isdark)?StyleResources.whitecolor:StyleResources.BlackColor,),)),
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
