import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/notes_card.dart';

class NotesCardListView extends StatelessWidget {
  const NotesCardListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemBuilder:
            (context, index) => NotesCard(
          title: "Flutter Tips",
          subTitle: "Build Your Career With Yossef Abbasya",
        ),
      ),
    );
  }
}
