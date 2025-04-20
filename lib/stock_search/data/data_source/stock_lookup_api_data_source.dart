import 'package:dio/dio.dart';
import '../../../../core/constant/api_constant.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/error/exceptions.dart';
import '../models/stock_lookup_model.dart';

abstract class StockLookupApiDataSourceDataSource {
  Future<StockLookupModel> getStockBySymbol(String symbol);
}

class StockLookupApiDataSourceDataSourceImpl implements StockLookupApiDataSourceDataSource {
  final Dio dio;

  StockLookupApiDataSourceDataSourceImpl(this.dio);

  @override
  Future<StockLookupModel> getStockBySymbol(String symbol) async {
    try {
      final response = await dio.get(
        "${ApiConstants.baseUrl}/tickers/$symbol",
        queryParameters: {
          'access_key': ApiConstants.accessKey,
          'search': symbol,
        },
      );

      final data = response.data['data'];
      return StockLookupModel.fromJson(data);
    } on DioException catch (error) {
      throw ErrorHandler.handleDioError(error);
    } catch (e) {
      throw ServerException('Unexpected error fetching stock lookup');
    }
  }
}
