import 'package:etco/constants/gaps.dart';
import 'package:etco/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _sellerList = [
    '일반 회원',
    '개인 사업자 회원',
    '법인 사업자 회원',
    '기관 회원',
  ];
  String _selectSeller = '';

  @override
  void initState() {
    super.initState();
    _selectSeller = _sellerList[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v80,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size28,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          'ETCO',
                          style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontSize: Sizes.size32,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          'Ethical Consumerism',
                          style: TextStyle(
                            fontSize: Sizes.size6,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ],
                    ),
                    Gaps.h24,
                    Image.asset(
                      'assets/images/seller_signup.png',
                    ),
                  ],
                ),
              ),
              Gaps.v32,
              const Text(
                '본인인증',
                style: TextStyle(
                  fontSize: Sizes.size16,
                ),
              ),
              Gaps.v10,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size20,
                      ),
                      height: Sizes.size44,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade700,
                        ),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: DropdownButton(
                        underline: Container(
                          color: Colors.transparent,
                        ),
                        isExpanded: true,
                        elevation: 10,
                        borderRadius: BorderRadius.circular(20),
                        icon: FaIcon(
                          FontAwesomeIcons.angleDown,
                          color: Colors.grey.shade600,
                        ),
                        iconSize: 20,
                        style: const TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                        value: _selectSeller,
                        items: _sellerList.map(
                          (value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          },
                        ).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectSeller = value!;
                          });
                        },
                      ),
                    ),
                  ),
                  Gaps.h12,
                  Container(
                    height: Sizes.size44,
                    width: Sizes.size96 + Sizes.size20,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey.shade700,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(7),
                    ),
                    child: const Center(
                      child: Text(
                        "휴대폰 인증",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Gaps.v32,
              const Form(
                child: Column(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
