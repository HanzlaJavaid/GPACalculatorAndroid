import 'package:flutter/material.dart';
import 'dart:async';
import './gpa_calc.dart';
import './about.dart';
import 'package:google_fonts/google_fonts.dart';
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

      appBar: new AppBar(centerTitle: true, title: new Text("GPA calculator"), backgroundColor: Color(0xff73924F),
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
        child: Padding(
          padding: EdgeInsets.only(left: 16,right: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Enter Course Count Here",
                style: GoogleFonts.roboto(color: Color(0xff73924F),fontSize: 20,fontWeight: FontWeight.bold),
              ),

              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: TextField(
                  textAlign: TextAlign.center,
                  autofocus: true,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "Course Count",
                      hintStyle: GoogleFonts.roboto(color: Color(0xFF6A6A6A),fontWeight: FontWeight.normal,fontSize: 16),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.green,
                              width: 2,
                              style: BorderStyle.solid
                          ),
                          borderRadius: BorderRadius.zero
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.black,
                              width: 2,
                              style: BorderStyle.solid
                          ),
                          borderRadius: BorderRadius.zero
                      )
                  ),
                  controller: controller,
                  onChanged: (String str){
                    setState((){
                      if(controller.text=="")
                        n=0;
                      n=int.parse(controller.text);
                    });
                  },
                ),
              ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Container(
              width: 200,
              height: 50,
              child: RaisedButton(
                onPressed: () {
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
                },
                color: Color(0xff73924F),
                child: Text(
                    "CONTINUE",
                    style: GoogleFonts.roboto(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold)
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          )
            ],
          ),
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
