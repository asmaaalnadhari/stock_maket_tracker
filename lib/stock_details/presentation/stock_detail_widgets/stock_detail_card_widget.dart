import 'package:flutter/material.dart';

class StockDetailCardWidget extends StatelessWidget {
  final String title;
  final double value;

  const StockDetailCardWidget({
    super.key,
    required this.title,
    required this.value,
  });

  Color get valueColor {
    if (title.toLowerCase().contains('open') || title.toLowerCase().contains('low')) {
      return Colors.redAccent;
    } else if (title.toLowerCase().contains('close') || title.toLowerCase().contains('high')) {
      return Colors.green;
    } else {
      return Colors.blueGrey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.grey)),
            const SizedBox(height: 4),
            Text(
              value.toStringAsFixed(2),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: valueColor),
            ),
          ],
        ),
      ),
    );
  }
}
