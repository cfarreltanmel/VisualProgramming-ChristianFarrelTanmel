import 'package:flutter/material.dart';
import 'package:warung_digital/core/widgets/price_tag.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Warung Digital')),
      body: Center(
        child: ListView(
          children: const [
            ListTile(
              title: Text('Nasi Goreng'),
              trailing: PriceTag(amount: 15000),
            ),
            ListTile(
              title: Text('Mie Goreng'),
              trailing: PriceTag(amount: 12000),
            ),
            ListTile(
              title: Text('Ayam Bakar'),
              trailing: PriceTag(amount: 20000),
            ),
          ],
        ),
      ),
    );
  }
}