import 'package:stock_maket_tracker/stock_search/data/data_source/stock_lookup_api_data_source.dart';

import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/stock_lookup_entity.dart';
import '../../domain/repositories/stock_lookup_repository.dart';

class StockLookupRepositoryImpl implements StockLookupRepository {
  final StockLookupApiDataSource remoteDataSource;

  StockLookupRepositoryImpl(this.remoteDataSource);

  @override
  Future<StockLookupEntity> getStockBySymbol(String symbol) async {
    try {
      final model = await remoteDataSource.getStockBySymbol(symbol);
      return model.toEntity();
    } on ServerException catch (e) {
      throw ServerFailure(e.message);
    }
  }
}
