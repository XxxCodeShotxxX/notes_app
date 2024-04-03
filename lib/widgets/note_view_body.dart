import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_appbar.dart';
import 'package:note_app/widgets/note_listview_builder.dart';

class NoteViewBody extends StatelessWidget {
  const NoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 50,
        ),
        CustomAppBar(
          icon: Icons.search,
          title: 'Notes',
        ),
        NoteListViewBuilder(),
      ],
    );
  }
}
