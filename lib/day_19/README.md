# Day 19 - Desktop Dashboard 5

## Brief
Simple dashboard UI. Inspired by [Christian Damian](https://dribbble.com/shots/22854718-Base-gg-Web-App), iterated by me.

## Features
- Material UI design
- Size-responsive UI (Polished)
- State managed program using Provider
- Top and bottom panels
- Semi-populated pages

## Main learning points
- Draggable attributes
- Provider implementation
- Opacity widget
- Sliders
- Tweens

## To work on / Features to be added

## Today todo
- [x] Main layout
- [x] Color design
- [x] Working side bar
- [ ] Color design
- [x] Home page
- [x] About page
- [x] Draggable widgets
- [x] Working state management
- [x] Using layout builder
- [x] Polish UI
- [x] Populate action top panels

## Bugs
- Possible overflow if height < certain amount
- When hovering over sidebar items, cursor should change to click (Fixed)
- When clicking sidebar items, state is only remembered locally within the widget (Need to implement state management) (Fixed)

## Self-reflection for the day
Final day working on this, have to move on else I'd spend way to much time here :/

Started by fixing the draggable issue, and finally found the solution! It suddenly came to me outta nowhere. Use a conditional statement to change the drag target position and the draggable in the stack! Took a little tinkering to finally get it to work without issues, but finally...

Went to home page and added a couple of items, not too much here, just wanted to populate it a bit more.

Added a volume slider along with tweened colors to make it more aesthetically more pleasing.

Still didnt add anything to the bottom panels cuz I ran out of ideas xD

Overall I can finally place a hold on this mini project. Learnt ALOT and will definetely help with the next couple of projects!

This template might be used again in the future to test out more widgets.

## Final Product
![](/assets/final/Day%2019.mp4)
![](/assets/final/Day%2019.gif)

## Run it yourself!
```
flutter pub get
flutter run
```