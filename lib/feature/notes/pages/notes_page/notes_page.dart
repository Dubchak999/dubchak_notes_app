import 'package:dubchak_notes_app/feature/notes/bloc/notes_view/notes_view_mode_cubit.dart';
import 'package:dubchak_notes_app/feature/notes/pages/notes_page/notes_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NotesPage extends StatelessWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NotesViewModeCubit>(
      create: (context) => NotesViewModeCubit(),
      child: NotesView(),
    );
  }
}
