# Day 18 - Desktop Dashboard 4

## Brief
Simple dashboard UI. Inspired by [Christian Damian](https://dribbble.com/shots/22854718-Base-gg-Web-App), iterated by me.

## Features
- Material UI design
- Size-responsive UI (Polished)
- State managed program using Provider
- About page
- Top and bottom panels

## Main learning points
- Nesting logic
- More about draggables and drag targets

## To work on / Features to be added
- Intuitive and interactive UX

## Today todo
- [x] Main layout
- [x] Color design
- [x] Working side bar
- [ ] Color design
- [ ] Home page
- [x] About page
- [ ] Draggable widgets
- [x] Working state management
- [x] Using layout builder

## Bugs
- Possible overflow if height < certain amount
- When hovering over sidebar items, cursor should change to click (Fixed)
- When clicking sidebar items, state is only remembered locally within the widget (Need to implement state management) (Fixed)

## Self-reflection for the day
Made improvements and modularized code alot more. Quite abit cleaner.

Spent > 1 hr on draggables. Managed to make it drag, but can't seem to figure out how to change the widgets position. Attempted provider but was still unsure how to implement it properly. Had an idea using stack and stacked the dragtarget below the draggable, then when dragging, the child left behind turns invis so it reveals the drag target. But I still can't make it happen...

Tmr's gonna be a super busy day, might spend some time only at night at most.

I might spent 2 more days on this.

## Final Product
![](/assets/final/Day%2018.gif)

## Run it yourself!
```
flutter pub get
flutter run
```