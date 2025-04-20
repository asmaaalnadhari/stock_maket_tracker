import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../domain/entities/stock_entity.dart';
import '../../domain/repositories/stock_repository.dart';
import '../date_source/online/stock_api_data_source.dart';

class StockRepositoryImpl implements StockRepository {
  final StockRemoteDataSource remoteDataSource;

  StockRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<StockEntity>> getTopStocks() async {
    try {
      final models = await remoteDataSource.getTopStocks();
      return models.map((model) => model.toEntity()).toList();
    } on ServerException catch (e) {
      throw ServerFailure(e.message);
    }
  }

}
