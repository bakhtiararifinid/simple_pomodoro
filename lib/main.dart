import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app.dart';
import 'pomodoro/bloc/pomodoro_bloc.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => PomodoroBloc(),
      child: const App(),
    ),
  );
}
