part of 'stock_detail_bloc.dart';

@immutable
abstract class StockDetailEvent {}

class FetchStockDetail extends StockDetailEvent {
  final String symbol;

  FetchStockDetail(this.symbol);
}
