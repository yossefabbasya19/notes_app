import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_text_field.dart';

class EditNotes extends StatelessWidget {
  const EditNotes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CustomAppBar(title: "Edit Notes", icon: Icons.done),
              SizedBox(height: 25,),
              CustomTextField(hintText: "title"),
              SizedBox(height: 25,),
              CustomTextField(hintText: "subTitle",maxLine: 5,),
            ],
          ),
        ),
      ),
    );
  }
}
