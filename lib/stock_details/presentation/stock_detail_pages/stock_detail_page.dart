import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di_container.dart';
import '../bloc/stock_detail_bloc.dart';
import '../stock_detail_screens/stock_detail_screen.dart';

class StockDetailPage extends StatelessWidget {
  final String symbol;

  const StockDetailPage({super.key, required this.symbol});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<StockDetailBloc>()..add(FetchStockDetail(symbol)),
      child: StockDetailScreen(symbol: symbol),
    );
  }
}
