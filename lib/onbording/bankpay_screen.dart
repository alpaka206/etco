import 'package:flutter/material.dart';
import 'package:etco/constants/gaps.dart';
import 'package:etco/constants/sizes.dart';
import 'package:etco/authentication/widgets/text_form_field.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Bankpay_screen extends StatefulWidget {
  const Bankpay_screen({super.key});

  @override
  State<Bankpay_screen> createState() => _Bankpay_screenState();
}

class _Bankpay_screenState extends State<Bankpay_screen> {
  final _bankList = [
    '선택',
    '국민 은행',
    '하나 은행',
    '신한 은행',
    '제일 은행',
    '중앙 은행',
    '한국 은행',
  ];
  String _selectBank = '선택';

  // 폼 상태를 관리하는 GlobalKey
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, String> formData = {}; // 폼 데이터를 저장하는 맵

  // 다음 버튼 클릭 시
  void _onnextTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
      }
    }
  }

  void _onpreviousTap() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 26,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v96,
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size2,
                ),
                child: Align(
                  alignment: Alignment.center, //가운데 정렬
                  child: Text(
                    "무통장 입금 서비스 계좌번호 입력",
                    style: TextStyle(
                      fontSize: Sizes.size24,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ),
              ),
              Gaps.v80,
              const Text(
                '은행명',
                style: TextStyle(
                  fontSize: Sizes.size16,
                ),
              ),
              Gaps.v12,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size20,
                      ),
                      height: Sizes.size52,
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
                          fontSize: Sizes.size14,
                          fontWeight: FontWeight.w300,
                          color: Colors.black,
                        ),
                        value: _selectBank,
                        items: _bankList.map(
                          (value) {
                            return DropdownMenuItem(
                              value: value,
                              child: Text(value),
                            );
                          },
                        ).toList(),
                        onChanged: (value) {
                          setState(
                            () {
                              _selectBank = value!;
                            },
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Gaps.v32,
              Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      '예금주',
                      style: TextStyle(
                        fontSize: Sizes.size16,
                      ),
                    ),
                    Gaps.v12,
                    // 예금주 입력 필드
                    RenderTextFormField(
                      isObsecure: false,
                      onSaved: (value) {
                        formData['id'] = value; // 예금주 정보 저장
                      },
                      validator: (value) {
                        // 유효성 검사
                        if (RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                          return "입력 정보를 다시 확인해주십시오.";
                        }
                        return null;
                      },
                    ),
                    Gaps.v32,
                    const Text(
                      "계좌번호",
                      style: TextStyle(
                        fontSize: Sizes.size16,
                      ),
                    ),
                    Gaps.v12,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // 계좌번호 입력 필드
                        SizedBox(
                          width: 230,
                          child: TextField(
                            cursorColor: Theme.of(context).primaryColor,
                            keyboardType: TextInputType.number, // 숫자만 입력받도록 설정
                            inputFormatters: <TextInputFormatter>[
                              FilteringTextInputFormatter.allow(
                                  RegExp(r'[0-9\-]')), // 숫자와 하이픈만 허용
                            ],
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: Sizes.size12,
                              ),
                              hintText: '135-1111-11-1111',
                              hintStyle: TextStyle(
                                color: Theme.of(context).hintColor,
                                fontSize: Sizes.size14,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(
                                  Sizes.size7,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(
                                  Sizes.size7,
                                ),
                              ),
                            ),
                            onChanged: (value) {
                              if (value.contains(RegExp(r'[^0-9\-]'))) {
                                // 숫자와 하이픈 이외의 문자가 입력된 경우
                                // 입력 정보를 다시 확인해주십시오. 메시지 표시
                                print("입력 정보를 다시 확인해주십시오.");
                              }
                            },
                          ),
                        ),
                        // "계좌 확인" 버튼
                        Container(
                          height: Sizes.size48,
                          width: Sizes.size96 + Sizes.size24, // 버튼 너비
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                            ),
                            borderRadius: BorderRadius.circular(
                              Sizes.size7,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              '계좌 확인',
                              style: TextStyle(
                                color: Theme.of(context).hintColor,
                                fontSize: Sizes.size14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Gaps.v72,
              const Align(
                alignment: Alignment.center, //가운데 정렬
                child: Text(
                  '* 설정한 정보는 [판매자정보 -> 정산정보]에서 변경 가능합니다.',
                  style: TextStyle(
                    fontSize: Sizes.size12,
                    color: Colors.black,
                  ),
                ),
              ),
              Gaps.v32,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                        onTap: _onpreviousTap,
                        child: Container(
                            height: 45,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                            ),
                            child: const Center(
                              child: Text(
                                "< 이전",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ))),
                  ),
                  Gaps.h16,
                  Expanded(
                    child: GestureDetector(
                      onTap: _onnextTap,
                      child: Container(
                        height: 45,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                        ),
                        child: const Center(
                          child: Text(
                            "저장 후 다음 >",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
