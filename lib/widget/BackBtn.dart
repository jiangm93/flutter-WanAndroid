import 'package:flutter/material.dart';

class BackBtn extends StatelessWidget {
  const BackBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () => {
        Navigator.maybePop(context)
      },
      icon: Icon(Icons.arrow_back_ios),
      tooltip: MaterialLocalizations.of(context).backButtonTooltip,
    );
  }
}
