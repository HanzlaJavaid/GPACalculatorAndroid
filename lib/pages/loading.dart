import 'package:flutter/material.dart';
import 'dart:async';
import './gpa_calc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import './gpapage.dart';
class loadingscreen extends StatefulWidget {
  @override
  _loadingscreen createState() => _loadingscreen();
}

class _loadingscreen extends State<loadingscreen> {
  @override
  void initState() {
    super.initState();
    // here is the logic 
    Future.delayed(Duration(seconds: 3)).then((__) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => GPA()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[100],
      body: Container(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0,200,0,0),
            child: Column(
              children: [
                Image.asset('assets/images/logo-small.png'),
                SizedBox(height: 50,),
                SpinKitCircle(
                  color: Colors.white,
                  size: 50.0,
                ),
              ],
            ),
          ),
        ),
      ),
    ); // this widget stays here for 2 seconds, you can show your app logo here
  }
}
