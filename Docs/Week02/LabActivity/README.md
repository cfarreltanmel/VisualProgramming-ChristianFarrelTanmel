This README.md is dedicated to explainning stuff.

For the first point on the assignment i did it "purely" without inspecting the widget tree using flutter inspector. Why the quotation mark? because i still got some reference from the previous homework (H2) widget tree. AI however, kind of 70/30 ish percent (70% is my work). Because i first imagine the tree in my head after reading the code then i ask my AI for correction, i generally got it right but missed in some widget identification (e.g i thought A is a widget but it's actually not or it's a property inside a widget). After i finished drawing the widget tree, i ran the app then inspect the widget tree using flutter inspector and uhh... lets say i missed "a couple" of widgets even after using AI help :').

For the 2-6 points on the assignment, to be honest and i'm sorry to say that mostly my AI did the job because i simply just can't imagine how to extract the original build to several widgets let alone writing them into codes. Maybe i can explain some small details like what is the widget trigger, some of the code logic, and why a child can be const. But, if i have to explain everything now, i'd be able to explain roughly 1/6 points from the assignment, which the widget tree is the only point i can confidently explain and why do i drew it as it is. Also i'm confused witht the commit message because there is 2 version of it (inside elearn and the main.dart) i didn't know which one to follow and i don't know how to commit a long message in a commit message nicely, so i'm just going to put the explanation here for the 2 points instructed, then commit the changes following elearn's commit message requirement.

Readability or Reuse?
- PriceChip: REUSE (used in both MenuItemCard and the total bar)
- MenuHeader: READABILITY
- MenuSearchField: READABILITY
- EmptySearchState: READABILITY
- MenuItemCard: READABILITY

Which piece of state the AI almost pushed to child widget and what would broke it happens.
The `_quantities` map (or individual item quantity state). If pushed down into `MenuItemCard`, the mainscreen and total bar would lose access to item quantities, breaking total calculations, line counts, andorder resetting on save.

For the next homework i'd surely study and read more about this code itself and flutter generally (including the slideshow and learning materials inside elearn of course). But for now, at least the assignment is submitted before it's due right?(OvO) Once again sorry for the overusage of AI, i've tried my best but my 2 braincells cannot process and generate anything to complete the task given :'). Thank you for reading!