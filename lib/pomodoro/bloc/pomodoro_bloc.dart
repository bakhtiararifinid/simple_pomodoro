import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'pomodoro_event.dart';
part 'pomodoro_state.dart';

class PomodoroBloc extends Bloc<PomodoroEvent, PomodoroState> {
  PomodoroBloc() : super(const PomodoroState()) {
    on<StartTimer>(_onStartTimer);
    on<StopTimer>(_onStopTimer);
    on<AddSecondsPassed>(_onAddSecondsPassed);
    on<ChangeSession>(_onChangeSession);
  }

  Timer? _timer;

  void _onStartTimer(
    StartTimer event,
    Emitter<PomodoroState> emit,
  ) {
    emit(state.copyWith(
      status: PomodoroStatus.started,
    ));

    if (_timer != null) _clearTimer();

    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        if (state.secondsRemaining > 0) {
          add(const AddSecondsPassed());
        } else {
          add(const StopTimer());
        }
      },
    );
  }

  Future<void> _onStopTimer(
    StopTimer event,
    Emitter<PomodoroState> emit,
  ) async {
    _clearTimer();

    final session = state.session.isFocus
        ? PomodoroSession.breakSession
        : PomodoroSession.focusSession;
    emit(state.copyWith(
      session: session,
      status: PomodoroStatus.stopped,
      secondsPassed: 0,
    ));
  }

  Future<void> _onAddSecondsPassed(
    AddSecondsPassed event,
    Emitter<PomodoroState> emit,
  ) async {
    emit(state.copyWith(
      secondsPassed: state.secondsPassed + 1,
    ));
  }

  Future<void> _onChangeSession(
    ChangeSession event,
    Emitter<PomodoroState> emit,
  ) async {
    _clearTimer();
    emit(state.copyWith(
      session: event.session,
      status: PomodoroStatus.stopped,
      secondsPassed: 0,
    ));
  }

  _clearTimer() {
    _timer?.cancel();
    _timer = null;
  }
}
