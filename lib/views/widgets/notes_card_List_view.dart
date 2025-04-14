import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubit/fetch_data/fetch_data_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/notes_card.dart';

class NotesCardListView extends StatefulWidget {
  const NotesCardListView({super.key});

  @override
  State<NotesCardListView> createState() => _NotesCardListViewState();
}

class _NotesCardListViewState extends State<NotesCardListView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<FetchDataCubit>(context).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchDataCubit, FetchDataState>(
      builder: (context, state) {
        List<NoteModel>? notes =
            BlocProvider.of<FetchDataCubit>(context).notes ?? [];
        return Expanded(
          child: ListView.builder(
            itemCount: notes.length,
            itemBuilder:
                (context, index) => NotesCard(
                  noteModel: notes[index],
                  title: notes[index].title,
                  subTitle: notes[index].subtitle,
                ),
          ),
        );
      },
    );
  }
}
