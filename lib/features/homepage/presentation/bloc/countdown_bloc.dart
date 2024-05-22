import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'countdown_event.dart';
part 'countdown_state.dart';

class CountdownBloc extends Bloc<CountdownEvent, CountdownState> {
  CountdownBloc() : super(const CountdownLoading()) {
    on<StartCountdown>(_onStartCountdown);
    on<Tick>(_onTick);
  }
  //Vì sao late Timer _timer lại không countdown
  Timer? _timer;

  void _onStartCountdown(
      final StartCountdown event, final Emitter<CountdownState> emit) {
    _timer?.cancel();
    _startTimer(event.endTime, emit);
  }

  void _onTick(final Tick event, final Emitter<CountdownState> emit) {
    final remainingTime = state.remainingTime - const Duration(seconds: 1);
    if (remainingTime.isNegative) {
      _timer?.cancel();
      emit(const CountdownComplete());
    } else {
      emit(CountdownRunInProgress(remainingTime));
    }
  }

  void _startTimer(final DateTime endTime, final Emitter<CountdownState> emit) {
    emit(CountdownRunInProgress(endTime.difference(DateTime.now())));
    _timer = Timer.periodic(const Duration(seconds: 1), (final timer) {
      add(Tick());
    });
  }

  @override
  Future<void> close() {
    _timer?.cancel();
    return super.close();
  }
}
