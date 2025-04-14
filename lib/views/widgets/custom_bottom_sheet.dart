import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/cubit/add_notes/add_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? title;

  String? subTitle;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNotesCubit(),
      child: Container(
        padding: EdgeInsets.only(top: 16,left: 16,right: 16,bottom: MediaQuery.of(context).viewInsets.bottom),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: AbsorbPointer(
              child: Column(
                children: [
                  SizedBox(height: 25),
                  CustomTextField(
                    hintText: "title",
                    onSave: (value) {
                      title = value;
                    },
                  ),
                  SizedBox(height: 25),
                  CustomTextField(
                    hintText: "subTitle",
                    maxLine: 5,
                    onSave: (value) {
                      subTitle = value;
                    },
                  ),
                  SizedBox(height: 25),
                  BlocConsumer<AddNotesCubit, AddNotesState>(
                    listener: (context, state) {
                      if (state is AddNotesFailure) {
                        print(state.errMassage);
                      } else if (state is AddNotesSuccess) {
                        Navigator.pop(context);
                      }
                    },
                    builder: (context, state) {
                      return SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ButtonStyle(
                            backgroundColor: WidgetStatePropertyAll(
                              Color(0xff8ecc85),
                            ),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                              NoteModel note = NoteModel(
                                title: title!,
                                color: Colors.lightBlueAccent.value,
                                date: DateTime.now().toString(),
                                subtitle: subTitle!,
                              );
                              BlocProvider.of<AddNotesCubit>(
                                context,
                              ).addNotes(note);
                            }
                          },
                          child:
                              state is AddNotesLoading
                                  ? SizedBox(
                                    height: 24,
                                    width: 24,
                                    child: CircularProgressIndicator(
                                      color: Colors.black,
                                    ),
                                  )
                                  : Text(
                                    "add",
                                    style: GoogleFonts.poppins(
                                      fontSize: 24,
                                      color: Colors.black,
                                    ),
                                  ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
