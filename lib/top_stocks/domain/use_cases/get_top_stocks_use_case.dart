import '../entities/stock_entity.dart';
import '../repositories/stock_repository.dart';

class GetTopStocks {
  final StockRepository repository;

  GetTopStocks(this.repository);

  Future<List<StockEntity>> call() async {
    return await repository.getTopStocks();
  }
}
