import 'package:etco/constants/gaps.dart';
import 'package:etco/constants/sizes.dart';
import 'package:flutter/material.dart';

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
  String? _selectSeller = '일반 회원';
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
              //나중에 수정
              DropdownButton(
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
                    _selectSeller = value;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
