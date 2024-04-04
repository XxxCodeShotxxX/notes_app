import 'package:flutter/material.dart';
import 'package:note_app/widgets/modal_sheet_bottom.dart';
import 'package:note_app/widgets/note_view_body.dart';

class NoteView extends StatelessWidget {
  const NoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 12, right: 12),
        child: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (ctx) {
                  return const AddModalBottomSheet();
                });
          },
          child: const Icon(Icons.add),
        ),
      ),
      body: const NoteViewBody(),
    );
  }
}
