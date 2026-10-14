Record Result

| Test | Status | Fixes note |
| Small phone | PASS | Scaled layout margins and horizontal padding using flexible layout widgets to prevent horizontal overflow and clipping |
| Large phone | PASS | Expanded search inputs, headers, and card containers naturally across wider phone viewports while preserving standard padding |
| Tablet | PASS | Implemented LayoutBuilder with a 600 dp breakpoint that wraps content inside a centered ConstrainedBox(maxWidth: 800) to adapt the structural layout rather than stretching |
| Landscape | PASS | Converted the root layout to CustomScrollView with SliverToBoxAdapter and SliverList so all header and list content scrolls smoothly without RenderFlex overflow |
| Long text | PASS | Applied maxLines: 2 and overflow: TextOverflow.ellipsis to title and subtitle strings in BorrowedItemCard to cleanly replace the text with dots (...) to prevent overflow |
| Empty state | PASS | Rendered EmptyItemsView inside SliverFillRemaining, displaying a contextual icon, descriptive message, and an action button to clear search/reset |
| Long list | PASS | Utilized SliverList powered by SliverChildBuilderDelegate to virtually render items on-demand without shrinkWrap: true, maintaining device performance|
| Keyboard | PASS | Embedded search input within the scrollable CustomScrollView viewport, allowing soft keyboard insets to adjust automatically without hiding active fields or causing overflow |
| Dark mode | PASS | Selected highly visible color to ensure visibility and readability in both dark and light theme |
