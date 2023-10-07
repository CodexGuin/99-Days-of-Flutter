# Day 4 - Todo App Design 2

## Brief
Todo UI design inspired by [RonDesignLab](https://dribbble.com/shots/20017643-GoodNotes-Collaborative-Notes-Mobile-App).

## Features
- Modular widgets design
- Interactable tags
- Dark mode ( Only )
- Animation ( Subtle )
- Liking of notes
- Interactable note's corners

## Main learning points
- Modular design
- Stack
- State management ( A bit )
- Positioned widget

## To work on / Features to be added
- Theming
- ( In Progress ) Adjusting UI components
- Creating specific vertical and horizontal notes
- ( Done ) On clicking of each corner of the notes, round it, or straighten it
  - Animate this, looking too static and boring
- Fix Firebase integration for backend

## Bugs
- ( Fixed ) When liking the note, the bg color of the notes changes. I know the fix for this, but no time
- Overflowed text thru notes

## Self-reflection for the day
Today was honestly not the best, had my first roadblock really early in and could'nt get the solution by the end of the day...

Started with tweaking UI components and fixed note's bg color changing when liked. Added a feature where if you click any corner of the notes it'll round/unround.

Trouble started when I tried implementing Firebase. I tried various solutions, but wassnt able to successfully debug this bug:
```PlatformException (PlatformException(null-error, Host platform returned null value for non-null return value., null, null))```

Will try this again in the future. Gonna try another challenge tomorrow instead. Will revisit this app again in the near future.

## Final Product
![](/assets/final/Day%204.gif)

## Run it yourself!
```
flutter pub get
flutter run
```