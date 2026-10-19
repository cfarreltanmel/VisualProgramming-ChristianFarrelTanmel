import 'package:flutter/material.dart';

import '../domain/borrowed_items.dart';
import 'widgets/borrowed_items_card.dart';
import 'widgets/empty_items_view.dart';
import 'widgets/home_fab_stack.dart';
import 'widgets/item_search_bar.dart';
import 'widgets/summary_card.dart';

class HomeScreen extends StatefulWidget {
  final List<BorrowedItem>? initialItems;
  final ThemeMode currentThemeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  const HomeScreen({
    super.key,
    this.initialItems,
    required this.currentThemeMode,
    required this.onThemeModeChanged,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();
  String _searchQuery = '';
  late List<BorrowedItem> _items;
  bool _isDeleteMode = false;

  @override
  void initState() {
    super.initState();
    _items =
        widget.initialItems ??
        [
          BorrowedItem(
            id: '1',
            itemName: 'Game Controller',
            lenderName: 'Jovian',
            itemDueDate: DateTime.now().subtract(const Duration(days: 2)),
            isReturned: false,
          ),
          BorrowedItem(
            id: '2',
            itemName: 'Rp 10.000',
            lenderName: 'Steven',
            itemDueDate: DateTime.now().add(const Duration(days: 5)),
            isReturned: false,
          ),
        ];
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _clearSearch() {
    _searchController.clear();
    setState(() => _searchQuery = '');
  }

  void _showDeleteDialog(BorrowedItem item) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Borrowed Item?'),
        content: Text('Delete "${item.itemName}"?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(ctx).colorScheme.error,
            ),
            onPressed: () {
              setState(() => _items.removeWhere((i) => i.id == item.id));
              Navigator.pop(ctx);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;
    final filtered = _items.where((i) {
      final q = _searchQuery.toLowerCase();
      return i.itemName.toLowerCase().contains(q) ||
          i.lenderName.toLowerCase().contains(q);
    }).toList();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(_isDeleteMode ? 'Delete Items' : 'Borrowed Items'),
        backgroundColor: _isDeleteMode ? cs.errorContainer : null,
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SummaryCard(
                    activeCount: _items.where((i) => !i.isReturned).length,
                    overdueCount: _items
                        .where(
                          (i) =>
                              !i.isReturned &&
                              i.itemDueDate.isBefore(DateTime.now()),
                        )
                        .length,
                  ),
                  ItemSearchBar(
                    controller: _searchController,
                    query: _searchQuery,
                    onChanged: (v) => setState(() => _searchQuery = v),
                    onClear: _clearSearch,
                  ),
                ],
              ),
            ),
            if (filtered.isEmpty)
              SliverFillRemaining(
                hasScrollBody: false,
                child: EmptyItemsView(
                  searchQuery: _searchQuery,
                  onClearSearch: _clearSearch,
                ),
              )
            else
              SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final item = filtered[index];
                  return BorrowedItemCard(
                    item: item,
                    isDeleteMode: _isDeleteMode,
                    onToggleReturned: () => setState(() {
                      final i = _items.indexWhere((it) => it.id == item.id);
                      if (i != -1) {
                        _items[i] = _items[i].copyWith(
                          isReturned: !_items[i].isReturned,
                        );
                      }
                    }),
                    onDelete: () => _showDeleteDialog(item),
                  );
                }, childCount: filtered.length),
              ),
          ],
        ),
      ),
      floatingActionButton: HomeFabStack(
        currentThemeMode: widget.currentThemeMode,
        onThemeModeChanged: widget.onThemeModeChanged,
        isDeleteMode: _isDeleteMode,
        onToggleDeleteMode: () =>
            setState(() => _isDeleteMode = !_isDeleteMode),
        onItemAdded: (item) => setState(() => _items.add(item)),
      ),
    );
  }
}
