import 'package:etco/authentication/input_authnum_screen.dart';
import 'package:etco/authentication/widgets/auth_button.dart';
import 'package:etco/constants/gaps.dart';
import 'package:etco/constants/sizes.dart';
import 'package:flutter/material.dart';

class TwoStepAuth extends StatefulWidget {
  const TwoStepAuth({super.key});

  @override
  State<TwoStepAuth> createState() => _TwoStepAuthState();
}

class _TwoStepAuthState extends State<TwoStepAuth> {
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

  void _sendAuthnumTap() {
    if (!_isEmailChecked && !_isPhoneChecked) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const InputAuthnumScreen(),
      ),
    );
  }

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
              Gaps.v52,
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                    Gaps.h8,
                    const Text(
                      "휴대폰: 010-xxxx-xxxx",
                    ),
                  ],
                ),
              ),
              Gaps.v14,
              Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                    Gaps.h8,
                    const Text(
                      "이메일: abcd@naver.com",
                    ),
                  ],
                ),
              ),
              Gaps.v52,
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey,
              ),
              Gaps.v72,
              GestureDetector(
                onTap: _sendAuthnumTap,
                child: const AuthButton(text: "인증번호 전송"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
