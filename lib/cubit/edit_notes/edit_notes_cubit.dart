import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/cubit/edit_notes/edit_notes_state.dart';
import 'package:notes_app/models/note_model.dart';

class EditNotesCubit extends Cubit<EditNotesState> {
  EditNotesCubit() : super(EditNotesInitial());

  editNotes(int noteKey, NoteModel noteModel) async {
    emit(EditNotesLoading());

    try{
      var notesBox = Hive.box<NoteModel>(kNote);
      await notesBox.put(noteKey, noteModel);
      emit(EditNotesSuccess());
    }catch(e){
      emit(EditNotesFailure());
    }
  }
}
