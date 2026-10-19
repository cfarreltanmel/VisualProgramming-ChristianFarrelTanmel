import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/borrowed_items.dart';

class BorrowedItemCard extends StatelessWidget {
  final BorrowedItem item;
  final VoidCallback onToggleReturned;
  final VoidCallback? onDelete;
  final bool isDeleteMode;

  const BorrowedItemCard({
    super.key,
    required this.item,
    required this.onToggleReturned,
    this.onDelete,
    this.isDeleteMode = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final isOverdue =
        !item.isReturned && item.itemDueDate.isBefore(DateTime.now());
    final formattedDate = DateFormat('dd/MM/yyyy').format(item.itemDueDate);

    return Card(
      elevation: 0,
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 6.0),
      color: isDeleteMode
          ? colorScheme.errorContainer.withValues(alpha: 0.3)
          : colorScheme.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: isDeleteMode
              ? colorScheme.error
              : (isOverdue ? colorScheme.error : colorScheme.outlineVariant),
          width: isDeleteMode || isOverdue ? 1.5 : 1.0,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: isDeleteMode ? onDelete : null,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isOverdue && !isDeleteMode) ...[
                Icon(
                  Icons.warning_amber_rounded,
                  color: colorScheme.error,
                  size: 24,
                ),
                const SizedBox(width: 12),
              ],
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.itemName,
                      style: textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        decoration: item.isReturned
                            ? TextDecoration.lineThrough
                            : TextDecoration.none,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'From: ${item.lenderName}',
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      'Due: $formattedDate',
                      style: textTheme.bodySmall?.copyWith(
                        color: isOverdue
                            ? colorScheme.error
                            : colorScheme.onSurfaceVariant,
                        fontWeight: isOverdue
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              if (isDeleteMode)
                IconButton(
                  icon: Icon(Icons.delete_forever, color: colorScheme.error),
                  onPressed: onDelete,
                  tooltip: 'Delete Item',
                )
              else
                Checkbox(
                  value: item.isReturned,
                  onChanged: (_) => onToggleReturned(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
