part of 'pomodoro_bloc.dart';

enum PomodoroSession { focusSession, breakSession }

extension PomodoroSessionX on PomodoroSession {
  bool get isFocus => this == PomodoroSession.focusSession;
  bool get isBreak => this == PomodoroSession.breakSession;
}

enum PomodoroStatus { initial, started, stopped }

extension PomodoroStatusX on PomodoroStatus {
  bool get isStarted => this == PomodoroStatus.started;
  bool get isStopped => this == PomodoroStatus.stopped;
}

class PomodoroState extends Equatable {
  const PomodoroState({
    this.session = PomodoroSession.focusSession,
    this.status = PomodoroStatus.initial,
    this.secondsPassed = 0,
  });

  final PomodoroSession session;
  final PomodoroStatus status;
  final int secondsPassed;

  PomodoroState copyWith({
    PomodoroSession? session,
    PomodoroStatus? status,
    int? secondsPassed,
  }) {
    return PomodoroState(
      session: session ?? this.session,
      status: status ?? this.status,
      secondsPassed: secondsPassed ?? this.secondsPassed,
    );
  }

  int get secondsDuration => session.isFocus ? 25 * 60 : 5 * 60;

  int get secondsRemaining => secondsDuration - secondsPassed;

  String get stringSecondsRemaining {
    final remainingMinutes = (secondsRemaining / 60).floor();
    final remainingSeconds = secondsRemaining % 60;
    return '${remainingMinutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  double get progress => secondsPassed / secondsDuration;

  @override
  List<Object?> get props => [session, status, secondsPassed];
}
