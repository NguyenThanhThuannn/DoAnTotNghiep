part of 'countdown_bloc.dart';

abstract class CountdownEvent extends Equatable {
  const CountdownEvent();

  @override
  List<Object> get props => [];
}

class StartCountdown extends CountdownEvent {
  final DateTime targetDateTime;

  const StartCountdown(this.targetDateTime);

  @override
  List<Object> get props => [targetDateTime];
}

class Tick extends CountdownEvent {
  final DateTime targetDateTime;

  const Tick(this.targetDateTime);

  @override
  List<Object> get props => [targetDateTime];
}
