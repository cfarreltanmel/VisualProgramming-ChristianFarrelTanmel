import 'package:flutter/material.dart';

import '../domain/borrowed_items.dart';
import 'widgets/add_item_form_card.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => _AddItemScreenState();
}

class _AddItemScreenState extends State<AddItemScreen> {
  final _formKey = GlobalKey<FormState>();
  final _itemController = TextEditingController();
  final _lenderController = TextEditingController();
  DateTime _selectedDate = DateTime.now().add(const Duration(days: 7));

  @override
  void dispose() {
    _itemController.dispose();
    _lenderController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now().subtract(const Duration(days: 365)),
      lastDate: DateTime.now().add(const Duration(days: 365 * 5)),
    );
    if (picked != null) {
      setState(() => _selectedDate = picked);
    }
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      final newItem = BorrowedItem(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        itemName: _itemController.text.trim(),
        lenderName: _lenderController.text.trim(),
        itemDueDate: _selectedDate,
        isReturned: false,
      );
      Navigator.pop(context, newItem);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Borrowed Item')),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AddItemFormCard(
                  itemController: _itemController,
                  lenderController: _lenderController,
                  selectedDate: _selectedDate,
                  datePicker: _pickDate,
                ),
                const SizedBox(height: 24),
                FilledButton.icon(
                  onPressed: _submit,
                  icon: const Icon(Icons.save_outlined),
                  label: const Text('Save Item'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
