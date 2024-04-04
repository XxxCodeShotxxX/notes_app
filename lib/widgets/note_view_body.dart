import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/widgets/custom_appbar.dart';
import 'package:note_app/widgets/note_listview_builder.dart';

import '../cubits/cubit/note_display_cubit.dart';

class NoteViewBody extends StatefulWidget {
  const NoteViewBody({super.key});

  @override
  State<NoteViewBody> createState() => _NoteViewBodyState();
}

class _NoteViewBodyState extends State<NoteViewBody> {
  @override
  void initState() {
    BlocProvider.of<NoteDisplayCubit>(context).fetchAllNotes();
    super.initState();
  }

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
