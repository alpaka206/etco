import 'package:etco/authentication/find_pw_screen.dart';
import 'package:etco/authentication/widgets/auth_button.dart';
import 'package:etco/constants/gaps.dart';
import 'package:etco/constants/sizes.dart';
import 'package:flutter/material.dart';

class FindIdScreen extends StatefulWidget {
  const FindIdScreen({super.key});

  @override
  State<FindIdScreen> createState() => _FindIdScreenState();
}

class _FindIdScreenState extends State<FindIdScreen> {
  bool _isPhoneChecked = false;
  bool _isEmailChecked = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  String _email = "";
  String _phone = "";

  @override
  void initState() {
    super.initState();
    _emailController.addListener(() {
      _email = _emailController.text;
    });
    _phoneController.addListener(() {
      _phone = _phoneController.text;
    });
    setState(() {});
  }

  @override
  void dispose() {
    _emailController.dispose();
    _phoneController.dispose();
    super.dispose();
  }

  void _onPhoneTap() {
    _isPhoneChecked = !_isPhoneChecked;
    if (_isPhoneChecked && _isEmailChecked) _isEmailChecked = !_isEmailChecked;
    if (_isPhoneChecked) {
      _emailController.clear();
      _email = "";
    }
    setState(() {});
    FocusScope.of(context).unfocus();
  }

  void _onEmailTap() {
    _isEmailChecked = !_isEmailChecked;
    if (_isEmailChecked && _isPhoneChecked) _isPhoneChecked = !_isPhoneChecked;
    if (_isEmailChecked) {
      _phoneController.clear();
      _phone = "";
    }
    setState(() {});
    FocusScope.of(context).unfocus();
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onNextTap() {
    if ((_isEmailChecked && _email.isNotEmpty) ||
        (_isPhoneChecked && _phone.isNotEmpty)) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const FindPwScreen(),
        ),
      );
    } else {
      return;
    }
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: Sizes.size60,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Theme.of(context).primaryColor,
                            width: 2,
                          ),
                        ),
                      ),
                      child: Text(
                        "아이디",
                        style: TextStyle(
                          fontSize: Sizes.size20,
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Gaps.h40,
                    const Text(
                      "비밀번호",
                      style: TextStyle(
                        fontSize: Sizes.size20,
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Gaps.v64,
                Row(
                  children: [
                    GestureDetector(
                      onTap: _onEmailTap,
                      child: _isEmailChecked
                          ? Image.asset(
                              "assets/images/is_checked.png",
                            )
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
                  enabled: _isEmailChecked ? true : false,
                  controller: _emailController,
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
                              "assets/images/is_checked.png",
                            )
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
                  enabled: _isPhoneChecked ? true : false,
                  controller: _phoneController,
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
          ),
        ),
      ),
    );
  }
}
