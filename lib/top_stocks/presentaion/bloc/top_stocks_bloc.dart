import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import '../../../core/error/failures.dart';
import '../../domain/entities/stock_entity.dart';
import '../../domain/use_cases/get_top_stocks_use_case.dart';

part 'top_stocks_event.dart';
part 'top_stocks_state.dart';


class TopStocksBloc extends Bloc<TopStocksEvent, TopStocksState> {
  final GetTopStocksUseCase getTopStocksUseCase;

  TopStocksBloc(this.getTopStocksUseCase) : super(TopStocksInitial()) {
    on<FetchTopStocks>(_onFetchTopStocks);
  }

  Future<void> _onFetchTopStocks(
      FetchTopStocks event, Emitter<TopStocksState> emit) async {
    emit(TopStocksLoading());
    try {
      final stocks = await getTopStocksUseCase();
      emit(TopStocksLoaded(stocks));
    } catch (e) {
      final message = _mapErrorToMessage(e);
      emit(TopStocksError(message));
    }
  }

  String _mapErrorToMessage(Object error) {
    if (error is Failure) return error.message;
    return "Unexpected error occurred";
  }
}
