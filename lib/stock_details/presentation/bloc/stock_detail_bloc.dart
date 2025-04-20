import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/error/failures.dart';
import '../../domain/entities/stock_detail_entity.dart';
import '../../domain/use_cases/get_stock_detail_use_case.dart';

part 'stock_detail_event.dart';
part 'stock_detail_state.dart';



class StockDetailBloc extends Bloc<StockDetailEvent, StockDetailState> {
  final GetStockDetailUseCase getStockDetailUseCase;

  StockDetailBloc(this.getStockDetailUseCase) : super(StockDetailInitial()) {
    on<FetchStockDetail>(_onFetchStockDetail);
  }

  Future<void> _onFetchStockDetail(
      FetchStockDetail event,
      Emitter<StockDetailState> emit,
      ) async {
    emit(StockDetailLoading());
    try {
      final details = await getStockDetailUseCase(event.symbol);
      emit(StockDetailLoaded(details));
    } catch (error) {
      final message = _mapErrorToMessage(error);
      emit(StockDetailError(message));
    }
  }

  String _mapErrorToMessage(Object error) {
    if (error is Failure) return error.message;
    return 'Unexpected error occurred';
  }
}
