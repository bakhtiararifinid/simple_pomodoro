import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/pomodoro_bloc.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<PomodoroBloc>().state;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: ElevatedButton.icon(
        icon: Icon(_getButtonIcon(state)),
        label: Text(_getButtonText(state)),
        style: ElevatedButton.styleFrom(
          elevation: 0,
          padding: const EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        onPressed: () {
          final pomodoroBloc = context.read<PomodoroBloc>();
          if (state.status.isStarted) {
            pomodoroBloc.add(const StopTimer());
          } else {
            pomodoroBloc.add(const StartTimer());
          }
        },
      ),
    );
  }

  IconData _getButtonIcon(PomodoroState state) {
    if (state.status.isStarted) return Icons.stop;

    return Icons.play_arrow;
  }

  String _getButtonText(PomodoroState state) {
    if (state.status.isStarted) return 'Stop';

    return 'Start';
  }
}
