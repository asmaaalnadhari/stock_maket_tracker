import 'package:dio/dio.dart';

import 'package:dio/dio.dart';
import 'package:stock_maket_tracker/stock_details/data/models/stock_detail_model.dart';

import '../../../../core/constant/api_constant.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/error/exceptions.dart';



abstract class StockDetailApiDataSource {
  Future<List<StockDetailModel>> getDetailStockData(String symbol);
}
class StockDetailApiDataSourceImpl implements StockDetailApiDataSource {
  final Dio dio;

  StockDetailApiDataSourceImpl(this.dio);

  @override

  Future<List<StockDetailModel>> getDetailStockData(String symbol) async {
    try {
      final response = await dio.get(
        "${ApiConstants.baseUrl}/eod",
        queryParameters: {
          'access_key': ApiConstants.accessKey,
          'symbols': symbol,
          'limit': 5,
        },
      );
      final List data = response.data['data'];
      return data.map((json) => StockDetailModel.fromJson(json)).toList();
    } on DioException catch (error) {
      throw ErrorHandler.handleDioError(error);
    } catch (e) {
      throw ServerException('Something went wrong');
    }
  }
}
