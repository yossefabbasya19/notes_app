import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/cubit/fetch_data/fetch_data_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_notes.dart';

class NotesCard extends StatelessWidget {
  const NotesCard({
    super.key,
    required this.title,
    required this.subTitle,
    required this.noteModel,
    required this.noteKey,
  });

  final String title;
  final NoteModel noteModel;
  final String subTitle;
  final int noteKey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => EditNotes(noteModel: noteModel),
          ),
        );
      },
      child: Container(
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
                contentPadding: EdgeInsets.only(top: 10, bottom: 10, left: 15),
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
                  onPressed: () {
                    noteModel.delete();
                    BlocProvider.of<FetchDataCubit>(context).fetchData();
                  },
                  icon: Icon(Icons.delete, color: Colors.black, size: 30),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    noteModel.date,
                    style: GoogleFonts.poppins(
                      color: Colors.black.withValues(alpha: 0.6),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
