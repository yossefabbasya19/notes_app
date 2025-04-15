
sealed class EditNotesState {}

final class EditNotesInitial extends EditNotesState {}
final class EditNotesSuccess extends EditNotesState {}
final class EditNotesLoading extends EditNotesState {}
final class EditNotesFailure extends EditNotesState {}
