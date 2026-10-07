class BorrowedItem {
  final String id;
  final String itemName;
  final String lenderName;
  final DateTime itemDueDate;
  final bool isReturned;

  const BorrowedItem({
    required this.id,
    required this.itemName,
    required this.lenderName,
    required this.itemDueDate,
    this.isReturned = false,
  });
  // Helper method to create an updated copy easily
  BorrowedItem copyWith({bool? isReturned}) {
    return BorrowedItem(
      id: id,
      itemName: itemName,
      lenderName: lenderName,
      itemDueDate: itemDueDate,
      isReturned: isReturned ?? this.isReturned,
    );
  }
}
