import 'package:etco/authentication/signup_screen.dart';
import 'package:etco/authentication/two_step_auth_screen.dart';
import 'package:etco/authentication/widgets/auth_button.dart';
import 'package:etco/constants/gaps.dart';
import 'package:etco/constants/sizes.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _idController = TextEditingController();
  final TextEditingController _pwController = TextEditingController();
  String _id = "";
  String _password = "";
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _idController.addListener(() {
      _id = _idController.text;
    });
    _pwController.addListener(() {
      _password = _pwController.text;
    });
    setState(() {});
  }

  @override
  void dispose() {
    _idController.dispose();
    _pwController.dispose();
    super.dispose();
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (_id.isEmpty && _password.isEmpty) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TwoStepAuth(),
      ),
    );
  }

  void _onChecked() {
    setState(() {
      _isChecked = !_isChecked;
    });
  }

  void _onSignUpTap() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const SignUpScreen(),
      ),
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
              horizontal: Sizes.size24 + Sizes.size2,
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
                    'assets/images/Seller.png',
                    width: 400,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Gaps.v36,
                TextField(
                  controller: _idController,
                  onEditingComplete: _onSubmit,
                  decoration: InputDecoration(
                    hintText: "아이디",
                    hintStyle: const TextStyle(
                      color: Color(0xff808080),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                ),
                Gaps.v10,
                TextField(
                  controller: _pwController,
                  onEditingComplete: _onSubmit,
                  autocorrect: false,
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "패스워드",
                    hintStyle: const TextStyle(
                      color: Color(0xff808080),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                      ),
                    ),
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Checkbox(
                      value: _isChecked,
                      onChanged: (value) => _onChecked(),
                      checkColor: Colors.white,
                      activeColor: Theme.of(context).primaryColor,
                      side: const BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    const Text(
                      "아이디 저장",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                  ],
                ),
                Gaps.v72,
                const Text(
                  '*개인 정보 보호를 위해 본인 기기에서만 이용해주세요',
                  style: TextStyle(
                    fontSize: Sizes.size14,
                    color: Colors.red,
                  ),
                ),
                Gaps.v32,
                GestureDetector(
                    onTap: _onSubmit,
                    child: const AuthButton(
                      text: '로그인',
                    )),
                Gaps.v10,
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Sizes.size10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '아이디 · 비밀번호 찾기',
                        style: TextStyle(),
                      ),
                      GestureDetector(
                        onTap: _onSignUpTap,
                        child: const Text(
                          '회원가입',
                        ),
                      ),
                    ],
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
