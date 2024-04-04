import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:note_app/models/note_model.dart';

part 'note_display_state.dart';

class NoteDisplayCubit extends Cubit<NoteDisplayState> {
  NoteDisplayCubit() : super(NoteDisplayInitial());

  List<NoteModel>? notes;
  fetchAllNotes()  {
    var noteBox = Hive.box<NoteModel>("note_box");
    notes = noteBox.values.toList();
    emit(NoteDisplaySuccess());
  }
}
