import 'package:bloc/bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:meta/meta.dart';
import 'package:note_app/models/note_model.dart';

part 'note_state.dart';

class NoteCubit extends Cubit<NoteState> {
  NoteCubit() : super(NoteInitial());

  addNote(NoteModel note) async {
    try {
      var noteBox = Hive.box<NoteModel>("note_box");
      await noteBox.add(note);
      emit(NoteSuccess());
    } catch (e) {
      emit(NoteFailure(e.toString()));
    }
  }
}
