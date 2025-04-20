import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/di_container.dart';
import '../bloc/top_stocks_bloc.dart';
import '../screens/top_stocks_screen.dart';

class TopStocksPage extends StatelessWidget {
  const TopStocksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<TopStocksBloc>()..add(FetchTopStocks()),
      child: const TopStocksScreen(),
    );
  }
}
