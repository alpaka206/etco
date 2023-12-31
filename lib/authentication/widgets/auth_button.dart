import 'package:etco/constants/sizes.dart';
import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;

  const AuthButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
        ),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontSize: Sizes.size16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
