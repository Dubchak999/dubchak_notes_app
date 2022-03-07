import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'notes_form_page_state.dart';

class NotesFormPageCubit extends Cubit<NotesFormPageState> {
  NotesFormPageCubit() : super(NotesFormPageInitial());
}
