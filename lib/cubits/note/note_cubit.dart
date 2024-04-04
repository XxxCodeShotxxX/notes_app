import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:note_app/models/note_model.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  Color? color = const Color(0xffCDFADB);
  addNote(NoteModel note) async {
    try {
      note.color = color!.value;
      var noteBox = Hive.box<NoteModel>("note_box");
      await noteBox.add(note);
      emit(NoteSuccess());
    } catch (e) {
      emit(NoteFailure(e.toString()));
    }
  }
}
