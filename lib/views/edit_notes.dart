import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/cubit/edit_notes/edit_notes_cubit.dart';
import 'package:notes_app/cubit/edit_notes/edit_notes_state.dart';
import 'package:notes_app/cubit/fetch_data/fetch_data_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class EditNotes extends StatefulWidget {
  const EditNotes({super.key, required this.noteModel});

  final NoteModel noteModel;

  @override
  State<EditNotes> createState() => _EditNotesState();
}

class _EditNotesState extends State<EditNotes> {
  String? title;

  String? subtitle;
  GlobalKey<FormState> formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditNotesCubit(),
      child: Scaffold(
        body: SafeArea(
          child: BlocConsumer<EditNotesCubit, EditNotesState>(
            listener: (context, state) {
              if (state is EditNotesFailure) {
                print("Error");
              } else if (state is EditNotesSuccess) {
                BlocProvider.of<FetchDataCubit>(context).fetchData();
                Navigator.pop(context);
              }
            },
            builder: (context, state) {
              return ModalProgressHUD(
                inAsyncCall: state is EditNotesLoading ? true : false,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomAppBar(
                          title: "Edit Notes",
                          icon: Icons.done,
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              NoteModel newEditNote = NoteModel(
                                title: title!,
                                color: Color(0xf3432213).toARGB32(),
                                date: DateTime.now().toString(),
                                subtitle: subtitle!,
                              );
                              await BlocProvider.of<EditNotesCubit>(
                                context,
                              ).editNotes(widget.noteModel.key, newEditNote);
                            }
                          },
                        ),
                        SizedBox(height: 25),
                        CustomTextField(
                          initialValue: widget.noteModel.title,
                          hintText: "title",
                          onSave: (p0) {
                            title = p0;
                          },
                        ),
                        SizedBox(height: 25),
                        CustomTextField(
                          initialValue: widget.noteModel.subtitle,
                          hintText: "subTitle",
                          maxLine: 5,
                          onSave: (p0) {
                            subtitle = p0;
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
