import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_appBar.dart';

class NoteViewBody extends StatelessWidget {
  const NoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 50,
        ),
        CustomAppBar(),
      ],
    );
  }
}
