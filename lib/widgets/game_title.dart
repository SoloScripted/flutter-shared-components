import 'package:flutter/material.dart';

class GameTitle extends StatelessWidget {
  final String logoAsset;
  final String titlePart1;
  final String titlePart2;
  final Color titlePart1Color;
  final Color? titlePart2Color;

  const GameTitle({
    super.key,
    required this.logoAsset,
    required this.titlePart1,
    required this.titlePart2,
    this.titlePart1Color = Colors.blue,
    this.titlePart2Color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildLogo(context),
        const SizedBox(width: 12),
        _buildTitle(context),
      ],
    );
  }

  Widget _buildLogo(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withAlpha(102),
            blurRadius: 4,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Image.asset(
        logoAsset,
        height: 64,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(
            Icons.code_sharp,
            size: 64,
            color: Colors.white,
          );
        },
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return RichText(
      text: TextSpan(
        style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
        children: <TextSpan>[
          TextSpan(text: titlePart1, style: TextStyle(color: titlePart1Color)),
          TextSpan(text: titlePart2, style: TextStyle(color: titlePart2Color ?? colorScheme.onSurface)),
        ],
      ),
    );
  }
}
