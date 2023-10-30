# Day 23 - C3 - Telegram 3

## Brief
Next up, Telegram. 2 - 3 parts as it is alot more complicated.

## Features
- Modular and structured code
- Royalty free images and videos
- Relatively beautiful UI design
- Sticky appbar
- Slidable widget (Package)
- Fully working chatting and displaying of messages (Runtime storage)
- Clean UI

## Main learning points
- Slivers (Not fully sure yet)
- Custom scroll view
- Nested classes
- Richtext and text span
- Modularity
- Sliders

## To work on / Features to be added
- Firebase integration

## Today todo
- [x] Main page UI
- [x] Modular design
- [x] Dark theme
- [ ] Theme changer
- [x] Provider
- [x] Chat page

## Bugs
- Possible overflow if > 2 lines for richtext AKA convo tile widget subtitle
- Unable to see top 2ish messages due to how I implemented the container widget
- Emulator weird bug where I cant drag up in chat page to view old messages (See gif)

## Self-reflection for the day
Did this yesterday morning + a little today. Barely scratched 1.5hrs. Basically just polished up some UI, code, and added functionality to chatting page.

I think I'll stop development on this for now, quite satisfied dispite it not having firebase support yet. On to the next challenge!

## Final Product
![](/assets/final/Day%2023.gif)

## Run it yourself!
```
flutter pub get
flutter run
```