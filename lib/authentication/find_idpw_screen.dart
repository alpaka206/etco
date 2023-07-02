import 'package:etco/authentication/find_id_screen.dart';
import 'package:etco/authentication/widgets/auth_button.dart';
import 'package:etco/constants/gaps.dart';
import 'package:etco/constants/sizes.dart';
import 'package:flutter/material.dart';

final tabs = ["아이디", "비밀번호"];

class FindIdPwScreen extends StatefulWidget {
  const FindIdPwScreen({super.key});

  @override
  State<FindIdPwScreen> createState() => _FindIdPwScreenState();
}

class _FindIdPwScreenState extends State<FindIdPwScreen> {
  bool _isPhoneChecked = false;
  bool _isEmailChecked = false;

  void _onPhoneTap() {
    _isPhoneChecked = !_isPhoneChecked;
    if (_isPhoneChecked && _isEmailChecked) _isEmailChecked = !_isEmailChecked;
    setState(() {});
  }

  void _onEmailTap() {
    _isEmailChecked = !_isEmailChecked;
    if (_isEmailChecked && _isPhoneChecked) _isPhoneChecked = !_isPhoneChecked;
    setState(() {});
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onNextTap() {
    //입력값 있을 경우에만 찾기 눌러지게 (textfield에 controller 달아줘야함)
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const FindIdScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
      child: GestureDetector(
        onTap: _onScaffoldTap,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: Sizes.size32,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Gaps.v96,
                  const Text(
                    "ID / PW 찾기",
                    style: TextStyle(
                      fontSize: Sizes.size44,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Gaps.v72,
                  TabBar(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size80,
                    ),
                    splashFactory: NoSplash.splashFactory,
                    labelColor: Theme.of(context).primaryColor,
                    labelStyle: const TextStyle(
                      fontSize: Sizes.size20,
                    ),
                    indicatorColor: Theme.of(context).primaryColor,
                    indicatorWeight: 2,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorPadding: const EdgeInsets.symmetric(vertical: 12),
                    unselectedLabelColor: Colors.grey.shade600,
                    tabs: [
                      for (var tab in tabs)
                        Tab(
                          text: tab,
                        ),
                    ],
                  ),
                  Expanded(
                    child: TabBarView(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Gaps.v72,
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: _onEmailTap,
                                  child: _isEmailChecked
                                      ? Image.asset(
                                          "assets/images/is_checked.png")
                                      : Image.asset(
                                          "assets/images/not_checked.png",
                                        ),
                                ),
                                Gaps.h16,
                                const Text(
                                  "가입한 이메일로 찾기",
                                  style: TextStyle(
                                    fontSize: Sizes.size16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Gaps.v5,
                            TextField(
                              decoration: InputDecoration(
                                hintText: "이메일 입력",
                                contentPadding: const EdgeInsets.only(
                                  top: 20,
                                  left: 10,
                                ),
                                hintStyle: const TextStyle(
                                  fontSize: 15,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ),
                              cursorColor: Theme.of(context).primaryColor,
                            ),
                            Gaps.v52,
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: _onPhoneTap,
                                  child: _isPhoneChecked
                                      ? Image.asset(
                                          "assets/images/is_checked.png")
                                      : Image.asset(
                                          "assets/images/not_checked.png",
                                        ),
                                ),
                                Gaps.h16,
                                const Text(
                                  "가입한 전화 번호로 찾기",
                                  style: TextStyle(
                                    fontSize: Sizes.size16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            Gaps.v5,
                            TextField(
                              decoration: InputDecoration(
                                hintText: "전화번호 입력(-제외)",
                                contentPadding: const EdgeInsets.only(
                                  top: 20,
                                  left: 10,
                                ),
                                hintStyle: const TextStyle(
                                  fontSize: 15,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade500,
                                  ),
                                ),
                              ),
                              cursorColor: Theme.of(context).primaryColor,
                            ),
                            Gaps.v52,
                            const Text(
                              "*입력하신 정보와 일치하는 계정이 없습니다",
                              style: TextStyle(
                                color: Colors.red,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Gaps.v52,
                            GestureDetector(
                              onTap: _onNextTap,
                              child: const AuthButton(
                                text: "아이디 찾기",
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                top: Sizes.size80,
                              ),
                              child: Container(
                                width: 350,
                                height: 180,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xfff3f3f3),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: const Offset(0, 3),
                                    )
                                  ],
                                ),
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "입력하신 정보와 일치하는 계정을 찾았습니다.",
                                        style: TextStyle(
                                            color: Colors.grey.shade700),
                                      ),
                                      Gaps.v10,
                                      const Text(
                                        "ymk961028",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: Sizes.size20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Gaps.v80,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Container(
                                    height: 60,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                                Gaps.h20,
                                Expanded(
                                  child: Container(
                                    height: 60,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
