import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:note_app/cubits/cubit/note_display_cubit.dart';
import 'package:note_app/cubits/note/note_cubit.dart';

import 'add_note_form.dart';

class AddModalBottomSheet extends StatelessWidget {
  const AddModalBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NoteCubit(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        child: SingleChildScrollView(
          child: BlocConsumer<NoteCubit, NoteState>(
            listener: (context, state) {
              if (state is NoteSuccess) {
                BlocProvider.of<NoteDisplayCubit>(context).fetchAllNotes();
                Navigator.pop(context);
              }
              if (state is NoteFailure) {
                debugPrint("failed ${state.errMsg}");
              }
            },
            builder: (context, state) {
              return AbsorbPointer(
                  absorbing: state is NoteLoading ? true : false,
                  child: Padding(
                    padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom),
                    child: const SingleChildScrollView(child: AddNoteForm()),
                  ));
            },
          ),
        ),
      ),
    );
  }
}
