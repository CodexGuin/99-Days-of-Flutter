import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CurrentActionProvider extends ChangeNotifier {
  int _currentIdx = 0;
  final ValueNotifier<int> _currentIdxNotifier = ValueNotifier<int>(0);
  late PageController _pageController;

  CurrentActionProvider() {
    _pageController = PageController(initialPage: _currentIdx);
    _pageController.addListener(() {
      _currentIdx = _pageController.page!.round();
      _currentIdxNotifier.value = _currentIdx;
      notifyListeners();
    });
  }

  int get currentIdx => _currentIdx;

  ValueListenable<int> currentIdxListenable() => _currentIdxNotifier;

  PageController get pageController => _pageController;

  void setCurrentIdx(int idx) {
    _currentIdx = idx;
    _currentIdxNotifier.value = _currentIdx; // Notify the ValueNotifier
    notifyListeners();
  }

  @override
  void dispose() {
    _pageController.dispose();
    _currentIdxNotifier.dispose(); // Dispose the ValueNotifier
    super.dispose();
  }
}
