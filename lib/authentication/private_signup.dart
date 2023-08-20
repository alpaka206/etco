import 'package:etco/constants/gaps.dart';
import 'package:etco/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'widgets/auth_button.dart';

class PrivateSignUpScreen extends StatefulWidget {
  const PrivateSignUpScreen({super.key});

  @override
  State<PrivateSignUpScreen> createState() => _PrivateSignupState();
}

class _PrivateSignupState extends State<PrivateSignUpScreen> {
  final List<String> _sellerList = [
    '일반 회원',
    '개인 사업자 회원',
    '법인 사업자 회원',
    '기관 회원',
  ];
  String _selectSeller = '';

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  Map<String, String> formData = {};
  String _pw = '';
  bool _isNessChecked = false;
  bool _isSeleChecked = false;

  void _onNessTap() {
    _isNessChecked = !_isNessChecked;

    setState(() {});
  }

  void _onSeleTap() {
    _isSeleChecked = !_isSeleChecked;
    setState(() {});
  }

  void _onSubmitTap() {
    if (_formkey.currentState != null) {
      if (_formkey.currentState!.validate()) {
        _formkey.currentState!.save();
      }
    }
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  final TextEditingController _phNumController = TextEditingController();
  final TextEditingController _businessNumController = TextEditingController();
  String _phonenum = "";
  String _businessnum = "";
  final String _phoneAuth = "";

  @override
  void initState() {
    super.initState();
    _phNumController.addListener(() {
      _phonenum = _phNumController.text;
    });
    _businessNumController.addListener(() {
      _businessnum = _businessNumController.text;
    });
    _selectSeller = _sellerList[0];

    setState(() {});
  }

  @override
  void dispose() {
    _phNumController.dispose();
    _businessNumController.dispose();
    super.dispose();
  }

  void sameCheck() {
    if (_businessnum.isEmpty) return;
    //입력 눌렀을때 적용.
  }

  void numCheck() {
    if (_phonenum.isEmpty) return;
  }

  void phoneAuth() {
    if (_phoneAuth.isEmpty) return;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: Sizes.size32,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gaps.v96,
                Gaps.v10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 37,
                      width: 90,
                      child: Image.asset(
                        'assets/images/etco_title.png',
                      ),
                    ),
                    Gaps.h20,
                    Image.asset(
                      'assets/images/seller_signup.png',
                    ),
                  ],
                ),
                Gaps.v44,
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "본인인증",
                      style: TextStyle(
                        fontSize: Sizes.size12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Gaps.v11,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        width: 200,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xff8A8A8A),
                            width: Sizes.size1,
                          ),
                          borderRadius: BorderRadius.circular(Sizes.size5),
                        ),
                        child: DropdownButton<String>(
                            padding: const EdgeInsets.all(
                              Sizes.size11,
                            ),
                            underline: Container(
                              decoration: const BoxDecoration(
                                color: Colors.transparent,
                              ),
                            ),
                            isExpanded: true,
                            value: _selectSeller,
                            icon: const Icon(Icons.keyboard_arrow_down),
                            items: _sellerList.map(
                              (value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(
                                      fontSize: Sizes.size12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                );
                              },
                            ).toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectSeller = value!;
                              });
                            }),
                      ),
                    ),
                    Gaps.h14,
                    GestureDetector(
                      onTap: phoneAuth,
                      child: Container(
                        width: 108,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xff8A8A8A),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Center(
                          child: Text(
                            "휴대폰 인증",
                            style: TextStyle(
                              fontSize: Sizes.size12,
                              color: Theme.of(context).primaryColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Gaps.v10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: 200,
                        height: 40,
                        child: TextField(
                          controller: _phNumController,
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: InputDecoration(
                            hintText: "휴대폰 번호를 입력해주세요",
                            hintStyle: const TextStyle(
                              fontSize: Sizes.size12,
                              color: Color(0xff808080),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                Sizes.size5,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: Sizes.size12,
                              vertical: Sizes.size10,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gaps.h14,
                    GestureDetector(
                      child: Container(
                        width: 108,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xff8A8A8A),
                            width: Sizes.size1,
                          ),
                          borderRadius: BorderRadius.circular(
                            Sizes.size5,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            "인증 번호 전송",
                            style: TextStyle(
                              fontSize: Sizes.size12,
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Gaps.v10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: SizedBox(
                        width: 200,
                        height: 40,
                        child: TextField(
                          controller: _businessNumController,
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: InputDecoration(
                            hintText: "사업자 등록 번호를 입력해주세요",
                            hintStyle: const TextStyle(
                              fontSize: Sizes.size12,
                              color: Color(0xff808080),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(
                                Sizes.size5,
                              ),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              horizontal: Sizes.size12,
                              vertical: Sizes.size10,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Gaps.h14,
                    GestureDetector(
                      onTap: sameCheck,
                      child: Container(
                        width: 108,
                        height: 40,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xff8A8A8A),
                            width: Sizes.size1,
                          ),
                          borderRadius: BorderRadius.circular(Sizes.size5),
                        ),
                        child: const Center(
                          child: Text(
                            "중복 확인",
                            style: TextStyle(
                              fontSize: Sizes.size12,
                              color: Color(0xff8A8A8A),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Gaps.h6,
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "본인인증을 진행해주세요",
                      style: TextStyle(
                        fontSize: Sizes.size11,
                        color: Colors.red,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "아이디",
                        style: TextStyle(
                          fontSize: Sizes.size12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Gaps.v10,
                      SizedBox(
                        height: 40,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: Sizes.size12,
                              vertical: Sizes.size10,
                            ),
                          ),
                          validator: (value) {
                            if (value == '' || value!.length < 7) {
                              return "사용할 수 없는 아이디입니다";
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            formData['id'] = newValue!;
                          },
                        ),
                      ),
                      Gaps.v16,
                      const Text(
                        "비밀번호",
                        style: TextStyle(
                          fontSize: Sizes.size12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Gaps.v10,
                      SizedBox(
                        height: 40,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: Sizes.size12,
                              vertical: Sizes.size10,
                            ),
                          ),
                          validator: (value) {
                            _pw = value!;
                            if (value == '' || value.length < 8) {
                              return "비밀번호가 안전하지 않습니다";
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            formData['pw'] = newValue!;
                          },
                        ),
                      ),
                      Gaps.v16,
                      const Text(
                        "비밀번호 확인",
                        style: TextStyle(
                          fontSize: Sizes.size12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Gaps.v10,
                      SizedBox(
                        height: 40,
                        child: TextFormField(
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey,
                              ),
                            ),
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: Sizes.size12,
                              vertical: Sizes.size10,
                            ),
                          ),
                          validator: (value) {
                            if (value == '' || value != _pw) {
                              return "비밀번호가 일치하지 않습니다";
                            }
                            return null;
                          },
                          onSaved: (newValue) {
                            formData['pwcheck'] = newValue!;
                          },
                        ),
                      ),
                      Gaps.v44,
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "약관동의",
                            style: TextStyle(
                              fontSize: Sizes.size12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "약관 동의에 체크해주시기 바랍니다.",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: Sizes.size12,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        ],
                      ),
                      Gaps.v9,
                      Container(
                        height: 1,
                        decoration: const BoxDecoration(
                          color: Color(0xff8A8A8A),
                        ),
                      ),
                      Gaps.v9,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: _onNessTap,
                            child: _isNessChecked
                                ? Image.asset(
                                    "assets/images/is_checked.png",
                                  )
                                : Image.asset(
                                    "assets/images/not_checked.png",
                                  ),
                          ),
                          Gaps.h8,
                          GestureDetector(
                            onTap: _onNessTap,
                            child: _isNessChecked
                                ? const Text(
                                    "[필수] ETCO 회원약관, 쇼핑몰 호스팅 이용 약관에 동의하며,\n 개인정보 수집 및 이용에 동의합니다",
                                    style: TextStyle(
                                      fontSize: Sizes.size12,
                                      fontWeight: FontWeight.w600,
                                      decoration: TextDecoration.underline,
                                      color: Colors.black,
                                    ),
                                  )
                                : const Text(
                                    "[필수] ETCO 회원약관, 쇼핑몰 호스팅 이용 약관에 동의하며,\n 개인정보 수집 및 이용에 동의합니다",
                                    style: TextStyle(
                                      fontSize: Sizes.size12,
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff8A8A8A),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                      Gaps.v20,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: _onSeleTap,
                            child: _isSeleChecked
                                ? Image.asset(
                                    "assets/images/is_checked.png",
                                  )
                                : Image.asset(
                                    "assets/images/not_checked.png",
                                  ),
                          ),
                          Gaps.h8,
                          GestureDetector(
                            onTap: _onSeleTap,
                            child: _isSeleChecked
                                ? const Text(
                                    "[선택] 프로모션 정보 수신 동의(핸드폰)",
                                    style: TextStyle(
                                      fontSize: Sizes.size12,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  )
                                : const Text(
                                    "[선택] 프로모션 정보 수신 동의(핸드폰)",
                                    style: TextStyle(
                                      fontSize: Sizes.size12,
                                      color: Color(0xff8A8A8A),
                                    ),
                                  ),
                          ),
                        ],
                      ),
                      Gaps.v40,
                      GestureDetector(
                        onTap: _onSubmitTap,
                        child: const AuthButton(
                          text: "가입하기",
                        ),
                      ),
                      Gaps.v96,
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
