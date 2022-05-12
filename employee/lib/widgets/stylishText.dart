import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StylishText extends StatelessWidget {
  String firstTxt;
  String secondTxt;
  double fontSize;
  FontWeight fontWeight;

  StylishText({
    Key? key,
    required this.firstTxt,
    required this.secondTxt,
    required this.fontSize,
    required this.fontWeight,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          firstTxt,
          style: GoogleFonts.firaSans(
            letterSpacing: 1.5,
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: Colors.indigo.withOpacity(0.9),
          ),
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          secondTxt,
          style: GoogleFonts.firaSans(
            letterSpacing: 1.5,
            fontWeight: fontWeight,
            fontSize: fontSize,
            color: Colors.orange.withOpacity(0.9),
          ),
        )
      ]),
    );
  }
}
