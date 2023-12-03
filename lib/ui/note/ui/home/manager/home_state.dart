part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class GetNotesSuccessState extends HomeState {}

class GetNotesFailureState extends HomeState {
  final String errorMessage;

  GetNotesFailureState(this.errorMessage);
}

class DeleteNoteSuccessState extends HomeState {}

class DeleteNoteFailureState extends HomeState {
  final String errorMessage;

  DeleteNoteFailureState(this.errorMessage);
}

class AddNoteSuccessState extends HomeState {}

class UpdateNoteSuccessState extends HomeState {}

