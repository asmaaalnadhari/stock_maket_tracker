import '../entities/stock_lookup_entity.dart';

abstract class StockLookupRepository {
  Future<StockLookupEntity> getStockBySymbol(String symbol);
}
