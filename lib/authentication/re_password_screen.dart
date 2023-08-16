import 'package:etco/authentication/re_password2.dart';
import 'package:etco/constants/gaps.dart';
import 'package:etco/constants/sizes.dart';
import 'package:flutter/material.dart';

// 비밀번호 재설정 화면 위젯
class RePasswordScreen extends StatefulWidget {
  const RePasswordScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RePasswordScreenState createState() => _RePasswordScreenState();
}

// 비밀번호 재설정 화면 상태 클래스
class _RePasswordScreenState extends State<RePasswordScreen> {
  // E-mail 주소 선택 상태 플래그
  bool _isEmailSelected = false;

  // 휴대폰 번호 선택 상태 플래그
  bool _isPhoneSelected = false;

  // E-mail 주소 선택 토글
  void _toggleEmailSelection() {
    setState(() {
      _isEmailSelected = !_isEmailSelected;
      if (_isEmailSelected && _isPhoneSelected) _isPhoneSelected = false;
    });
  }

  // 휴대폰 번호 선택 토글
  void _togglePhoneSelection() {
    setState(() {
      _isPhoneSelected = !_isPhoneSelected;
      if (_isEmailSelected && _isPhoneSelected) _isEmailSelected = false;
    });
  }

  void _navigateToNextScreen() {
    if (_isEmailSelected || _isPhoneSelected) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const RePasswordTwo(),
        ),
      );
    }
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  // 입력 필드 위젯 생성
  Widget _buildInputField(String hintText) {
    return TextField(
      decoration: InputDecoration(
        hintText: hintText,
        contentPadding: const EdgeInsets.only(
          left: Sizes.size10,
          top: Sizes.size10,
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
      ),
      cursorColor: Theme.of(context).primaryColor,
    );
  }

// 선택 옵션 위젯 생성
  // Widget _buildCheckOption(String text, bool isSelected, VoidCallback onTap) {
  //   return GestureDetector(
  //     onTap: onTap,
  //     child: Row(
  //       children: [
  //         Container(
  //           height: 15,
  //           width: 15,
  //           decoration: BoxDecoration(
  //             color: isSelected ? Theme.of(context).primaryColor : Colors.transparent,
  //             shape: BoxShape.circle,
  //             border: Border.all(
  //               color: Theme.of(context).primaryColor,
  //             ),
  //           ),
  //         ),
  //         Gaps.h10,
  //         Text(text),
  //       ],
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: Sizes.size32),
            child: Column(
              children: [
                Gaps.v96,
                // "ID / PW 찾기" 제목
                const Text(
                  "ID / PW 찾기",
                  style: TextStyle(
                    fontSize: Sizes.size44,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Gaps.v72,
                // "비밀번호 재설정" 부제목
                const Text(
                  "비밀번호 재설정",
                  style: TextStyle(
                    fontSize: Sizes.size20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gaps.v48,
                // 아이디 입력 필드
                _buildInputField("아이디"),
                Gaps.v1,
                // 이름 입력 필드
                _buildInputField("이름"),
                //컨테이너 내부
                Gaps.v48,
                Container(
                  width: 350,
                  height: 100,
                  padding:
                      const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xfff3f3f3),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "비밀번호 찾기 방법을\n선택해주세요",
                            style: TextStyle(
                              fontSize: Sizes.size14,
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              GestureDetector(
                                onTap: _toggleEmailSelection,
                                child: Container(
                                  width: 14,
                                  height: 14,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.transparent,
                                    border: Border.all(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  child: Center(
                                    child: _isEmailSelected
                                        ? Container(
                                            width: 10,
                                            height: 10,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          )
                                        : null,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "E-mail 주소",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: _togglePhoneSelection,
                                child: Container(
                                  width: 14,
                                  height: 14,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.transparent,
                                    border: Border.all(
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  child: Center(
                                    child: _isPhoneSelected
                                        ? Container(
                                            width: 10,
                                            height: 10,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                          )
                                        : null,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                "등록된 휴대폰 번호",
                                style: TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // 정보 불일치 경고 문구
                Gaps.v32,
                const Text(
                  "*입력하신 정보와 일치하는 계정이 없습니다",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Gaps.v32,
                // 다음 버튼
                GestureDetector(
                  onTap: _navigateToNextScreen,
                  child: Container(
                    height: Sizes.size60,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    child: const Center(
                      child: Text(
                        "다음 >",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
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
