class StockLookupEntity {
  final String name;
  final String symbol;
  final String? exchangeName;
  final String? exchangeAcronym;
  final String? city;

  StockLookupEntity({
    required this.name,
    required this.symbol,
    this.exchangeName,
    this.exchangeAcronym,
    this.city,
  });
}
