import 'package:flutter/material.dart';

class ThemeOptionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final ThemeMode mode;
  final bool isSelected;
  final ValueChanged<ThemeMode> onSelect;

  const ThemeOptionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.mode,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    final cs = Theme.of(context).colorScheme;

    return Card(
      elevation: isSelected ? 2 : 0,
      color: isSelected ? cs.primaryContainer : cs.surfaceContainerLow,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: isSelected
            ? BorderSide(color: cs.primary, width: 2)
            : BorderSide.none,
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: isSelected ? cs.onPrimaryContainer : cs.onSurfaceVariant,
        ),
        title: Text(
          title,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? cs.onPrimaryContainer : cs.onSurface,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(
            color: isSelected
                ? cs.onPrimaryContainer.withValues(alpha: 0.8)
                : cs.onSurfaceVariant,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: isSelected
            ? Icon(Icons.check_circle, color: cs.primary)
            : null,
        onTap: () => onSelect(mode),
      ),
    );
  }
}
