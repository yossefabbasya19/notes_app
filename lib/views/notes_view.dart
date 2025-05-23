import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/custom_app_bar.dart';
import 'package:notes_app/views/widgets/custom_bottom_sheet.dart';
import 'package:notes_app/views/widgets/notes_card_List_view.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: ()  {
           showModalBottomSheet(
            isDismissible: false,
            isScrollControlled: true,
            context: context,
            builder: (context) => CustomBottomSheet(),
          );
        },
        backgroundColor: Color(0xff8ecc85),
        child: Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CustomAppBar(title: "Notes", icon: Icons.search),
              SizedBox(height: 16),
              NotesCardListView(),
            ],
          ),
        ),
      ),
    );
  }
}
