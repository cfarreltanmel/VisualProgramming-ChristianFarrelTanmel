import 'package:flutter/material.dart';

import '../domain/borrowed_items.dart';
import 'widgets/summary_card.dart';
import 'widgets/borrowed_items_card.dart';
import 'widgets/item_search_bar.dart';
import 'widgets/empty_items_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<BorrowedItem> _items = [
    BorrowedItem(
      id: '1',
      itemName: 'Game Controller',
      lenderName: 'Jovian',
      itemDueDate: DateTime.now().add(const Duration(days: 2)),
    ),
    BorrowedItem(
      id: '2',
      itemName: 'Rp 10.000',
      lenderName: 'Steven',
      itemDueDate: DateTime.now().subtract(const Duration(days: 1)),
    ),
  ];

  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _toggleReturnedStatus(String id) {
    setState(() {
      final index = _items.indexWhere((item) => item.id == id);
      if (index != -1) {
        _items[index] = _items[index].copyWith(
          isReturned: !_items[index].isReturned,
        );
      }
    });
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() {
      _searchQuery = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    final activeCount = _items.where((item) => !item.isReturned).length;
    final overdueCount = _items
        .where(
          (item) =>
              !item.isReturned && item.itemDueDate.isBefore(DateTime.now()),
        )
        .length;
    final filteredItems = _items.where((item) {
      final query = _searchQuery.toLowerCase();
      final matchesitemName = item.itemName.toLowerCase().contains(query);
      final matcheslenderName = item.lenderName.toLowerCase().contains(query);
      return matchesitemName || matcheslenderName;
    }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text('Borrowed Items')),
      body: Column(
        children: [
          SummaryCard(activeCount: activeCount, overdueCount: overdueCount),

          ItemSearchBar(
            controller: _searchController,
            query: _searchQuery,
            onChanged: (val) => setState(() => _searchQuery = val),
            onClear: _clearSearch,
          ),

          Expanded(
            child: filteredItems.isEmpty
                ? EmptyItemsView(
                    searchQuery: _searchQuery,
                    onClearSearch: _clearSearch,
                  )
                : ListView.builder(
                    itemCount: filteredItems.length,
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];

                      return BorrowedItemCard(
                        item: item,
                        onToggleReturned: () => _toggleReturnedStatus(item.id),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
