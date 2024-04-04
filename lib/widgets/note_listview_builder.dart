import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/cubit/note_display_cubit.dart';
import 'package:note_app/models/note_model.dart';
import 'package:note_app/widgets/note_item.dart';

class NoteListViewBuilder extends StatelessWidget {
  const NoteListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<NoteDisplayCubit, NoteDisplayState>(
        builder: (context, state) {
          List<NoteModel> notes = BlocProvider.of<NoteDisplayCubit>(context).notes ?? [];
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: notes.length,
                itemBuilder: (ctx, index) {
                  return  Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16),
                    child: NoteItem(
                      note: notes[index],
                    ),
                  );
                }),
          );
        },
      ),
    );
  }
}
