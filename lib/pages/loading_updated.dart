import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'slider.dart';
import 'gpapage.dart';
class loadingscreen extends StatefulWidget {
  @override
  _loadingscreen createState() => _loadingscreen();
}

class _loadingscreen extends State<loadingscreen> {
  startTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool firstTime = prefs.getBool('first_time');

    var _duration = new Duration(seconds: 1);

    if (firstTime != null && !firstTime) {// Not first time
      return new Timer(_duration, navigationPageHome);
    } else {// First time
      prefs.setBool('first_time', false);
      return new Timer(_duration, navigationPageWel);
    }
  }

  void navigationPageHome() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => GPA()));
  }

  void navigationPageWel() {

    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => OnboardingScreen()));
  }

  @override
  void initState() {
    super.initState();
    // here is the logic
    Future.delayed(Duration(seconds: 2)).then((__) {
      startTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,200,0,0),
            child: Column(
              children: [
                Flexible(child: Image.asset('assets/images/logo-small.png'),flex: 3,),
                Flexible(child: SizedBox(height: 50,),flex: 2),
                Flexible(
                  child: SpinKitRing(
                    color: Colors.white,
                    size: 75.0,

                  ),
                  flex:9
                ),
                Flexible(
                  flex:2,
                  child: Container(
                    alignment: Alignment.center,
                    child: Text(
                      "APP BY PREPAREHOW",
                      style: GoogleFonts.roboto(fontSize: 15,color: Colors.white),
                   ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    ); // this widget stays here for 2 seconds, you can show your app logo here
  }
}
