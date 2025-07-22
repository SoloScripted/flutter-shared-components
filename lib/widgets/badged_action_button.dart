import 'package:flutter/material.dart';
import 'package:flutter_shared_components/widgets/styled_action_button.dart';

class BadgedActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;
  final String badgeText;
  final Color badgeColor;
  final bool isVisible;

  const BadgedActionButton({
    super.key,
    required this.onPressed,
    required this.child,
    required this.badgeText,
    required this.badgeColor,
    required this.isVisible,
  });

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      maintainSize: true,
      maintainAnimation: true,
      maintainState: true,
      child: StyledActionButton(
        onPressed: onPressed,
        padding: EdgeInsets.zero,
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Center(child: child),
            Positioned(
              bottom: -4,
              right: -4,
              child: CircleAvatar(
                radius: 8,
                backgroundColor: badgeColor,
                child: Text(
                  badgeText,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
