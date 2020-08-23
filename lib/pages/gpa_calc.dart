import 'dart:wasm';

import 'package:flutter/material.dart';
import './score_page.dart';
import 'dart:async';
import './info.dart';
class GPAcalc extends StatefulWidget {
  final int n;

  GPAcalc(this.n);

  @override
  GPAcalcstate createState() => new GPAcalcstate();
}

class GPAcalcstate extends State<GPAcalc> {
  List<String> _items = [ 'A', 'A-', 'B+', 'B', 'B-','C+','C','C-','D+','D','F'].toList();
  List<String> _itemsCp = ['1', '2', '3','4','5','6'].toList();
  var _selection;
  var _selectionCp;
  var list;

  @override
  void initState() {
    super.initState();
    _selection= new List<String>()..length=widget.n;
    _selectionCp= new List<String>()..length=widget.n;
    list = new List<int>.generate(widget.n, (i) =>i);
  }

  @override
  Widget build(BuildContext context) {
    double sogxc = 0, soc = 0;
    var textFields = <Widget>[];
    bool safeToNavigate=true;
    textFields.add(new Row(
      children: [
        new Padding(
          padding:new EdgeInsets.only(left: 96.0),
        ),
        new Column(
          children:[
            new Text(
              "Grade",
              overflow: TextOverflow.ellipsis,
              style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0),
            ),
          ]
        ),
        new Padding(
          padding:new EdgeInsets.only(left: 72.0),
        ),
        new Column(
          children:[
            new Text(
              "Credits",
              overflow: TextOverflow.ellipsis,
              style: new TextStyle(fontWeight: FontWeight.bold,fontSize: 17.0),
            ),
          ],
        ),
        new Padding(
          padding:new EdgeInsets.only(bottom:25.0),
        ),
      ]
      ),
    );
      list.forEach((i) {
          textFields.add( new Column(
                children: [
                  new Row(
                 //   mainAxisAlignment: MainAxisAlignment.center,
                   // crossAxisAlignment: CrossAxisAlignment.center,
                  children:[
                    new Text("Subject ${i+1}:",style: new TextStyle(color: Colors.black87,fontWeight: FontWeight.bold),),
                    new Padding(
                      padding:new EdgeInsets.all(10.0),
                    ),
                    new DropdownButton<String>(
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                      hint: new Text("grade ${i+1}",style:TextStyle(color: Colors.black54,fontWeight: FontWeight.normal),),
                      value: _selection[i],
                      items: _items.map((String item) {
                        return new DropdownMenuItem<String>(
                          value: item,
                          child: new Text(item,textAlign: TextAlign.center,),
                        );
                      }).toList(),
                      onChanged: (s) {
                        setState(() {
                          _selection[i] = s;
                        });
                      },
                    ),
                    new Padding(
                      padding:new EdgeInsets.all(35.0),
                    ),
                     
                    new DropdownButton<String>(
                      style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                      hint: new Text("credit ${i+1}",style:TextStyle(color: Colors.black54,fontWeight: FontWeight.normal),),
                      value: _selectionCp[i],
                      items: _itemsCp.map((String items) {
                        return new DropdownMenuItem<String>(
                          value: items,
                          child: new Text(items,textAlign: TextAlign.center,),
                        );
                      }).toList(),
                      onChanged: (s) {
                        setState(() {
                          _selectionCp[i] = s;
                        });
                      },
                    ),
                  ]
                  ),

                ],
              ),
          );
      });
        
    double res = 0.0;

    return new Scaffold(
      appBar: new AppBar(
        title: new Text("GPA calculator"),
        backgroundColor: Colors.lightGreen,
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(builder:(BuildContext context)=>new infoShow()));
                },
                child: Icon(
                  Icons.info,
                  size: 26.0,
                ),
              )
          ),
        ],
      ),
      backgroundColor: Colors.lightGreen[100],
      body: new Container(
        decoration: new BoxDecoration(border: new Border.all(color: Colors.transparent, width: 30.0)),
        child: new ListView(
          children: textFields,
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Calculate',
        backgroundColor: Colors.blueAccent,
        child: new Icon(Icons.arrow_forward_ios),
        onPressed: () {
          for (int i = 0; i < widget.n; i++) {
            if(_selectionCp[i]==null){
              safeToNavigate = false;
              continue;
            }
            if(_selection[i]==null){
              safeToNavigate = false;
              continue;
            }
            double r = double.parse(_selectionCp[i]);
            double gp = calculate(_selection[i]);
            double cp = r;
            double gxc = gp * cp;
            sogxc += gxc;
            soc += cp;
          }
          res = sogxc / soc;
          if(safeToNavigate)
          Navigator.of(context).push(
                new MaterialPageRoute(
                  builder: (BuildContext context) => new ScorePage(res),
                ),
              );
          else{
            alert();
          }
        },
      ),
    );
  }

  double calculate(var a) {
    if (a == "A") return 4.0;
    if (a == "A-") return 3.7;
    if (a == "B+") return 3.3;
    if (a == "B") return 3.0;
    if (a == "B-") return 2.7;
    if (a == "C+") return 2.3;
    if (a == "C") return 2.0;
    if (a == "C-") return 1.70;
    if (a == "D+") return 1.0;
    if (a == "F") return 0.0;
    return 0;
  }
  Future<Null> alert() async {
  return showDialog<Null>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return new AlertDialog(
        title: new Text('Error'),
        content: new SingleChildScrollView(
          child: new ListBody(
            children: <Widget>[
              new Text('Provided information is incomplete.'),
            ],
          ),
        ),
        actions: <Widget>[
          new FlatButton(
            child: new Text('Ok'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
}