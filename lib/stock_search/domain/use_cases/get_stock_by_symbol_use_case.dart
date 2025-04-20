import '../entities/stock_lookup_entity.dart';
import '../repositories/stock_lookup_repository.dart';

class GetStockBySymbolUseCase {
  final StockLookupRepository repository;

  GetStockBySymbolUseCase(this.repository);

  Future<StockLookupEntity> call(String symbol) {
    return repository.getStockBySymbol(symbol);
  }
}
