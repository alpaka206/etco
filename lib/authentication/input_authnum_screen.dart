import 'package:etco/authentication/widgets/auth_button.dart';
import 'package:etco/constants/gaps.dart';
import 'package:etco/constants/sizes.dart';
import 'package:flutter/material.dart';

class InputAuthnumScreen extends StatefulWidget {
  const InputAuthnumScreen({super.key});

  @override
  State<InputAuthnumScreen> createState() => _InputAuthnumScreenState();
}

class _InputAuthnumScreenState extends State<InputAuthnumScreen> {
  final TextEditingController _authnumController = TextEditingController();
  String _authnum = "";
  @override
  void initState() {
    super.initState();
    _authnumController.addListener(() {
      _authnum = _authnumController.text;
    });
  }

  @override
  void dispose() {
    _authnumController.dispose();
    super.dispose();
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onNextTap() {
    if (_authnum.isEmpty) return;
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const Scaffold(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
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
                const Text("인증번호를 입력해 주세요"),
                Gaps.v28,
                SizedBox(
                  width: 190,
                  height: 35,
                  child: TextField(
                    controller: _authnumController,
                    cursorColor: Theme.of(context).primaryColor,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          Sizes.size7,
                        ),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size12,
                        vertical: Sizes.size10,
                      ),
                    ),
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
                  onTap: _onNextTap,
                  child: const AuthButton(
                    text: "Time",
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
