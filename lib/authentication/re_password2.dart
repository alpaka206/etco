import 'package:etco/authentication/login_screen.dart';
import 'package:etco/authentication/widgets/auth_button.dart';
import 'package:etco/constants/gaps.dart';
import 'package:etco/constants/sizes.dart';
import 'package:flutter/material.dart';

class RePasswordTwo extends StatefulWidget {
  const RePasswordTwo({super.key});

  @override
  State<RePasswordTwo> createState() => _SearchState();
}

class _SearchState extends State<RePasswordTwo> {
  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  final TextEditingController _codeController = TextEditingController();
  String _code = "";

  @override
  void initState() {
    super.initState();
    _codeController.addListener(() {
      _code = _codeController.text;
    });
    setState(() {});
  }

  @override
  void dispose() {
    _codeController.dispose();
    super.dispose();
  }

  void input() {
    if (_code.isEmpty) return;
    //인증이 확인되었습니다.
  }

  void _next() {
    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
      (route) => false,
    );
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
                  "ID/PW 찾기",
                  style: TextStyle(
                    fontSize: Sizes.size44,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.v72,
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "비밀번호 재설정",
                      style: TextStyle(
                        fontSize: Sizes.size20,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Gaps.v64,
                Container(
                  width: 350,
                  height: 180,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xfff3f3f3),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "등록된 휴대폰 번호로 인증코드를 전송했습니다",
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                      ],
                    ),
                  ),
                ),
                Gaps.v32,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "인증코드를 입력하세요",
                          hintStyle: TextStyle(
                            fontSize: Sizes.size12,
                            color: Color(0xff808080),
                          ),
                        ),
                      ),
                    ),
                    Gaps.h10,
                    GestureDetector(
                      onTap: input,
                      child: Container(
                        height: 40,
                        width: 130,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                        ),
                        child: const Center(
                          child: Text(
                            "입력",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Gaps.v80,
                GestureDetector(
                  onTap: _next,
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
