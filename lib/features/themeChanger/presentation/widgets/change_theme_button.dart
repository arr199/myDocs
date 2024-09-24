import 'package:flutter/material.dart';
import 'package:my_docs/core/theme/app_theme.dart';
import 'package:my_docs/core/theme/constants.dart';
import 'package:provider/provider.dart';

class ChangeThemeButton extends StatelessWidget {
  const ChangeThemeButton({
    super.key,
    required,
  });

  void _onSelectNewColor(BuildContext context, int newColorIndex) {
    context.read<AppThemeProvider>().changeColor(newColorIndex);
  }

  @override
  Widget build(BuildContext context) {
    final colorTheme = Theme.of(context).colorScheme;
    final currentColor = context.watch<AppThemeProvider>().selectedColor;

    return PopupMenuButton(
        initialValue: currentColor,
        onSelected: (value) => _onSelectNewColor(context, value),
        icon: const Icon(Icons.palette),
        color: colorTheme.secondary,
        position: PopupMenuPosition.under,
        itemBuilder: (context) => List.generate(
            themeColors.length,
            (index) =>
                _buildMenuItem(currentColor, index, themeColors[index])));
  }

  PopupMenuItem _buildMenuItem(int currentColor, int index, Color color) {
    return PopupMenuItem(
        value: index,
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              color: color,
            ),
            const SizedBox(
              width: 10,
            ),
            if (currentColor == index)
              const Icon(
                Icons.arrow_left_sharp,
                size: 30,
              )
          ],
        ));
  }
}
