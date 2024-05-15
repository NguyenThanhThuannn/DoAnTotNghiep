
import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'countdown_event.dart';
part 'countdown_state.dart';

class CountdownBloc extends Bloc<CountdownEvent, CountdownState> {

  CountdownBloc() : super(const CountdownState(Duration.zero)) {
    on<StartCountdown>(_onStartCountdown);
    on<Tick>(_onTick);
  }
  //Vì sao late Timer _timer lại không countdown
  Timer? _timer;

  void _onStartCountdown(final StartCountdown event, final Emitter<CountdownState> emit) {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (final timer) {
      add(Tick(event.targetDateTime));
    });
  }

  void _onTick(final Tick event, final Emitter<CountdownState> emit) {
    final now = DateTime.now();
    final remaining = event.targetDateTime.difference(now);

    if (remaining.isNegative) {
      _timer?.cancel();
      emit(const CountdownState(Duration.zero));
    } else {
      emit(CountdownState(remaining));
    }
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}