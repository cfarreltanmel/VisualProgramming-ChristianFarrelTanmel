import 'package:flutter/material.dart';

class EmptyItemsView extends StatelessWidget {
  final String searchQuery;
  final VoidCallback? onClearSearch;
  final VoidCallback? onAddItem;

  const EmptyItemsView({
    super.key,
    required this.searchQuery,
    this.onClearSearch,
    this.onAddItem,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final bool isSearching = searchQuery.isNotEmpty;

    return SingleChildScrollView(
      key: const Key('empty-state'),
      physics: const AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isSearching ? Icons.search_off : Icons.inbox,
              size: 72,
              color: colorScheme.outline,
            ),
            const SizedBox(height: 16),
            Text(
              isSearching
                  ? 'No items found matching "$searchQuery"'
                  : 'No borrowed items yet!',
              textAlign: TextAlign.center,
              style: textTheme.titleMedium?.copyWith(
                color: colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              isSearching
                  ? 'Try checking for typos or clear your search query.'
                  : 'Get started by adding items you have borrowed or lent out.',
              textAlign: TextAlign.center,
              style: textTheme.bodySmall?.copyWith(color: colorScheme.outline),
            ),
            const SizedBox(height: 20),
            if (isSearching && onClearSearch != null)
              FilledButton.tonal(
                key: const Key('order-button'),
                onPressed: onClearSearch,
                child: const Text('Clear Search'),
              )
            else if (!isSearching && onAddItem != null)
              FilledButton.icon(
                key: const Key('order-button'),
                onPressed: onAddItem,
                icon: const Icon(Icons.add),
                label: const Text('Add First Item'),
              ),
          ],
        ),
      ),
    );
  }
}
