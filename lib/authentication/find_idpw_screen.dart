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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: tabs.length,
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
                Gaps.v96,
                TabBar(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size72,
                  ),
                  splashFactory: NoSplash.splashFactory,
                  labelColor: Theme.of(context).primaryColor,
                  labelStyle: const TextStyle(
                    fontSize: Sizes.size20,
                  ),
                  indicatorColor: Theme.of(context).primaryColor,
                  unselectedLabelColor: Colors.grey.shade600,
                  tabs: [
                    for (var tab in tabs)
                      Tab(
                        text: tab,
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
