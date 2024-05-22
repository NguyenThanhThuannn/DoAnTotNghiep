part of 'countdown_bloc.dart';

class CountdownState extends Equatable {
  const CountdownState(this.remainingTime);
  final Duration remainingTime;

  @override
  List<Object> get props => [remainingTime];
}

class CountdownLoading extends CountdownState {
  const CountdownLoading() : super(const Duration());
}

class CountdownRunInProgress extends CountdownState {
  const CountdownRunInProgress(super.remainingTime);
}

class CountdownComplete extends CountdownState {
  const CountdownComplete() : super(const Duration());
}
