Constraints diagnosis

1. Unbounded height
   Column provides infinite vertical max height constraints to its children, causing an unwrapped ListView to attempt height evaluation without boundaries.

2. Long text
   Placing a non-wrapping Text widget inside an unconstrained horizontal parent like a Row allows long string content to exceed the screen's maximum width constraint and trigger a horizontal RenderFlex overflow.

3. No ListView
   Stacking multiple fixed-height widgets directly inside a non-scrollable Column exceeds the total vertical max height constraint of the screen, triggering a bottom RenderFlex overflow.
