import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_maket_tracker/stock_details/presentation/stock_detail_widgets/stock_detail_card_widget.dart';
import '../bloc/stock_detail_bloc.dart';


class StockDetailScreen extends StatelessWidget {
  final String symbol;

  const StockDetailScreen({super.key, required this.symbol});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details: $symbol')),
      body: BlocBuilder<StockDetailBloc, StockDetailState>(
        builder: (context, state) {
          if (state is StockDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is StockDetailError) {
            return Center(child: Text(state.message, style: const TextStyle(color: Colors.red)));
          } else if (state is StockDetailLoaded) {
            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: state.stockDetails.length,
              itemBuilder: (context, index) {
                final detail = state.stockDetails[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(  detail.date.split('T').first, // 👈 only show the date part
                 style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(child: StockDetailCardWidget(title: "Open", value: detail.open)),
                        const SizedBox(width: 8),
                        Expanded(child: StockDetailCardWidget(title: "Close", value: detail.close)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(child: StockDetailCardWidget(title: "High", value: detail.high)),
                        const SizedBox(width: 8),
                        Expanded(child: StockDetailCardWidget(title: "Low", value: detail.low)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(child: StockDetailCardWidget(title: "Volume", value: detail.volume)),
                        const SizedBox(width: 8),
                        const Expanded(child: SizedBox()), // empty space
                      ],
                    ),
                    const Divider(height: 24, thickness: 1),
                  ],
                );
              },
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
