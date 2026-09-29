Week 02: H3
Extracted Widgets and explanation

1. SummaryCard

- Trigger: Readability.
- What it owns: Visual rendering for overall item counts (active and overdue), container decoration, and conditional color styling.
- What it reports upward: None (Pure display widget; values are passed down from parent).

2. BorrowedItemCard

- Trigger: Reuse & Readability.
- What it owns: Individual item visual hierarchy (title, owner, due date formatting, status icon coloring, line-through decoration).
- What it reports upward: Triggers `onToggleReturned()` callback when the checkbox is tapped.

3. ItemSearchBar

- Trigger: Readability.
- What it owns: `TextField` input decoration, prefix icon, and display of the clear (`X`) button.
- What it reports upward:
  - `onChanged`: Reports typed text updates to the parent screen.
  - `onClear`: Reports when the user clicks the clear text button.

4. EmptyItemsView

- Trigger: Readability.
- What it owns: Fallback placeholder layout (icons, display message for empty search or empty list).
- What it reports upward: `onClearSearch`: Reports when the user clicks "Clear Search" text button on empty results.
