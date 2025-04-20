import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/constant.dart';
import 'package:notes_app/cubit/add_notes/add_notes_cubit.dart';

class ColorsItem extends StatelessWidget {
  const ColorsItem({super.key, required this.isActive,required this.color});
  final Color color;
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return isActive
        ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            radius: 22.5,
            child: CircleAvatar(
              radius: 20,
              backgroundColor: color,
            ),
          ),
        )
        : Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: CircleAvatar(
            radius: 20,
            backgroundColor: color,
          ),
        );
  }
}

class ColorsListView extends StatefulWidget {
  ColorsListView({super.key});

  @override
  State<ColorsListView> createState() => _ColorsListViewState();
}

class _ColorsListViewState extends State<ColorsListView> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 22.5 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              currentIndex = index;
              BlocProvider.of<AddNotesCubit>(context).color = colors[index];
              setState(() {});
            },
            child: ColorsItem(isActive: currentIndex == index,color: colors[index],),
          );
        },
      ),
    );
  }
}

