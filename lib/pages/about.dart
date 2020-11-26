import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
class infoShow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: new AppBar(title: new Text("About"), backgroundColor: Color(0xff73924F),centerTitle: true,
      ),
      body: Container(
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
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png',width: 160, height: 160,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Who We Are?",style:GoogleFonts.roboto(color: Color(0xff73924F),fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16),
                child: Text("PrepareHOW is an App and Web-Based Platform to guide and prepare students for admission tests like NUST, ECAT, ETEA, NUMS, MDCAT, GIKI and all other entry tests in Pakistan. The platform is helping millions of students through Web, App and Social Media Platforms to help students prepare for tests. Our aim is to provide simple, innovative, affordable and accessible education and guidance to student that are at a very crucial stage of deciding their future.",style: GoogleFonts.roboto(color: Color(0xFF6A6A6A),fontSize: 16),),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Download From Playstore",style:GoogleFonts.roboto(color: Color(0xff73924F),fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              GestureDetector(
                onTap:(){
                  _launchURL('https://play.google.com/store/apps/details?id=com.preparehow.entry.test&hl=e');
                },
                child:Image.asset('assets/images/play.png') ,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Find Us Here",style:GoogleFonts.roboto(color: Color(0xff73924F),fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(100,8.0,100,0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: GestureDetector(
                        onTap:(){
                          _launchURL('https://www.preparehow.com/');
                        },
                        child:Image.asset('assets/images/globe.png') ,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 16),
                      child: GestureDetector(
                        onTap:(){
                          _launchURL('https://www.facebook.com/PrepareHOW/');
                        },
                        child:Image.asset('assets/images/fb.png'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16,left: 16,right: 16),
                child: Text("For more information, please visit www.preparehow.com",style: GoogleFonts.roboto(color: Color(0xFF6A6A6A),fontSize: 16),textAlign: TextAlign.center,),
              ),
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