import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

/// Short entrance for the home hero. Skipped when the OS asks for reduced motion.
class Reveal extends StatelessWidget {
  final Widget child;
  final int order;

  const Reveal({super.key, required this.child, this.order = 0});

  @override
  Widget build(BuildContext context) {
    if (MediaQuery.of(context).disableAnimations) return child;
    return child
        .animate(delay: Duration(milliseconds: 90 * order))
        .fadeIn(duration: 450.ms, curve: Curves.easeOut)
        .slideY(begin: 0.08, end: 0, duration: 450.ms, curve: Curves.easeOut);
  }
}
