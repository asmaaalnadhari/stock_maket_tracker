import 'package:flutter/material.dart';
import '../../../top_stocks/domain/entities/stock_entity.dart';

class StockTileWidget extends StatelessWidget {
  final StockEntity stock;

  const StockTileWidget({super.key, required this.stock});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 6),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        title: Text(stock.name, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(stock.symbol),
        trailing: ElevatedButton(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Show details for ${stock.name}')),
            );
          },
          child: const Text('Details'),
        ),
      ),
    );
  }
}
