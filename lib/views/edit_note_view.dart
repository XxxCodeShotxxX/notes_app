import 'package:flutter/material.dart';
import 'package:note_app/widgets/custom_appbar.dart';
import 'package:note_app/widgets/custom_textfield.dart';

class EditNoteView extends StatelessWidget {
  const EditNoteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: EditNoteViewBody(),
    );
  }
}

class EditNoteViewBody extends StatelessWidget {
  const EditNoteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(
          height: 50,
        ),
        CustomAppBar(
          icon: Icons.save,
          title: 'Edit Note',
        ),
        Padding(
          padding: EdgeInsets.only(left: 24.0, right: 24, top: 12),
          child: CustomTextField(hintText: "title"),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: CustomTextField(
            hintText: "Comment",
            maxLines: 5,
          ),
        )
      ],
    );
  }
}
