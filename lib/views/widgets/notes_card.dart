import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotesCard extends StatelessWidget {
  const NotesCard({super.key,required this.title,required this.subTitle});
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color(0xfff4da7f),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.only(top: 10,bottom: 10,left: 15),
              title: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Text(
                  title,
                  style: GoogleFonts.poppins(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              subtitle: Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  subTitle,
                  style: GoogleFonts.poppins(
                    color: Colors.black.withValues(alpha: 0.6),
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.delete,
                  color: Colors.black,
                  size: 30,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: Text("may 2,2025",style: GoogleFonts.poppins(
                    color: Colors.black.withValues(alpha: 0.6),
                    fontSize: 16,
                    fontWeight: FontWeight.w500
                ),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
