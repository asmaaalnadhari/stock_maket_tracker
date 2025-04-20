import '../../domain/entities/stock_lookup_entity.dart';

class StockLookupModel {
  final String name;
  final String symbol;
  final StockExchangeModel? stockExchange;

  StockLookupModel({
    required this.name,
    required this.symbol,
    this.stockExchange,
  });

  factory StockLookupModel.fromJson(Map<String, dynamic> json) {
    return StockLookupModel(
      name: json['name'] ?? '',
      symbol: json['symbol'] ?? '',
      stockExchange: json['stock_exchange'] != null
          ? StockExchangeModel.fromJson(json['stock_exchange'])
          : null,
    );
  }

  StockLookupEntity toEntity() => StockLookupEntity(
    name: name,
    symbol: symbol,
    exchangeName: stockExchange?.name,
    exchangeAcronym: stockExchange?.acronym,
    city: stockExchange?.city,
  );
}

class StockExchangeModel {
  final String? name;
  final String? acronym;
  final String? city;

  StockExchangeModel({
    this.name,
    this.acronym,
    this.city,
  });

  factory StockExchangeModel.fromJson(Map<String, dynamic> json) {
    return StockExchangeModel(
      name: json['name'],
      acronym: json['acronym'],
      city: json['city'],
    );
  }
}
