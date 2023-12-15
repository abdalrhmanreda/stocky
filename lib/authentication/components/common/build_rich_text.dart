import 'package:flutter/material.dart';

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    super.key,
    required this.textPartOne,
    required this.textPartTwo,
  });
  final String textPartOne;
  final String textPartTwo;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
          text: textPartOne,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
          children: [
            TextSpan(
              text: textPartTwo,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.brown,
                    fontSize: 30,
                  ),
            )
          ]),
    );
  }
}
