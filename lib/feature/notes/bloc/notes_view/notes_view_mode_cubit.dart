import 'package:hydrated_bloc/hydrated_bloc.dart';

class NotesViewModeCubit extends HydratedCubit<bool> {
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

  @override
  bool fromJson(Map<String, dynamic> json) => json['value'] as bool;
  @override
  Map<String, bool> toJson(bool state) => {'value': state};
}
