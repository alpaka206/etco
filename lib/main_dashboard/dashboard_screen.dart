import 'package:etco/constants/gaps.dart';
import 'package:etco/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainDashBoard extends StatefulWidget {
  const MainDashBoard({super.key});

  @override
  State<MainDashBoard> createState() => _MainDashBoardState();
}

bool _showBarrier = false;
bool _firstArrow = false;

class _MainDashBoardState extends State<MainDashBoard>
    with TickerProviderStateMixin {
  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: const Duration(
      milliseconds: 300,
    ),
  );
  late final AnimationController _firstAnimationController =
      AnimationController(
    vsync: this,
    duration: const Duration(
      milliseconds: 200,
    ),
  );
  late final Animation<double> _arrowAnimation = Tween(
    begin: 0.0,
    end: 0.5,
  ).animate(_firstAnimationController);

  late final Animation<Offset> _mainPanelAnimation = Tween(
    begin: const Offset(-1, 0),
    end: Offset.zero,
  ).animate(_animationController);

  late final Animation<Offset> _managePanelAnimation = Tween(
    begin: const Offset(0, -0.2),
    end: Offset.zero,
  ).animate(_firstAnimationController);

  late final Animation<Color?> _barrierAnimation = ColorTween(
    begin: Colors.black26.withOpacity(0.1),
    end: Colors.black26.withOpacity(0.3),
  ).animate(_animationController);

  void _toggleAnimations() async {
    if (_animationController.isCompleted) {
      await _animationController.reverse();
    } else {
      _animationController.forward();
    }
    setState(() {
      _showBarrier = !_showBarrier;
    });
  }

  void _firstArrowToggleAnimations() async {
    if (_firstAnimationController.isCompleted) {
      await _firstAnimationController.reverse();
    } else {
      _firstAnimationController.forward();
    }
    setState(() {
      _firstArrow = !_firstArrow;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffefefef),
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _toggleAnimations,
              child: const FaIcon(
                FontAwesomeIcons.bars,
                color: Colors.black,
                size: Sizes.size32,
              ),
            ),
            Gaps.h28,
            Image.asset(
              "assets/images/etco_title.png",
            ),
            Gaps.h20,
            Text(
              "쇼핑 파트너 페이지",
              style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: Sizes.size16,
              ),
            ),
            Gaps.h24,
            Stack(
              children: [
                Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: const Center(
                    child: FaIcon(
                      FontAwesomeIcons.solidBell,
                      size: Sizes.size12,
                    ),
                  ),
                ),
                Positioned(
                  right: 1,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                    ),
                    child: const Center(
                      child: Text(
                        "1",
                        style: TextStyle(
                          fontSize: Sizes.size8,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Gaps.h20,
            Image.asset(
              "assets/images/icon_research.png",
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          if (_showBarrier)
            AnimatedModalBarrier(
              color: _barrierAnimation,
              dismissible: true,
              onDismiss: _toggleAnimations,
            ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size10,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Gaps.v8,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 72,
                        width: 72,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffD6DCDB),
                        ),
                      ),
                      Gaps.h20,
                      Container(
                        height: 72,
                        width: 72,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffD6DCDB),
                        ),
                      ),
                      Gaps.h20,
                      Container(
                        height: 72,
                        width: 72,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffD6DCDB),
                        ),
                      ),
                      Gaps.h20,
                      Container(
                        height: 72,
                        width: 72,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Color(0xffD6DCDB),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SlideTransition(
            position: _mainPanelAnimation,
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xffefefef),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 22,
                  right: 110,
                  top: 20,
                  bottom: 32,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: _toggleAnimations,
                      child: const FaIcon(
                        FontAwesomeIcons.xmark,
                        size: Sizes.size20,
                      ),
                    ),
                    Gaps.v20,
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          backgroundColor: Color(0xffD6DCDB),
                          radius: Sizes.size28,
                        ),
                        Gaps.h20,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "프로필 설정",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: Sizes.size16,
                              ),
                            ),
                            Gaps.v3,
                            Text(
                              "로그아웃",
                            ),
                          ],
                        ),
                      ],
                    ),
                    Gaps.v28,
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "상품 관리",
                          style: TextStyle(
                            fontSize: Sizes.size18,
                          ),
                        ),
                        Gaps.h60,
                        GestureDetector(
                          onTap: _firstArrowToggleAnimations,
                          child: RotationTransition(
                            turns: _arrowAnimation,
                            child: const FaIcon(
                              FontAwesomeIcons.chevronDown,
                              size: Sizes.size16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gaps.v6,
                    Stack(
                      children: [
                        SlideTransition(
                          position: _managePanelAnimation,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "상품 등록",
                                  style: TextStyle(
                                    fontSize: Sizes.size16,
                                    color: _firstArrow
                                        ? const Color(0xff707070)
                                        : Colors.transparent,
                                  ),
                                ),
                                Text(
                                  "상품 조회 / 수정",
                                  style: TextStyle(
                                    fontSize: Sizes.size16,
                                    color: _firstArrow
                                        ? const Color(0xff707070)
                                        : Colors.transparent,
                                  ),
                                ),
                                Text(
                                  "상품 알림",
                                  style: TextStyle(
                                    fontSize: Sizes.size16,
                                    color: _firstArrow
                                        ? const Color(0xff707070)
                                        : Colors.transparent,
                                  ),
                                ),
                                Text(
                                  "부적합 상품 관리",
                                  style: TextStyle(
                                    fontSize: Sizes.size16,
                                    color: _firstArrow
                                        ? const Color(0xff707070)
                                        : Colors.transparent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                    Gaps.v20,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
