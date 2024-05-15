part of 'countdown_bloc.dart';

class CountdownState extends Equatable {
  final Duration duration;

  const CountdownState(this.duration);

  @override
  List<Object> get props => [duration];
}
