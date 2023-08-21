import 'package:etco/constants/gaps.dart';
import 'package:etco/constants/sizes.dart';
import 'package:etco/onbording/tutorial_screen.dart';
import 'package:flutter/material.dart';

class OnbordingHello extends StatelessWidget {
  const OnbordingHello({super.key});

  void _onSubmitTap(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const TutorialScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size40,
            vertical: Sizes.size32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gaps.v96,
              Gaps.v40,
              Image.asset(
                "assets/images/hello.png",
                scale: 0.8,
              ),
              Gaps.v80,
              const Text(
                '000 님, 안녕하세요!',
                style: TextStyle(
                  fontSize: Sizes.size18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.v40,
              Text(
                '온라인 쇼핑몰이 처음 이신가요?\n지금부터 초기 설정을 진행하도록 하겠습니다,',
                style: TextStyle(
                  color: Theme.of(context).hintColor,
                ),
                textAlign: TextAlign.center,
              ),
              Gaps.v96,
              Gaps.v72,
              GestureDetector(
                onTap: () => _onSubmitTap(context),
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: Container(
                    height: Sizes.size52,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    child: const Center(
                      child: Text(
                        '다음 >',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
