import 'package:etco/constants/gaps.dart';
import 'package:etco/constants/sizes.dart';
import 'package:flutter/material.dart';

class Terms extends StatelessWidget {
  const Terms({super.key});

  void _onSubmitTap(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 35),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Gaps.v56,
              Text(
                '법인 회원(법인 기관/단체) 인증 안내',
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 23,
                    fontWeight: FontWeight.w600),
              ),
              Gaps.v96,
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/one.png',
                        scale: 0.7,
                      ),
                      Gaps.h10,
                      const Text(
                        '법인 등록 번호를 부여받지 않은 사업자는 기관/단체\n(고유번호를 가진 단체)를 선택하여 기입하셔야 됩니다',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      )
                    ],
                  ),
                  Gaps.v16,
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/two.png',
                        scale: 0.7,
                      ),
                      Gaps.h10,
                      const Text(
                        '사업자 인증 및 대표자 인증이 가능하지 않은 경우\n아래 인증 서류를 확인하여 이메일로 보내주시기 바랍니다',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  Gaps.v16,
                  const Padding(
                    padding: EdgeInsets.only(
                      left: Sizes.size32,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '*사업자 인증서류\n- 법인 사업자: 사업자 등록증, 법인 등기부등본 중 사본 1부\n- 기관/단체: 고유번호 등 사본 1부',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        Gaps.v10,
                        Text(
                          '* 대표자 인증 서류\n- 대표자 신분증,법인 인감 증명서 사본 1부',
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gaps.v16,
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/three.png',
                        scale: 0.7,
                      ),
                      Gaps.h10,
                      const Text('접수 방법 : 이메일 ITSEAETCO@gmail.com'),
                    ],
                  ),
                  Gaps.v10,
                  const Padding(
                    padding: EdgeInsets.only(
                      left: Sizes.size32,
                    ),
                    child: Text(
                      '(전송시 아이디 정보와, ‘법인명(혹은 기관명)\n회원 인증 요청’ 문구를 함께 기재해 주시기 바랍니다)',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Gaps.v24,
                  Row(
                    children: [
                      Image.asset(
                        'assets/images/four.png',
                        scale: 0.7,
                      ),
                      Gaps.h10,
                      const Text(
                        '인증이 완료된 이후 판매가 가능하십니다.',
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Gaps.v96,
              GestureDetector(
                onTap: () => _onSubmitTap(context),
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: Container(
                    height: Sizes.size60,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                    ),
                    child: const Center(
                      child: Text(
                        '확인',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
