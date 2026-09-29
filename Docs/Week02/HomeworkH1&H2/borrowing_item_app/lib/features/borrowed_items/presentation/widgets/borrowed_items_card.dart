import 'package:flutter/material.dart';

import '../../domain/borrowed_items.dart';

class BorrowedItemCard extends StatelessWidget {
  final BorrowedItem item;
  final VoidCallback onToggleReturned;

  const BorrowedItemCard({
    super.key,
    required this.item,
    required this.onToggleReturned,
  });

  @override
  Widget build(BuildContext context) {
    final bool isOverdue =
        !item.isReturned && item.itemDueDate.isBefore(DateTime.now());

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ListTile(
        leading: Icon(
          item.isReturned
              ? Icons.check_circle
              : (isOverdue ? Icons.warning : Icons.bookmark),
          color: item.isReturned
              ? Colors.green
              : (isOverdue ? Colors.red : Colors.blue),
        ),
        title: Text(
          item.itemName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            decoration: item.isReturned ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(
          'From: ${item.lenderName}\nDue: ${item.itemDueDate.day}/${item.itemDueDate.month}/${item.itemDueDate.year}',
        ),
        isThreeLine: true,
        trailing: Checkbox(
          value: item.isReturned,
          onChanged: (_) => onToggleReturned(),
        ),
      ),
    );
  }
}
