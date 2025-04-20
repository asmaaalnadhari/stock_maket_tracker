import '../../domain/entities/stock_entity.dart';

class StockModel {
  final String symbol;
  final String name;

  StockModel({
    required this.symbol,
    required this.name,
  });

  factory StockModel.fromJson(Map<String, dynamic> json) {
    return StockModel(
      symbol: json['symbol'] ?? '',
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'symbol': symbol,
      'name': name,
    };
  }

  StockEntity toEntity() => StockEntity(
    symbol: symbol,
    name: name,
  );
}


