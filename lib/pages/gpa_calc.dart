import 'dart:wasm';

import 'package:flutter/material.dart';
import './score_page.dart';
import 'dart:async';
import './about.dart';
import 'package:google_fonts/google_fonts.dart';
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
    textFields.add(Padding(
      padding: const EdgeInsets.only(left: 16,right: 16,bottom: 0,top: 16),
      child: Container(
        height: 60,

      child: IntrinsicHeight(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              "Provide The Following Details",
              style: GoogleFonts.roboto(color: Color(0xff73924F),fontSize: 20,fontWeight: FontWeight.bold),
            ),
          ],
          ),
      ),
    ),
    ));
      list.forEach((i) {
          textFields.add( Padding(
            padding: const EdgeInsets.only(left: 16,right: 16,bottom: 8,top: 8),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.green,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(5)

              ),
              child: new Column(
                    children: [
                      IntrinsicHeight(
                        child: new Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                        children:[
                          new Text("${i+1}",style: GoogleFonts.roboto(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold,),textAlign: TextAlign.center,),
                          new Padding(
                            padding:new EdgeInsets.all(0),
                          ),
                          VerticalDivider(
                            thickness: 2,
                            color: Colors.green,
                          ),
                          DropdownButtonHideUnderline(
                            child: new DropdownButton<String>(
                              icon:Container(child: Icon(Icons.arrow_drop_down,size: 30,),padding: EdgeInsets.only(left: 10),),
                              style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                              hint: new Text("Select Grade",style:GoogleFonts.roboto(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.bold,),),
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
                          ),
                          new Padding(
                            padding:new EdgeInsets.all(0),
                          ),
                          VerticalDivider(
                            thickness: 2,
                            color: Colors.green,
                          ),
                          Container(
                            width: 100,
                            child: TextField(
                              decoration: InputDecoration(
                                hintText: "Enter Credits",
                                hintStyle: GoogleFonts.roboto(color: Colors.grey,fontSize: 16,fontWeight: FontWeight.bold,)
                              ),
                              textAlign: TextAlign.center,
                              keyboardType: TextInputType.number,
                              onChanged: (s){
                                _selectionCp[i]  = s;
                              },
                            ),
                          ),
                        ]
                        ),
                      ),

                    ],
                  ),
            ),
          ),
          );
      }
      );
    double res = 0.0;
      textFields.add(
          Padding(
            padding: const EdgeInsets.all(16),
            child: Container(
              width: 200,
              height: 50,
              child: RaisedButton(
                onPressed:() {
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
                color:  Color(0xff73924F),
                child: Text(
                    "EVALUATE",
                    style: GoogleFonts.roboto(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold)
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          )
      );

    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text("GPA calculator"),
        backgroundColor: Color(0xff73924F),
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
      body: new Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: [0.1, 0.4, 0.7, 0.9],
            colors: [
              Colors.grey[300],
              Colors.white,
              Colors.white,
              Colors.grey[300],
            ],
          ),
        ),
        child: new ListView(
          children: textFields,
        ),

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