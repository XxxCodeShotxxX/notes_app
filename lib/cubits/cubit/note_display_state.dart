part of 'note_display_cubit.dart';

@immutable
sealed class NoteDisplayState {}

final class NoteDisplayInitial extends NoteDisplayState {}

final class NoteDisplayLoading extends NoteDisplayState {}

final class NoteDisplaySuccess extends NoteDisplayState {

}

final class NoteDisplayFailed extends NoteDisplayState {
  final String errMsg;

  NoteDisplayFailed({required this.errMsg});
}
