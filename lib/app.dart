import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pomodoro/bloc/pomodoro_bloc.dart';
import 'pomodoro/view/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PomodoroBloc>().state;
    return MaterialApp(
      title: 'Simple Pomodoro',
      theme: ThemeData(
        primarySwatch: state.session.isFocus ? Colors.deepOrange : Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
