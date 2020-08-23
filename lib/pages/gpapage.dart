import 'package:flutter/material.dart';
import 'dart:async';
import './gpa_calc.dart';
import './info.dart';
class GPA extends StatefulWidget{
  @override
  GPAState createState() => new GPAState(); 
}
class GPAState extends State<GPA>{
  TextEditingController controller = new TextEditingController();
  int n;
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      appBar: new AppBar(title: new Text("GPA calculator"), backgroundColor: Colors.lightGreen,
      automaticallyImplyLeading: false,
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
      floatingActionButton: FloatingActionButton(
        child:new Icon(Icons.arrow_forward_ios),
          onPressed: (){
        if(n is int && n>0){
          int pass=n;
          n=0;
          controller.text="";
          Navigator.of(context).push(new MaterialPageRoute(builder:(BuildContext context)=>new GPAcalc(pass)));
        }
        else{
          controller.text="";
          alert();
        }
      }),
      body: new Container(
        decoration: new BoxDecoration(border: new Border.all(color: Colors.transparent,width: 25.0),color: Colors.transparent),
        child: new ListView(
           children: <Widget>[
             SizedBox(height: 50)
             ,
              new TextField(
                textAlign: TextAlign.center,
                autofocus: true,

                decoration: new InputDecoration(
                  fillColor: Colors.lightGreenAccent,
                  
                  hintText: "Enter Number Of Subjects ",
                  hintStyle: new TextStyle(color: Colors.black54)
                ),
                keyboardType: TextInputType.number,
                controller: controller,
                onChanged: (String str){
                  setState((){
                    if(controller.text=="")
                      n=0;
                    n=int.parse(controller.text);
                  });
                },
              ),
            ],
          ),
        ),
    );
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
              new Text('Enter at least one subject')
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
