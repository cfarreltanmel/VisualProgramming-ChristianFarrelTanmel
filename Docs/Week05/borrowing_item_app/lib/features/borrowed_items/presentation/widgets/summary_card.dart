import 'package:flutter/material.dart';

class SummaryCard extends StatelessWidget {
  final int activeCount;
  final int overdueCount;

  const SummaryCard({
    super.key,
    required this.activeCount,
    required this.overdueCount,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final bool hasOverdue = overdueCount > 0;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Card(
                elevation: 0,
                color: colorScheme.primaryContainer,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(16),
                    right: Radius.circular(4),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '$activeCount',
                          style: textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onPrimaryContainer,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Total Items',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.labelLarge?.copyWith(
                          color: colorScheme.onPrimaryContainer,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40,
              child: Center(
                child: VerticalDivider(
                  width: 8,
                  thickness: 1.5,
                  color: colorScheme.outlineVariant,
                ),
              ),
            ),
            Expanded(
              child: Card(
                elevation: 0,
                color: hasOverdue
                    ? colorScheme.errorContainer
                    : colorScheme.surfaceContainerHigh,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.horizontal(
                    left: Radius.circular(4),
                    right: Radius.circular(16),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          '$overdueCount',
                          style: textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: hasOverdue
                                ? colorScheme.onErrorContainer
                                : colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Overdue Items',
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: textTheme.labelLarge?.copyWith(
                          fontWeight: hasOverdue
                              ? FontWeight.bold
                              : FontWeight.normal,
                          color: hasOverdue
                              ? colorScheme.onErrorContainer
                              : colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
