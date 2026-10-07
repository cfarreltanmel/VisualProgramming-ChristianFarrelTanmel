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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final bool isOverdue =
        !item.isReturned && item.itemDueDate.isBefore(DateTime.now());

    // Dynamically query theme token colors
    final Color iconColor = item.isReturned
        ? colorScheme.secondary
        : (isOverdue ? colorScheme.error : colorScheme.primary);

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      child: ListTile(
        leading: Icon(
          item.isReturned
              ? Icons.check_circle
              : (isOverdue ? Icons.warning : Icons.bookmark),
          color: iconColor,
        ),
        title: Text(
          item.itemName,
          style: textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.bold,
            decoration: item.isReturned ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(
          'From: ${item.lenderName}\nDue: ${item.itemDueDate.day}/${item.itemDueDate.month}/${item.itemDueDate.year}',
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurfaceVariant,
          ),
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
