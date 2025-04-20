import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/cubit/add_notes/add_notes_cubit.dart';

import 'package:notes_app/cubit/fetch_data/fetch_data_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/widgets/colors_selector/color_seletor.dart';
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
  late int currentIndex;

  @override
  void initState() {
    currentIndex = colors.indexOf(Color(widget.noteModel.color));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CustomAppBar(
                title: "Edit Notes",
                icon: Icons.done,
                onPressed: () {
                  print(title);
                  print(subtitle);
                  widget.noteModel.title = title ?? widget.noteModel.title;
                  widget.noteModel.subtitle =
                      subtitle ?? widget.noteModel.subtitle;
                  widget.noteModel.save();
                  BlocProvider.of<FetchDataCubit>(context).fetchData();
                  Navigator.pop(context);
                },
              ),
              SizedBox(height: 25),
              CustomTextField(
                initialValue: widget.noteModel.title,
                hintText: "title",
                onChanged: (p0) {
                  title = p0;
                },
              ),
              SizedBox(height: 25),
              CustomTextField(
                initialValue: widget.noteModel.subtitle,
                hintText: "subTitle",
                maxLine: 5,
                onChanged: (p0) {
                  subtitle = p0;
                },
              ),
              SizedBox(height: 16),
              ColorsListView(context),
            ],
          ),
        ),
      ),
    );
  }
  SizedBox ColorsListView(BuildContext context) {
    return SizedBox(
      height: 22.5 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentIndex = index;
              widget.noteModel.color = colors[currentIndex].toARGB32();
              setState(() {});
            },
            child: ColorsItem(
              isActive: currentIndex == index,
              color: colors[index],
            ),
          );
        },
      ),
    );
  }
}


