import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StylishButton extends StatelessWidget {
  StylishButton({
    Key? key,
    required this.onTap,
    required this.text,
  }) : super(key: key);
  Function onTap;
  String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 20),
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Container(
          height: 50,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.indigo.shade600),
          alignment: Alignment.center,
          child: Text(
            text,
            style: GoogleFonts.firaSans(
              color: Colors.white,
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
          ),
        ),
      ),
    );
  }
}
