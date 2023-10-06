# Day 3 - Todo App Design 1

## Brief
Todo UI design inspired by [RonDesignLab](https://dribbble.com/shots/20017643-GoodNotes-Collaborative-Notes-Mobile-App).

## Features
- Modular widgets design
- Interactable tags
- Dark mode ( Only )
- Animation ( Subtle )
- Liking of notes

## Main learning points
- Maps and List data structure
- ListView builder
- Tenary operator usage
- Stack
- Animation

## To work on / Features to be added
- Theming
- Adjusting UI components
- Creating specific vertical and horizontal notes
- On clicking of each corner of the notes, round it, or straighten it

## Bugs
- When liking the note, the bg color of the notes changes. I know the fix for this, but no time
- Overflowed text thru notes

## Self-reflection for the day
Decided to add this section to make it more personal! Today was interesting. Found a design I really liked on Dribble by [RonDesignLab](https://dribbble.com/shots/20017643-GoodNotes-Collaborative-Notes-Mobile-App) and decided to try copy this UI. Got a really clear picture for each step, making the process smooth! I attribute that to the first 2 days.

Started with the app title, nothing special. Added in a vertically scrolling tags bar with individual interactable tags. After I was satisfied with how it looks, I moved on to the main notes area.

I first created another class, NoteCards, and experimented different designs. I realized I should use stack for the aesthetic looking double bar at the top center of the notes. Everything else was a matter of finding the right combination of rows and columns. One big issue was the overflow. This will be fixed by the next update.

Overall was happy with how it turned out. Will be making this a 3 - 5 days effort, each day implementing different aspects of the app, until I am proud of it! I think the way I'll do this is to copy and paste everything from day X to day X + 1.

## Final Product
![](/assets/final/Day%203.gif)

## Run it yourself!
```
flutter pub get
flutter run
```