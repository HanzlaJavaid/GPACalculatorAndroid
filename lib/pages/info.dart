import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
class infoShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
        appBar: new AppBar(title: new Text("GPA calculator"), backgroundColor: Colors.lightGreen,
      ),
      body: Container(
        child: Center(
          child: Column(
            children: [
              Image.asset('assets/images/logo.png'),
              Text("Presented By PrepareHOW",style:GoogleFonts.oswald(fontSize: 20),),

              Padding(
                padding: const EdgeInsets.fromLTRB(125,10,10,10),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap:(){
                        _launchURL('https://www.preparehow.com/');
                      },
                      child:Image.asset('assets/images/globe.png') ,
                    ),
                    GestureDetector(
                      onTap:(){
                        _launchURL('https://www.instagram.com/prepare.how');
                      },
                      child:Image.asset('assets/images/ins.png'),
                    ),
                    GestureDetector(
                      onTap:(){
                        _launchURL('https://www.facebook.com/PrepareHOW/');
                      },
                      child:Image.asset('assets/images/fb.png'),
                    ),
                  ],
                ),
              ),


              SizedBox(height: 20,),
              Text("For more information, please visit www.preparehow.com",style:GoogleFonts.oswald(fontSize: 15),),
            ],
          ),
        ),
      )
    );
  }
}
_launchURL(u) async {
  const url = 'https://flutter.io';
  await launch(u);
}