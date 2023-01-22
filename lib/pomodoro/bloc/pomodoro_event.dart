part of 'pomodoro_bloc.dart';

abstract class PomodoroEvent extends Equatable {
  const PomodoroEvent();

  @override
  List<Object> get props => [];
}

class StartTimer extends PomodoroEvent {
  const StartTimer();
}

class StopTimer extends PomodoroEvent {
  const StopTimer();
}

class AddSecondsPassed extends PomodoroEvent {
  const AddSecondsPassed();
}

class ChangeSession extends PomodoroEvent {
  const ChangeSession(this.session);

  final PomodoroSession session;
}
