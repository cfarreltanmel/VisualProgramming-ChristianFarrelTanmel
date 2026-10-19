import 'package:flutter/material.dart';

import '../../domain/borrowed_items.dart';
import '../add_item_screen.dart';
import '../theme_selection_screen.dart';

class HomeFabStack extends StatelessWidget {
  final ThemeMode currentThemeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;
  final bool isDeleteMode;
  final VoidCallback onToggleDeleteMode;
  final ValueChanged<BorrowedItem> onItemAdded;

  const HomeFabStack({
    super.key,
    required this.currentThemeMode,
    required this.onThemeModeChanged,
    required this.isDeleteMode,
    required this.onToggleDeleteMode,
    required this.onItemAdded,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        FloatingActionButton.small(
          heroTag: 'theme_fab',
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ThemeSelectionScreen(
                currentThemeMode: currentThemeMode,
                onThemeModeChanged: onThemeModeChanged,
              ),
            ),
          ),
          child: const Icon(Icons.palette_outlined),
        ),
        const SizedBox(height: 12),
        FloatingActionButton.small(
          heroTag: 'delete_fab',
          backgroundColor: isDeleteMode ? cs.errorContainer : null,
          onPressed: onToggleDeleteMode,
          child: Icon(
            isDeleteMode ? Icons.close : Icons.delete_outline,
            color: isDeleteMode ? cs.onErrorContainer : null,
          ),
        ),
        const SizedBox(height: 12),
        FloatingActionButton.extended(
          heroTag: 'add_item_fab',
          onPressed: () async {
            final item = await Navigator.push<BorrowedItem>(
              context,
              MaterialPageRoute(builder: (_) => const AddItemScreen()),
            );
            if (item != null) {
              onItemAdded(item);
            }
          },
          icon: const Icon(Icons.add),
          label: const Text('Add Item'),
        ),
      ],
    );
  }
}
