import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/pomodoro_bloc.dart';

class Sessions extends StatelessWidget {
  const Sessions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PomodoroBloc>().state;

    return Container(
      padding: const EdgeInsets.all(16),
      child: ToggleButtons(
        isSelected: [
          state.session.isFocus,
          state.session.isBreak,
        ],
        onPressed: (int index) {
          final pomodoroBloc = context.read<PomodoroBloc>();
          if (index == 0 && !state.session.isFocus) {
            pomodoroBloc.add(
              const ChangeSession(PomodoroSession.focusSession),
            );
          }
          if (index == 1 && !state.session.isBreak) {
            pomodoroBloc.add(
              const ChangeSession(PomodoroSession.breakSession),
            );
          }
        },
        borderRadius: BorderRadius.circular(16),
        children: const <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text('Focus'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Text('Break'),
          ),
        ],
      ),
    );
  }
}
