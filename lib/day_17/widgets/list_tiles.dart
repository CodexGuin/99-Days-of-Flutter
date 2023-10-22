// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:ninety_nine_days_of_flutter/day_17/providers/current_action_provider.dart';
import 'package:provider/provider.dart';

class MListTile extends StatefulWidget {
  final IconData? leading;
  final String? title;
  final IconData? trailing;
  final Function()? onTap;
  final int index;

  const MListTile(
      {super.key,
      this.leading,
      this.title,
      this.trailing,
      this.onTap,
      required this.index});

  @override
  State<MListTile> createState() => _MListTileState();
}

class _MListTileState extends State<MListTile> with TickerProviderStateMixin {
  // Animation controller for the color change on hover
  late AnimationController _controller;

  // Actual color change animation
  late Animation<Color?> _animation;
  late Animation<Color?> _selectedAnimation;

  // Initial color
  final Color _initialColor = Colors.transparent;

  // Final color
  final Color _hoverColor = const Color(0xFF5dcfeb).withOpacity(0.15);

  Color get _currentColor {
    if (Provider.of<CurrentActionProvider>(context, listen: false).currentIdx ==
        widget.index) {
      return _selectedAnimation.value!;
    }
    return _animation.value!;
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        duration: const Duration(milliseconds: 200), vsync: this);
    _animation =
        ColorTween(begin: _initialColor, end: _hoverColor).animate(_controller);
    _selectedAnimation = ColorTween(
            begin: _hoverColor,
            end: const Color(0xFF5dcfeb).withOpacity(
                0.5) // or some other desired color for the selected state
            )
        .animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (event) {
        if (Provider.of<CurrentActionProvider>(context, listen: false)
                .currentIdx !=
            widget.index) {
          _controller.forward();
        }
      },
      onExit: (event) {
        if (Provider.of<CurrentActionProvider>(context, listen: false)
                .currentIdx !=
            widget.index) {
          _controller.reverse();
        }
      },
      child: GestureDetector(
        onTap: () {
          // * Call provider's setCurrentIdx method
          Provider.of<CurrentActionProvider>(context, listen: false)
              .setCurrentIdx(widget.index);
          _controller.forward();

          if (widget.onTap != null) widget.onTap!();
        },
        child: ValueListenableBuilder<int>(
          valueListenable: Provider.of<CurrentActionProvider>(context)
              .currentIdxListenable(),
          builder: (context, currentIdx, child) {
            if (widget.index == currentIdx) {
              _controller.forward();
            } else {
              _controller.reverse();
            }

            return AnimatedBuilder(
              animation: Listenable.merge([_animation, _selectedAnimation]),
              builder: (context, child) => Container(
                decoration: BoxDecoration(
                    color: _currentColor,
                    borderRadius: BorderRadius.circular(15)),
                child: child,
              ),
              child: widget.title == null
                  ? Center(
                      child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:
                          Icon(widget.leading, color: Colors.white70, size: 40),
                    ))
                  : ListTile(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 16.0),
                      leading: Icon(widget.leading, color: Colors.white70),
                      title: Text(
                        widget.title!,
                        style: const TextStyle(
                            color: Colors.white70,
                            overflow: TextOverflow.ellipsis),
                      ),
                      trailing: Icon(widget.trailing),
                      onTap: widget.onTap,
                    ),
            );
          },
        ),
      ),
    );
  }
}
