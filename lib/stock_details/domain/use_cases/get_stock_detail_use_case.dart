
import 'package:stock_maket_tracker/stock_details/domain/repositories/stock_detail_repository.dart';

import '../entities/stock_detail_entity.dart';

class GetStockDetailUseCase {
  final StockDetailRepository repository;

  GetStockDetailUseCase(this.repository);

  Future<List<StockDetailEntity>> call(String symbol) {
    return repository.getStockDetailData(symbol);
  }
}
