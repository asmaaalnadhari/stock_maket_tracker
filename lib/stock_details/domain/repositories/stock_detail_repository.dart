
import '../entities/stock_detail_entity.dart';

abstract class StockDetailRepository {
  Future<List<StockDetailEntity>> getStockDetailData(String symbol);
}
