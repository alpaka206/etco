import 'package:etco/constants/gaps.dart';
import 'package:etco/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainDashBoard extends StatefulWidget {
  const MainDashBoard({super.key});

  @override
  State<MainDashBoard> createState() => _MainDashBoardState();
}

class _MainDashBoardState extends State<MainDashBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffefefef),
      appBar: AppBar(
        elevation: 0,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const FaIcon(
              FontAwesomeIcons.bars,
              color: Colors.black,
              size: Sizes.size32,
            ),
            Gaps.h28,
            Image.asset(
              "assets/images/etco_title.png",
            ),
            Gaps.h28,
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
      body: const Padding(
        padding: EdgeInsets.symmetric(
          horizontal: Sizes.size10,
        ),
        child: Column(),
      ),
    );
  }
}
