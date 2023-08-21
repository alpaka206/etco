import 'package:etco/constants/gaps.dart';
import 'package:etco/constants/sizes.dart';
import 'package:flutter/material.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size28,
            horizontal: Sizes.size40,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'ETCO 서비스 소개 및 설명',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: Sizes.size28,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.v40,
              DefaultTabController(
                length: 4,
                child: FractionallySizedBox(
                  widthFactor: 0.8,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Container(
                        height: 550,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Theme.of(context).hintColor,
                          ),
                        ),
                        child: TabBarView(
                          children: [
                            Image.network(
                              'https://cdn.pixabay.com/photo/2022/06/08/05/47/stars-7249785_1280.jpg',
                              fit: BoxFit.fill,
                            ),
                            const Center(
                              child: Text(
                                'Page 2',
                                style: TextStyle(
                                  fontSize: Sizes.size20,
                                  color: Colors.amber,
                                ),
                              ),
                            ),
                            const Center(
                              child: Text(
                                'Page 3',
                                style: TextStyle(
                                  fontSize: Sizes.size20,
                                  color: Colors.amber,
                                ),
                              ),
                            ),
                            const Center(
                              child: Text(
                                'Page 4',
                                style: TextStyle(
                                  fontSize: Sizes.size20,
                                  color: Colors.amber,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        bottom: 20,
                        child: Row(
                          children: [
                            TabPageSelector(
                              color: Colors.white,
                              selectedColor: Theme.of(context).hintColor,
                              indicatorSize: Sizes.size14,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Gaps.v52,
              GestureDetector(
                onTap: () {},
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
