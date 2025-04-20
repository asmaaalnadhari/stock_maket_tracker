import 'package:dio/dio.dart';

import '../../../../core/constant/api_constant.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/error/exceptions.dart';
import '../../models/stock_model.dart';

abstract class StockRemoteDataSource {
  Future<List<StockModel>> getTopStocks();
}

class StockRemoteDataSourceImpl implements StockRemoteDataSource {
  final Dio dio;

  StockRemoteDataSourceImpl(this.dio);

  @override
  Future<List<StockModel>> getTopStocks() async {
    try {
      final response = await dio.get(
        "${ApiConstants.baseUrl}/tickers",
        queryParameters: {
          'access_key': ApiConstants.accessKey,
          'limit': 10,
        },
      );
      final List data = response.data['data'];
      return data.map((json) => StockModel.fromJson(json)).toList();
    } on DioException catch (error) {
      throw ErrorHandler.handleDioError(error);
    } catch (e) {
      throw ServerException('Something went wrong');
    }
  }
}
