import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class sandbox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 250,
          height: 400,
          alignment: Alignment.center,
          child: TextField(
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
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
          )
        ),
      ),
    );
  }
}
