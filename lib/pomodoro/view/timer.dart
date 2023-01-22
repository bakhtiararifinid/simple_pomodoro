import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/pomodoro_bloc.dart';

class Timer extends StatelessWidget {
  const Timer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final state = context.watch<PomodoroBloc>().state;

    return Container(
      padding: const EdgeInsets.all(16),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 300,
            width: 300,
            decoration: BoxDecoration(
              color: theme.primaryColorLight,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(16),
            child: CircularProgressIndicator(
              backgroundColor: Colors.white,
              value: state.progress,
              strokeWidth: 8,
            ),
          ),
          Center(
            child: Text(
              state.stringSecondsRemaining,
              style: textTheme.displayMedium,
            ),
          )
        ],
      ),
    );
  }
}
