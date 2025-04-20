import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/top_stocks_bloc.dart';
import '../widgets/stock_tile_widget.dart';

class TopStocksScreen extends StatelessWidget {
  const TopStocksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Stocks'),
        centerTitle: true,
      ),
      body: BlocBuilder<TopStocksBloc, TopStocksState>(
        builder: (context, state) {
          if (state is TopStocksLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is TopStocksError) {
            return Center(child: Text(state.message, style: const TextStyle(color: Colors.red)));
          } else if (state is TopStocksLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                context.read<TopStocksBloc>().add(FetchTopStocks());
              },
              child: ListView.separated(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                itemCount: state.stocks.length,
                separatorBuilder: (_, __) => const Divider(height: 1),
                itemBuilder: (context, index) {
                  return StockTileWidget(stock: state.stocks[index]);
                },
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
