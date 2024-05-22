part of 'countdown_bloc.dart';

abstract class CountdownEvent extends Equatable {
  const CountdownEvent();

  @override
  List<Object> get props => [];
}

class StartCountdown extends CountdownEvent {

  const StartCountdown(this.endTime);
  final DateTime endTime;

  @override
  List<Object> get props => [endTime];
}

class Tick extends CountdownEvent {}