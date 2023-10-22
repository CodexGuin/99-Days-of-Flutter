import 'package:flutter/material.dart';

class TopAbout extends StatefulWidget {
  const TopAbout({super.key});

  @override
  State<TopAbout> createState() => _TopAboutState();
}

class _TopAboutState extends State<TopAbout> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        padding: const EdgeInsets.all(20),
        child: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: InnerPanel(
                  borderColor: Colors.green,
                  child: Icon(
                    Icons.directions_run_rounded,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
              Flexible(
                child: InnerPanel(
                  borderColor: Colors.blue,
                  child: Icon(
                    Icons.favorite_rounded,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
              Flexible(
                child: InnerPanel(
                  borderColor: Colors.red,
                  child: Icon(
                    Icons.code_rounded,
                    color: Colors.white,
                    size: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InnerPanel extends StatelessWidget {
  final Color borderColor;
  final Widget child;

  const InnerPanel({super.key, required this.borderColor, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF2c2c2c),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: borderColor, width: 2),
      ),
      child: Center(child: child),
    );
  }
}
