import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:stock_maket_tracker/top_stocks/domain/use_cases/get_top_stocks_use_case.dart';

import '../stock_details/data/data_source/online/stock_detail_api_data_source.dart';
import '../stock_details/data/repository/stock_detail_repository_impl.dart';
import '../stock_details/domain/repositories/stock_detail_repository.dart';
import '../stock_details/domain/use_cases/get_stock_detail_use_case.dart';
import '../stock_details/presentation/bloc/stock_detail_bloc.dart';
import '../top_stocks/data/date_source/online/stock_api_data_source.dart';
import '../top_stocks/data/repository/stock_repository_impl.dart';
import '../top_stocks/domain/repositories/stock_repository.dart';
import '../top_stocks/presentaion/bloc/top_stocks_bloc.dart';


final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Top Stocks

  // Bloc
  sl.registerFactory(() => TopStocksBloc(sl()));

  // Use case
  sl.registerLazySingleton(() => GetTopStocksUseCase(sl()));

  // Repository
  sl.registerLazySingleton<StockRepository>(
        () => StockRepositoryImpl(sl()),
  );

  // Data source
  sl.registerLazySingleton<StockApiDataSource>(
        () => StockApiDataSourceImpl(sl()),
  );

  //! Features - Stock Details

// Bloc
  sl.registerFactory(() => StockDetailBloc(sl()));

// Use case
  sl.registerLazySingleton(() => GetStockDetailUseCase(sl()));

// Repository
  sl.registerLazySingleton<StockDetailRepository>(
        () => StockDetailRepositoryImpl(sl()),
  );

// Data source
  sl.registerLazySingleton<StockDetailApiDataSource>(
        () => StockDetailApiDataSourceImpl(sl()),
  );



  //! External
  sl.registerLazySingleton(() => Dio());
}
