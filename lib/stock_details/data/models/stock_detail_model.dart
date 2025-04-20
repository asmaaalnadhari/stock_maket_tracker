import '../../domain/entities/stock_detail_entity.dart';

class StockDetailModel {
  final String date;
  final double open;
  final double high;
  final double low;
  final double close;
  final double volume;

  StockDetailModel({
    required this.date,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
  });

  factory StockDetailModel.fromJson(Map<String, dynamic> json) {
    return StockDetailModel(
      date: json['date'],
      open: (json['open'] ?? 0).toDouble(),
      high: (json['high'] ?? 0).toDouble(),
      low: (json['low'] ?? 0).toDouble(),
      close: (json['close'] ?? 0).toDouble(),
      volume: (json['volume'] ?? 0).toDouble(),
    );
  }


  StockDetailEntity toEntity() => StockDetailEntity(
    date: date,
    open: open,
    high: high,
    low: low,
    close: close,
    volume: volume,
  );
}

