part of 'top_stocks_bloc.dart';

@immutable
abstract class TopStocksState {}

class TopStocksInitial extends TopStocksState {}


class TopStocksLoading extends TopStocksState {}

class TopStocksLoaded extends TopStocksState {
  final List<StockEntity> stocks;

   TopStocksLoaded(this.stocks);

}

class TopStocksError extends TopStocksState {
  final String message;

   TopStocksError(this.message);


}