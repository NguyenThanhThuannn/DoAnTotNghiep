import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import '../../../../core/data_state.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_todaysdeals.dart';

part 'home_page_todaysdeals_event.dart';
part 'home_page_todaysdeals_state.dart';

class HomePageTodaysdealsBloc extends Bloc<HomePageTodaysdealsEvent, HomePageTodaysdealsState> {
  HomePageTodaysdealsBloc(this._getTodaysDealsUseCase) : super(HomePageTodaysdealsLoading()) {
    on<GetTodaysDeals>(onGetTodaysDeals);
  }
  final GetTodaysDealsUseCase _getTodaysDealsUseCase;
  Future<void> onGetTodaysDeals (final GetTodaysDeals event, final Emitter<HomePageTodaysdealsState> emit) async{
    final dataState = await _getTodaysDealsUseCase();
    if(dataState is DataSucces && dataState.data!.isNotEmpty){
      emit(HomePageTodaysdealsLoaded(dataState.data!));
    }
    if(dataState is DataFailed){
      emit(HomePageTodaysdealsError(dataState.error!));
    }
  }
}
