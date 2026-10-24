import 'package:flutter/material.dart';

import 'widgets/theme_option_card.dart';

class ThemeSelectionScreen extends StatefulWidget {
  final ThemeMode currentThemeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  const ThemeSelectionScreen({
    super.key,
    required this.currentThemeMode,
    required this.onThemeModeChanged,
  });

  @override
  State<ThemeSelectionScreen> createState() => _ThemeSelectionScreenState();
}

class _ThemeSelectionScreenState extends State<ThemeSelectionScreen> {
  late ThemeMode _selectedMode;

  @override
  void initState() {
    super.initState();
    _selectedMode = widget.currentThemeMode;
  }

  void _handleThemeSelection(ThemeMode mode) {
    setState(() {
      _selectedMode = mode;
    });
    widget.onThemeModeChanged(mode);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select Theme')),
      body: SafeArea(
        child: ListView(
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.all(16.0),
          children: [
            ThemeOptionCard(
              title: 'System Default',
              subtitle: 'Follow device system settings',
              icon: Icons.brightness_auto,
              mode: ThemeMode.system,
              isSelected: _selectedMode == ThemeMode.system,
              onSelect: _handleThemeSelection,
            ),
            const SizedBox(height: 12),
            ThemeOptionCard(
              title: 'Light Theme',
              subtitle: 'Bright and clean appearance',
              icon: Icons.light_mode,
              mode: ThemeMode.light,
              isSelected: _selectedMode == ThemeMode.light,
              onSelect: _handleThemeSelection,
            ),
            const SizedBox(height: 12),
            ThemeOptionCard(
              title: 'Dark Theme',
              subtitle: 'Easier on the eyes in low light',
              icon: Icons.dark_mode,
              mode: ThemeMode.dark,
              isSelected: _selectedMode == ThemeMode.dark,
              onSelect: _handleThemeSelection,
            ),
          ],
        ),
      ),
    );
  }
}
