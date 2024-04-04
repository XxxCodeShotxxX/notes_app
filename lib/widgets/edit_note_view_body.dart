import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/cubit/note_display_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/custom_appbar.dart';
import 'package:note_app/widgets/custom_textfield.dart';

class EditNoteViewBody extends StatefulWidget {
  const EditNoteViewBody({super.key, required this.note});
  final NoteModel note;

  @override
  State<EditNoteViewBody> createState() => _EditNoteViewBodyState();
}

class _EditNoteViewBodyState extends State<EditNoteViewBody> {
  String? title, comment;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        CustomAppBar(
          onPressed: () {
            widget.note.title = title ?? widget.note.title;
            widget.note.subtitle = comment ?? widget.note.subtitle;
            widget.note.save();
            BlocProvider.of<NoteDisplayCubit>(context).fetchAllNotes();
            Navigator.pop(context);
          },
          icon: Icons.save,
          title: 'Edit Note',
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24, top: 12),
          child: CustomTextField(
            hintText: widget.note.title,
            onChanged: (value) {
              title = value;
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: CustomTextField(
            onChanged: (value) {
              comment = value;
            },
            hintText: widget.note.subtitle,
            maxLines: 5,
          ),
        )
      ],
    );
  }
}
