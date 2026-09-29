import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  final int activeCount;
  final int overdueCount;

  const SummaryCard({
    super.key,
    required this.activeCount,
    required this.overdueCount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: [
              Text(
                '$activeCount',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text('Active Items', style: TextStyle(fontSize: 12)),
            ],
          ),
          Container(height: 30, width: 1, color: Colors.grey.shade400),
          Column(
            children: [
              Text(
                '$overdueCount',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: overdueCount > 0 ? Colors.red : Colors.black,
                ),
              ),
              const Text('Overdue', style: TextStyle(fontSize: 12)),
            ],
          ),
        ],
      ),
    );
  }
}
