import '../entities/stock_entity.dart';
import '../repositories/stock_repository.dart';

class GetTopStocksUseCase {
  final StockRepository repository;

  GetTopStocksUseCase(this.repository);

  Future<List<StockEntity>> call() async {
    return await repository.getTopStocks();
  }
}
