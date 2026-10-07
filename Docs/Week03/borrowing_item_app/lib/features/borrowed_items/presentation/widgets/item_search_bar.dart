import 'package:flutter/material.dart';

class ItemSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final String query;
  final ValueChanged<String> onChanged;
  final VoidCallback onClear;

  const ItemSearchBar({
    super.key,
    required this.controller,
    required this.query,
    required this.onChanged,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: SearchBar(
        controller: controller,
        elevation: WidgetStateProperty.all(0),
        hintText: 'Search items or names...',
        leading: const Icon(Icons.search),
        trailing: query.isNotEmpty
            ? [
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: onClear,
                  tooltip: 'Clear search',
                ),
              ]
            : null,
        onChanged: onChanged,
      ),
    );
  }
}
