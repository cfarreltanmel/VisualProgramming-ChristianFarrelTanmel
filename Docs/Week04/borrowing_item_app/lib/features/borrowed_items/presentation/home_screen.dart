import 'package:flutter/material.dart';

import '../domain/borrowed_items.dart';
import 'widgets/summary_card.dart';
import 'widgets/item_search_bar.dart';
import 'widgets/borrowed_items_card.dart';
import 'widgets/empty_items_view.dart';

class HomeScreen extends StatefulWidget {
  final List<BorrowedItem>? initialItems;

  const HomeScreen({super.key, this.initialItems});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  late List<BorrowedItem> _items;

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

  void _toggleItemReturned(String id) {
    setState(() {
      final index = _items.indexWhere((item) => item.id == id);
      if (index != -1) {
        _items[index] = _items[index].copyWith(
          isReturned: !_items[index].isReturned,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems = _items.where((item) {
      final query = _searchQuery.toLowerCase();
      return item.itemName.toLowerCase().contains(query) ||
          item.lenderName.toLowerCase().contains(query);
    }).toList();

    final activeCount = _items.where((i) => !i.isReturned).length;
    final overdueCount = _items
        .where((i) => !i.isReturned && i.itemDueDate.isBefore(DateTime.now()))
        .length;

    return Scaffold(
      appBar: AppBar(title: const Text('Borrowed Items')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isTablet = constraints.maxWidth >= 600;

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Align(
                  alignment: Alignment.topCenter,
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxWidth: isTablet ? 800 : double.infinity,
                    ),
                    child: Column(
                      children: [
                        SummaryCard(
                          activeCount: activeCount,
                          overdueCount: overdueCount,
                        ),
                        ItemSearchBar(
                          controller: _searchController,
                          query: _searchQuery,
                          onChanged: (val) =>
                              setState(() => _searchQuery = val),
                          onClear: () {
                            _searchController.clear();
                            setState(() => _searchQuery = '');
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              if (filteredItems.isEmpty)
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: EmptyItemsView(
                    searchQuery: _searchQuery,
                    onClearSearch: () {
                      _searchController.clear();
                      setState(() => _searchQuery = '');
                    },
                  ),
                )
              else
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final item = filteredItems[index];
                    return Align(
                      alignment: Alignment.topCenter,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: isTablet ? 800 : double.infinity,
                        ),
                        child: BorrowedItemCard(
                          item: item,
                          onToggleReturned: () => _toggleItemReturned(item.id),
                        ),
                      ),
                    );
                  }, childCount: filteredItems.length),
                ),
            ],
          );
        },
      ),
    );
  }
}
