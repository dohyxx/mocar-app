import 'dart:async';
import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mocar_test/app/common/ui.dart';
import 'package:mocar_test/app/modules/auth/controllers/auth_controller.dart';



class MocarLoginView extends GetView<AuthController> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _loginFormKey =  new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      //key: _loginFormKey,
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        key: scaffoldKey,
        child: Center(
          child: Form(
            key: _loginFormKey,
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 185,
                            decoration: new BoxDecoration(
                              color: Color(0xFF00855B),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [

                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/icon/Group.png'),
                                    ],
                                  ),
                                ),

                                Container(
                                  child: Expanded(
                                    child: Align(
                                      alignment: AlignmentDirectional(1.0, 4.5),
                                      child: Image.asset('assets/icon/truck1.png',
                                        height: 165),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),

                      Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                          children: [

                          SizedBox(height: 20),

                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '차주님 반갑습니다!',
                              style: TextStyle(
                                color: Colors.black87,
                                fontSize: 25,
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          const SizedBox(height: 6),

                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '서비스 이용을 위해 로그인이 필요해요.',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                                fontFamily: 'NotoSansKR',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),


                          SizedBox(height: 30),


                          //차량번호 인풋 시작
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xffd6d6d6),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                                    child: TextFormField(
                                      controller: controller.carNumber,
                                      decoration: const InputDecoration(
                                        border: InputBorder.none,
                                        hintText: '차량번호',
                                        hintStyle: TextStyle(
                                          color: Color(0xff9b9b9b),
                                          fontSize: 15,
                                          fontFamily: 'NotoSansKR',
                                        ),
                                      ),
                                      // readOnly: controller.conveyanceDetail.value.wtCnfirmYn,
                                      readOnly: false,
                                      obscureText: false,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Noto Sans',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      keyboardType: TextInputType.text,
                                      textInputAction: TextInputAction.done,
                                      validator: (input) {
                                        if (input == null ||
                                            input.trim().isEmpty) {
                                          return '차량번호를 입력하세요.';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //차량번호 인풋 종료

                          const SizedBox(height: 10),

                          //휴대폰번호 인풋 시작
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xffd6d6d6),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                                    child: TextFormField(
                                      controller: controller.phoneNumber,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '휴대폰 번호',
                                          hintStyle: TextStyle(
                                            color: Color(0xff9b9b9b),
                                            fontSize: 15,
                                            fontFamily: 'NotoSansKR',
                                        ),
                                      ),
                                      // readOnly: controller.conveyanceDetail.value.wtCnfirmYn,
                                      readOnly: false,
                                      obscureText: false,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Noto Sans',
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.done,
                                      validator: (input) {
                                        if (input == null ||
                                            input.trim().isEmpty) {
                                          return '휴대폰번호를 입력하세요.';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //휴대폰번호 인풋 종료

                          const SizedBox(height: 10),

                          //비밀번호 인풋 시작
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Color(0xffd6d6d6),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Stack(
                              children: [
                                Align(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 4),
                                    child: TextFormField(
                                      controller: controller.pwdInput,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none,
                                          hintText: '비밀번호',
                                          hintStyle: TextStyle(
                                            color: Color(0xff9b9b9b),
                                            fontSize: 16,
                                            fontFamily: 'NotoSansKR',
                                        ),
                                      ),
                                      // readOnly: controller.conveyanceDetail.value.wtCnfirmYn,
                                      readOnly: false,
                                      obscureText: true,
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontFamily: 'Noto Sans',
                                        fontSize: 15,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      // keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.done,
                                      validator: (input) {
                                        if (input == null || input.trim().isEmpty) {
                                          return '비밀번호를 입력하세요.';
                                        }
                                        return null;
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          //비밀번호 인풋 종료

                          ],
                        ),
                        ),
                      ),

                      SizedBox(height: 10),


                      Obx((){
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 22),
                          child: Row(
                            children: [
                              Ui.checkBox(controller.isRememberMe),
                              Text.rich(
                                TextSpan(
                                  text: '  자동 로그인',
                                  style: const TextStyle(
                                    color: Color(0xff9b9b9b),
                                    fontFamily: 'NotoSansKR',
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                  recognizer: new TapGestureRecognizer()..onTap = () {
                                      controller.isRememberMe.value = !controller.isRememberMe.value;
                                      Get.log('<======= text checkValue: ' + controller.isRememberMe.value.toString());
                                    },
                                ),
                              ),
                            ],
                          ),
                        );
                      }),

                      SizedBox(height: 25),


                      //로그인 버튼 시작
                      MaterialButton(
                        minWidth: 325,
                        height: 60,
                        color: Color(0xff98CECB),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
                        onPressed: () async{
                          if(_loginFormKey.currentState.validate()) {
                            _loginFormKey.currentState.save();
                            controller.isContentLoading.value = false;
                            Get.log('<======== Login button Click....');

                            controller.login();
                          }

                        },
                        child: const Text(
                          '로그인',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'NotoSansKR',
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.normal
                          ),
                        ),
                      ),
                      //로그인 버튼 종료

                      SizedBox(height: 150),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}