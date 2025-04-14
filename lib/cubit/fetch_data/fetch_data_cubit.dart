import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/models/note_model.dart';

part 'fetch_data_state.dart';

class FetchDataCubit extends Cubit<FetchDataState> {
  FetchDataCubit() : super(FetchDataInitial());
  List<NoteModel>? notes;

  fetchData() {
    var notesBox = Hive.box<NoteModel>(kNote);
    notes = notesBox.values.toList();
    emit(FetchDataInitial());
  }
}
