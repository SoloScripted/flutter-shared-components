import 'package:flutter/material.dart';

class StyledActionButton extends StatefulWidget {
  const StyledActionButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.padding,
    this.backgroundColor,
  });

  final VoidCallback onPressed;
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;

  @override
  State<StyledActionButton> createState() => _StyledActionButtonState();
}

class _StyledActionButtonState extends State<StyledActionButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (_) => setState(() => _isPressed = true),
        onTapUp: (_) {
          setState(() => _isPressed = false);
          widget.onPressed();
        },
        onTapCancel: () => setState(() => _isPressed = false),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          transform: _isPressed
              ? Matrix4.translationValues(1.0, 1.0, 0.0)
              : Matrix4.identity(),
          padding:
              widget.padding ?? const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: widget.backgroundColor ?? colorScheme.surface,
            borderRadius: BorderRadius.circular(4.0),
            boxShadow: _isPressed
                ? null
                : [
                    BoxShadow(
                      color: colorScheme.shadow.withAlpha(38),
                      blurRadius: 2,
                      offset: const Offset(1, 1),
                    ),
                  ],
          ),
          child: Center(child: widget.child),
        ),
      ),
    );
  }
}
