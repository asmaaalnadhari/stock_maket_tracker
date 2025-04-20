import 'package:stock_maket_tracker/stock_details/domain/entities/stock_detail_entity.dart';

import '../../../core/error/exceptions.dart';
import '../../../core/error/failures.dart';
import '../../domain/repositories/stock_detail_repository.dart';
import '../data_source/online/stock_detail_api_data_source.dart';

class StockDetailRepositoryImpl implements StockDetailRepository {
  final StockDetailApiDataSource remoteDataSource;

  StockDetailRepositoryImpl(this.remoteDataSource);



  @override
  Future<List<StockDetailEntity>> getStockDetailData(String symbol) async {
    try {
      final models = await remoteDataSource.getDetailStockData(symbol);
      return models.map((model) => model.toEntity()).toList();
    } on ServerException catch (e) {
      throw ServerFailure(e.message);
    }
  }
}
