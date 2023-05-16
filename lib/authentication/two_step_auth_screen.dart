import 'package:etco/constants/gaps.dart';
import 'package:etco/constants/sizes.dart';
import 'package:flutter/material.dart';

class TwoStepAuth extends StatefulWidget {
  const TwoStepAuth({super.key});

  @override
  State<TwoStepAuth> createState() => _TwoStepAuthState();
}

class _TwoStepAuthState extends State<TwoStepAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 26,
          ),
          child: Column(
            children: [
              Gaps.v96,
              Gaps.v48,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size96,
                ),
                child: Image.asset(
                  'assets/images/second_auth.png',
                  width: double.infinity,
                  fit: BoxFit.fitWidth,
                ),
              ),
              Gaps.v64,
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
