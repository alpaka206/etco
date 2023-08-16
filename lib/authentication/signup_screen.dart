import 'package:etco/authentication/signup_corp.dart';
import 'package:etco/authentication/widgets/auth_button.dart';
import 'package:etco/authentication/widgets/text_form_field.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};
  String _pw = '';
  bool _nessChecked = false;
  bool _seleChecked = false;

  @override
  void initState() {
    super.initState();
    _selectSeller = _sellerList[0];
  }

  void _onNessTap() {
    _nessChecked = !_nessChecked;
    setState(() {});
  }

  void _onSeleTap() {
    _seleChecked = !_seleChecked;
    setState(() {});
  }

  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
      }
    }
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/etco_title.png',
                  ),
                  Gaps.h20,
                  Image.asset(
                    'assets/images/seller_signup.png',
                  ),
                ],
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
                          _selectSeller = value!;
                          if (_selectSeller == _sellerList[2]) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CorpSignUpScreen(),
                              ),
                            );
                          }
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
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("아이디"),
                    Gaps.v9,
                    RenderTextFormField(
                      isObsecure: false,
                      onSaved: (newValue) {
                        formData['id'] = newValue;
                      },
                      validator: (value) {
                        if ((value == '') || (value.length <= 7)) {
                          return "사용할 수 없는 아이디입니다";
                        }
                        return null;
                      },
                    ),
                    Gaps.v10,
                    const Text("비밀번호"),
                    Gaps.v9,
                    RenderTextFormField(
                      isObsecure: true,
                      onSaved: (newValue) {
                        formData['pw'] = newValue;
                      },
                      validator: (value) {
                        _pw = value;
                        if ((value == '') || (value.length < 7)) {
                          return "비밀번호가 안전하지 않습니다";
                        }
                        return null;
                      },
                    ),
                    Gaps.v10,
                    const Text("비밀번호 재확인"),
                    Gaps.v9,
                    RenderTextFormField(
                      isObsecure: true,
                      onSaved: (newValue) {
                        formData['checkPw'] = newValue;
                      },
                      validator: (value) {
                        if ((value == '') || (value != _pw)) {
                          return "비밀번호가 일치하지 않습니다";
                        }
                        return null;
                      },
                    ),
                    Gaps.v32,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "약관동의",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: Sizes.size14,
                          ),
                        ),
                        Text(
                          "약관 동의에 체크해주시기 바랍니다.",
                          style: TextStyle(
                            color:
                                _nessChecked ? Colors.transparent : Colors.red,
                            fontSize: Sizes.size14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Gaps.v7,
                    FractionallySizedBox(
                      widthFactor: 1,
                      child: Container(
                        height: 1,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                    Gaps.v7,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: _onNessTap,
                          child: _nessChecked
                              ? Image.asset("assets/images/is_checked.png")
                              : Image.asset("assets/images/not_checked.png"),
                        ),
                        Gaps.h5,
                        Expanded(
                          child: Text(
                            "[필수] ETCO 회원약관, 쇼핑몰 호스팅 이용 약관에 동의하며,개인정보 수집 및 이용에 동의합니다",
                            style: TextStyle(
                              color: _nessChecked
                                  ? Colors.black
                                  : const Color(0xff808080),
                              fontSize: Sizes.size14,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: _onSeleTap,
                          child: _seleChecked
                              ? Image.asset("assets/images/is_checked.png")
                              : Image.asset("assets/images/not_checked.png"),
                        ),
                        Gaps.h5,
                        Text(
                          "[선택] 프로모션 정보 수신 동의(핸드폰)",
                          style: TextStyle(
                            color: _seleChecked
                                ? Colors.black
                                : const Color(0xff808080),
                          ),
                        ),
                      ],
                    ),
                    Gaps.v32,
                    GestureDetector(
                      onTap: _onSubmitTap,
                      child: const AuthButton(
                        text: "가입하기",
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
