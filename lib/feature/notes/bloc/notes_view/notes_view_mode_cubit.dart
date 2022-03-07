import 'package:bloc/bloc.dart';

class NotesViewModeCubit extends Cubit<bool> {
  NotesViewModeCubit() : super(true);

  // void changeViewType() => emit(!state);
  void changeViewMode() {
    (state == true ? _trueToFalse() : _falseToTrue());
  }

  void _trueToFalse() {
    emit(false);
  }

  void _falseToTrue() {
    emit(true);
  }
}
