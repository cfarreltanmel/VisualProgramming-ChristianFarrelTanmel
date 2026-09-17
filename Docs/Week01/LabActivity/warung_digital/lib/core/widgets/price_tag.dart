import 'package:flutter/material.dart';

class PriceTag extends StatelessWidget {
  const PriceTag({super.key, required this.amount, this.currency = 'Rp'});

  final int amount;       // final — a widget describes, it does not mutate
  final String currency;

  @override
  Widget build(BuildContext context) {
    return Text('$currency ${amount.toString()}');
  }
}