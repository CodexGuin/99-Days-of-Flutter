# Day 16 - Desktop Dashboard

## Brief
Simple dashboard UI. Inspired by [Christian Damian](https://dribbble.com/shots/22854718-Base-gg-Web-App), iterated by me.

## Features
- Material UI design
- Size-responsive UI (Polished)
- State managed program using Provider
- 

## Main learning points
- Layout management
- Expanded & Flexible widgets
- Layout builder
- Provider implementation on more real world example

## To work on / Features to be added
- Working side bar
- Intuitive and interactive UX
- Using state management technique for side bar

## Today todo
- [x] Main layout
- [x] Color design
- [x] Working side bar
- [ ] Color design
- [ ] Home page
- [x] Working state management
- [x] Using layout builder

## Bugs
- Possible overflow if height < certain amount
- When hovering over sidebar items, cursor should change to click (Fixed)
- When clicking sidebar items, state is only remembered locally within the widget (Need to implement state management) (Fixed)

## Self-reflection for the day
Started work on this at 12am HAHA Spent about 1.5 hrs to restart from scratch and polish up layout. Results were quite abit more polished than before, quite happy!

Resumed in the afternoon. Woked hard on state managing the current actions and got the selection to work pretty much flawlessly while keeping track of current state!

Spent about half an hour figuring out how layoutbuilder works. Implemented them to cut out title and only display icons in listtiles.

Overall quite happy with today's progress, but could have done alot more.

Will work on this 1 - 2 more days.

## Final Product
![](/assets/final/Day%2016.gif)

## Run it yourself!
```
flutter pub get
flutter run
```