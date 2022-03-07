import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';

void main() {
  BlocOverrides.runZoned(
    () => runApp(const NotesApp()),
    // blocObserver: CounterObserver(),
  );
}
