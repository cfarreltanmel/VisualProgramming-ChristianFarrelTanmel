class MenuItem {
  final String name;
  final double price;
  final double? discountPercent;

  MenuItem({required this.name, required this.price, this.discountPercent});

  // First, i used if else statement on here but then i found ?? operator which is more efficient, so i used that instead :)
  double finalPrice (){
    final double discountAmount = discountPercent ?? 0;
    return price * (1 - discountAmount / 100);
  }
}

void main() {
  List<MenuItem> menuItems = [
    MenuItem(name: 'Burger', price: 25000),
    MenuItem(name: 'Pizza', price: 75000, discountPercent: 20),
    MenuItem(name: 'Salad', price: 20000, discountPercent: 10),
    MenuItem(name: 'Mineral Water', price: 5000),
    MenuItem(name: 'Ice Cream', price: 12000),
  ];

  List<String> allItems = menuItems.map((item) => item.name).toList();
  print('All names: $allItems');

  // kind of confused with this one because the assignment said nothing about the price before or after the discount, so i just used the discounted price.
  List<MenuItem> cheapItems = menuItems.where((item) => item.finalPrice() < 15000).toList();
  print('Items under 15k: ${cheapItems.map((item) => item.name).toList()}');

  double totalPrice = menuItems.fold(0, (sum, item) => sum + item.finalPrice());
  print('Total price: Rp $totalPrice');
} 