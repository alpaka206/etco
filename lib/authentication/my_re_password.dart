import 'package:etco/authentication/re_password2.dart';
import 'package:etco/authentication/widgets/auth_button.dart';
import 'package:etco/constants/gaps.dart';
import 'package:etco/constants/sizes.dart';
import 'package:flutter/material.dart';

class MyRePasswordScreen extends StatefulWidget {
  const MyRePasswordScreen({super.key});

  @override
  State<MyRePasswordScreen> createState() => _RePasswordScreenState();
}

class _RePasswordScreenState extends State<MyRePasswordScreen> {
  bool _isEmailChecked = false;
  bool _isPhoneChecked = false;

  void _onEmailTap() {
    _isEmailChecked = !_isEmailChecked;
    if (_isEmailChecked && _isPhoneChecked) _isPhoneChecked = false;
    setState(() {});
  }

  void _onPhoneTap() {
    _isPhoneChecked = !_isPhoneChecked;
    if (_isEmailChecked && _isPhoneChecked) _isEmailChecked = false;
    setState(() {});
  }

  void _onNextTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const RePasswordTwo(),
      ),
    );
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size32,
            ),
            child: Column(
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
                const Text(
                  "비밀번호 재설정",
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gaps.v64,
                TextField(
                  decoration: const InputDecoration(
                    hintText: "아이디",
                    contentPadding: EdgeInsets.only(
                      left: Sizes.size10,
                      top: Sizes.size10,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                ),
                Gaps.v1,
                TextField(
                  decoration: const InputDecoration(
                    hintText: "이름",
                    contentPadding: EdgeInsets.only(
                      left: Sizes.size10,
                      top: Sizes.size10,
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                ),
                Gaps.v60,
                Container(
                  height: Sizes.size96,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: Sizes.size20,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "비밀번호 찾기 방법을\n선택해주세요",
                        ),
                        Gaps.h60,
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: _onEmailTap,
                                    child: Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                        color: _isEmailChecked
                                            ? Theme.of(context).primaryColor
                                            : Colors.transparent,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Gaps.h10,
                                  const Text(
                                    "E-mail 주소",
                                  ),
                                ],
                              ),
                              Gaps.v6,
                              Row(
                                children: [
                                  GestureDetector(
                                    onTap: _onPhoneTap,
                                    child: Container(
                                      height: 15,
                                      width: 15,
                                      decoration: BoxDecoration(
                                        color: _isPhoneChecked
                                            ? Theme.of(context).primaryColor
                                            : Colors.transparent,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Gaps.h10,
                                  const Text(
                                    "등록된 휴대폰 번호",
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Gaps.v20,
                const Text(
                  "*입력하신 정보와 일치하는 계정이 없습니다",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gaps.v32,
                GestureDetector(
                  onTap: _onNextTap,
                  child: const AuthButton(
                    text: "다음 >",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
