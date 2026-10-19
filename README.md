A Text inside a Row overflows. Which part of "constraints go down, sizes go up, parent sets position" was violated, and by which widget?
The "constraints go down" rule was violated by the Row widget because it passes unbounded width constraints to its unconstrained children allowing the Text widget to be larger than the available screen space.

Why is adding width: 150 to the text the wrong fix, even if the stripes disappear?
Hardcoding a fixed width violates Rule 1 ("fix the relationship, not the number") because it will fail to adapt on different screen sizes, so if you tried in on the first screen size (320p) it may work but in the other screen sizes (tablet or larger phone), it could result in overflow.

You fixed the landscape overflow by wrapping everything in a SingleChildScrollView and setting shrinkWrap: true on the list. Which test fails, and why does it matter once the data comes from an API?
The lazy loading or performance test fails because shrinkWrap: true forces Flutter to evaluate and render all list items at once rather than lazily. When data comes from an API with hundreds of items, this creates massive memory load, frame drops, and application freezes.

Why does the tablet layout use LayoutBuilder rather than MediaQuery.sizeOf(context)?
LayoutBuilder measures the actual incoming constraints of the parent widget container. MediaQuery.sizeOf(context) however, measures the entire physical device window. LayoutBuilder allows components to adapt correctly when placed inside split screen modes, side sheets, or constrained sub-views regardless of total device size.

The empty-data crash was not a layout error. Why does it belong in a layout lab anyway?
Layouts must be able to handle boundary states, and an empty list causes index out of bounds exceptions or missing state UI if left unhandled. In a state-driven structural changes/layouting, the app must be able to render the empty list, rather than crashing the whole app and making the screen turns red with error messages that could definitely trigger panic attack to user with little to no knowledge about app errors.
