import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
          title: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Center',
              style: GoogleFonts.lato(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 8,
                  offset: Offset(2,5), // Shado
                ),
              ],
            ),

            //maximum allowable width
            //width: double.infinity,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(width: 2.5, color: Colors.white),
                    ),
                    width: 60,
                    height: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: Image(
                        image: AssetImage(
                            'assets/image/bb9f8b136eb644c92a08fa3f7637c03bYp9UjK_800.jpg'),
                      ),
                    ),
                  ),
                ),
                //padding: const EdgeInsets.all(8.0),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Text(
                        'Vladislav Shevchuck',
                        style: GoogleFonts.lato(
                            fontSize: 19,
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                    ),
                    Text(
                      'mobile app developer',
                      style: GoogleFonts.lato(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Colors.white54),
                    )
                  ],
                ),
                Container(
                    //add_rounded
                  padding: EdgeInsets.only(bottom: 25, left: 10),
                  child: Icon(Icons.privacy_tip,color:Colors.white ,size : 20)
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
