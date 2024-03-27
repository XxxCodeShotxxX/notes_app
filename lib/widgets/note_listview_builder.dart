import 'package:flutter/material.dart';
import 'package:note_app/widgets/note_item.dart';

class NoteListViewBuilder extends StatelessWidget {
  const NoteListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          //padding: EdgeInsets.zero,
          itemCount: 5,
          itemBuilder: (ctx, index) {
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
              child: NoteItem(),
            );
          }),
    );
  }
}
