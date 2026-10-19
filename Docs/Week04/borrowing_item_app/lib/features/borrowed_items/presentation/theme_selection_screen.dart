import 'package:flutter/material.dart';

class ThemeSelectionScreen extends StatelessWidget {
  final ThemeMode currentThemeMode;
  final ValueChanged<ThemeMode> onThemeModeChanged;

  const ThemeSelectionScreen({
    super.key,
    required this.currentThemeMode,
    required this.onThemeModeChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Appearance'), centerTitle: true),
      body: SafeArea(
        child: RadioGroup<ThemeMode>(
          groupValue: currentThemeMode,
          onChanged: (ThemeMode? newMode) {
            if (newMode != null) {
              onThemeModeChanged(newMode);
            }
          },
          child: ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Text(
                'Choose Theme',
                style: theme.textTheme.titleMedium?.copyWith(
                  color: colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Select how the Borrowed Items app looks on your device.',
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: colorScheme.onSurfaceVariant,
                ),
              ),
              const SizedBox(height: 20),

              _ThemeOptionCard(
                title: 'System Default',
                subtitle: 'Follow device settings automatically',
                icon: Icons.brightness_auto,
                value: ThemeMode.system,
                isSelected: currentThemeMode == ThemeMode.system,
              ),
              const SizedBox(height: 12),

              _ThemeOptionCard(
                title: 'Light Theme',
                subtitle: 'Clean light background with dark text',
                icon: Icons.light_mode_outlined,
                value: ThemeMode.light,
                isSelected: currentThemeMode == ThemeMode.light,
              ),
              const SizedBox(height: 12),

              _ThemeOptionCard(
                title: 'Dark Theme',
                subtitle: 'Dark background comfortable for night use',
                icon: Icons.dark_mode_outlined,
                value: ThemeMode.dark,
                isSelected: currentThemeMode == ThemeMode.dark,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ThemeOptionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final ThemeMode value;
  final bool isSelected;

  const _ThemeOptionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.value,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: isSelected ? 2 : 0,
      color: isSelected
          ? colorScheme.primaryContainer
          : colorScheme.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(
          color: isSelected ? colorScheme.primary : colorScheme.outlineVariant,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: RadioListTile<ThemeMode>(
        value: value,
        secondary: Icon(
          icon,
          color: isSelected
              ? colorScheme.primary
              : colorScheme.onSurfaceVariant,
        ),
        title: Text(
          title,
          style: theme.textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.bold,
            color: isSelected
                ? colorScheme.onPrimaryContainer
                : colorScheme.onSurface,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          subtitle,
          style: theme.textTheme.bodySmall?.copyWith(
            color: isSelected
                ? colorScheme.onPrimaryContainer.withValues(alpha: 0.8)
                : colorScheme.onSurfaceVariant,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      ),
    );
  }
}
