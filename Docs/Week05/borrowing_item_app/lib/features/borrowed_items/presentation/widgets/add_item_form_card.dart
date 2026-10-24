import 'package:flutter/material.dart';

class AddItemFormCard extends StatelessWidget {
  final TextEditingController itemController;
  final TextEditingController lenderController;
  final DateTime selectedDate;
  final VoidCallback datePicker;

  const AddItemFormCard({
    super.key,
    required this.itemController,
    required this.lenderController,
    required this.selectedDate,
    required this.datePicker,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Card(
      elevation: 0,
      color: cs.surfaceContainerLow,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: itemController,
              decoration: const InputDecoration(
                labelText: 'Item Name',
                prefixIcon: Icon(Icons.inventory_2_outlined),
                border: OutlineInputBorder(),
              ),
              validator: (val) =>
                  val == null || val.trim().isEmpty ? 'Enter item name' : null,
              maxLines: 1,
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: lenderController,
              decoration: const InputDecoration(
                labelText: 'Lender Name',
                prefixIcon: Icon(Icons.person_outline),
                border: OutlineInputBorder(),
              ),
              validator: (val) => val == null || val.trim().isEmpty
                  ? 'Enter lender name'
                  : null,
              maxLines: 1,
            ),
            const SizedBox(height: 16),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.calendar_today_outlined),
              title: const Text('Due Date'),
              subtitle: Text(
                '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: TextButton(
                onPressed: datePicker,
                child: const Text('Select Date'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
