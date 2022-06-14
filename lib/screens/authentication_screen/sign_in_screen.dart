import 'package:flutter/material.dart';
import 'package:graduate_thesis/themes/theme.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _passwordSecure = false;
  final _accountController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  AutovalidateMode _autovalidate = AutovalidateMode.disabled;
  bool _isKeepSession = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "PM",
                  style: TextStyle(
                    fontFamily: 'Mogena',
                    fontSize: 128,
                    color: AppColor.primary1,
                  ),
                ),
                Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: AppTextField.textField(
                          controller: _accountController,
                          hintText: 'Account',
                          icon: AppIcons.user,
                          onSaved: (value) {
                            _accountController.text = value!.trim();
                          },
                          onChanged: (value) {
                            setState(() {});
                          },
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return 'Không được để trống';
                            }
                            return null;
                          },
                        ),
                      ),
                      AppTextField.passwordField(
                        controller: _passwordController,
                        hintText: 'Password',
                        obscureText: _passwordSecure,
                        passwordIconOnPressed: () {
                          setState(() {
                            _passwordSecure = !_passwordSecure;
                          });
                        },
                        onSaved: (value) {
                          _passwordController.text = value!.trim();
                        },
                        onChanged: (value) {
                          setState(() {});
                        },
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Không được để trống';
                          }
                          if (value.trim().length < 6) {
                            return 'Mật khẩu phải có ít nhất 6 ký tự';
                          }
                          return null;
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                  width: 18,
                                  height: 18,
                                  child: Checkbox(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(2),
                                    ),
                                    side: BorderSide(
                                      color: AppColor.text2,
                                      width: 2,
                                    ),
                                    checkColor: AppColor.white,
                                    activeColor: AppColor.primary1,
                                    value: _isKeepSession,
                                    onChanged: (value) {
                                      setState(() {
                                        _isKeepSession = !_isKeepSession;
                                      });
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 11),
                                  child: Text(
                                    'Remember me',
                                    style: AppTextStyle.normalText(
                                      AppColor.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            InkWell(
                              child: Text(
                                'Forgot Password?',
                                style: AppTextStyle.mediumBodyText(
                                  AppColor.primary1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      AppButton.defaultButton(
                        color: AppColor.primary1,
                        child: Text(
                          'Sign in',
                          style: AppTextStyle.headerTitle(
                            AppColor.white,
                          ),
                        ),
                        onPressed: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don’t have an account yet?',
                              style: AppTextStyle.normalText(
                                AppColor.black,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text(
                                'Sign in',
                                style: AppTextStyle.headerTitle(
                                  AppColor.primary1,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
