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

  static const double _kSmallScreenWidth = 700;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmall = MediaQuery.of(context).size.width < _kSmallScreenWidth;
        final logoSize = isSmall ? 52.0 : 64.0;
        final titleTextStyle = (isSmall
                ? Theme.of(context).textTheme.headlineSmall
                : Theme.of(context).textTheme.headlineMedium)
            ?.copyWith(fontWeight: FontWeight.bold);

        return Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildLogo(context, logoSize: logoSize),
            SizedBox(width: isSmall ? 8.0 : 12.0),
            _buildTitle(
              context,
              isSmall: isSmall,
              titleStyle: titleTextStyle,
            ),
          ],
        );
      },
    );
  }

  Widget _buildLogo(BuildContext context, {required double logoSize}) {
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
        height: logoSize,
        width: logoSize,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Icon(
            Icons.code_sharp,
            size: logoSize,
            color: Colors.white,
          );
        },
      ),
    );
  }

  Widget _buildTitle(
    BuildContext context, {
    required bool isSmall,
    TextStyle? titleStyle,
  }) {
    final colorScheme = Theme.of(context).colorScheme;

    if (isSmall) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titlePart1,
            style: titleStyle?.copyWith(color: titlePart1Color),
          ),
          Text(
            titlePart2,
            style: titleStyle?.copyWith(
              color: titlePart2Color ?? colorScheme.onSurface,
            ),
          ),
        ],
      );
    }

    return RichText(
      text: TextSpan(
        style: titleStyle,
        children: <TextSpan>[
          TextSpan(text: titlePart1, style: TextStyle(color: titlePart1Color)),
          TextSpan(
            text: titlePart2,
            style: TextStyle(color: titlePart2Color ?? colorScheme.onSurface),
          ),
        ],
      ),
    );
  }
}
