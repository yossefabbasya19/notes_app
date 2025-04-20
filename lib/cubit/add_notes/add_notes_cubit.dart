import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/models/note_model.dart';

part 'add_notes_state.dart';

class AddNotesCubit extends Cubit<AddNotesState> {
  AddNotesCubit() : super(AddNotesInitial());
  Color color = Color(0xff3E4E50);
  Future<void> addNotes(NoteModel note) async {
    note.color = color.toARGB32();
    emit(AddNotesLoading());
    await Future.delayed(Duration(seconds: 1));
    try {
      var notesBox = Hive.box<NoteModel>(kNote);
      await notesBox.add(note);
      emit(AddNotesSuccess());
    } catch (e) {
      emit(AddNotesFailure(errMassage: e.toString()));
    }
  }
}
