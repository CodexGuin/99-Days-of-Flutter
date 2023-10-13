import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_10/providers/counter_provider.dart';
import 'package:ninety_nine_days_of_flutter/day_10/providers/shopping_provider.dart';
import 'package:ninety_nine_days_of_flutter/day_10/screens/counter_screen.dart';
import 'package:ninety_nine_days_of_flutter/day_10/screens/shopping_screen.dart';
import 'package:ninety_nine_days_of_flutter/day_10/screens/summary_screen.dart';
import 'package:provider/provider.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<CounterProvider>(
              create: (context) => CounterProvider()),
          ChangeNotifierProvider<ShoppingProvider>(
              create: (context) => ShoppingProvider())
        ],
        child: const MaterialApp(
            debugShowCheckedModeBanner: false, home: HomeScreen()));
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIdx = 0;
  late PageController _pageController;

  final _screens = [
    const CounterScreen(),
    const ShoppingScreen(),
    const SummaryScreen()
  ];

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentIdx);
    _pageController.addListener(() {
      setState(() {
        _currentIdx = _pageController.page!.round();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Provider Demo',
                style: TextStyle(color: Colors.black)),
            centerTitle: true,
            elevation: 0,
            backgroundColor: Colors.transparent),
        body: PageView(
            controller: _pageController,
            children: _screens,
            onPageChanged: (value) {
              setState(() {
                _currentIdx = value;
              });
            }),
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIdx,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.numbers), label: 'Counter'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.shop), label: 'Shopping'),
              BottomNavigationBarItem(icon: Icon(Icons.check), label: 'Summary')
            ],
            onTap: (index) {
              _pageController.animateToPage(index,
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut);
            }));
  }
}
