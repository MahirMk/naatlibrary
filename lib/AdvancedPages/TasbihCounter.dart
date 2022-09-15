import 'package:flutter/material.dart';

class TasbihCounter extends StatefulWidget {

  @override
  State<TasbihCounter> createState() => _TasbihCounterState();
}

class _TasbihCounterState extends State<TasbihCounter> {

  int _tashbehCount = 0;

  void counter() {
    setState(() {
      _tashbehCount = _tashbehCount + 1;
    });
  }
  void refresh(){
    setState(() {
      _tashbehCount = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: new AppBar(
        title: new Text('Tashbeh Counter'),
      ),
      body: new Container(
          child : new Column(
            children: <Widget>[
              new Center(
                child: new Text("Tasbeeh!",
                  style: new TextStyle(fontSize: 30.0, color: Colors.teal.shade900),),
              ),
              new Expanded(
                  child: new Center(
                    child: new Text('$_tashbehCount',
                      style: new TextStyle(
                          color: _tashbehCount < 50 ?
                          Colors.greenAccent: Colors.red, fontSize: 40.3, fontWeight: FontWeight.w500),),
                  )),
              new Expanded(
                  child: new Center(
                      child: new GestureDetector(
                        onTap: counter,
                        child: Text("Count",style: TextStyle(fontSize: 30),),
                      )
                  )),
              new Expanded(
                  child: new Center(
                    child: new  GestureDetector(
                      onTap: refresh,
                      child: Text("Refresh",style: TextStyle(fontSize: 30),),
                    ),
                  ))
            ],
          )

      ),
    );
  }
}
