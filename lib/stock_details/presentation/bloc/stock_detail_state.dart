part of 'stock_detail_bloc.dart';

@immutable
abstract class StockDetailState {}

class StockDetailInitial extends StockDetailState {}

class StockDetailLoading extends StockDetailState {}

class StockDetailLoaded extends StockDetailState {
  final List<StockDetailEntity> stockDetails;

  StockDetailLoaded(this.stockDetails);
}

class StockDetailError extends StockDetailState {
  final String message;

  StockDetailError(this.message);
}
