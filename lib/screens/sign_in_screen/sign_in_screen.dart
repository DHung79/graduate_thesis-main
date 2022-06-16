import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduate_thesis/core/logger/logger.dart';
import 'package:graduate_thesis/main.dart';
import 'package:graduate_thesis/routes/route_names.dart';
import 'package:graduate_thesis/themes/theme.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  bool _passwordSecure = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  AutovalidateMode _autovalidate = AutovalidateMode.disabled;
  bool _isKeepSession = false;
  String _errorMessage = '';
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
                  'PM',
                  style: TextStyle(
                    fontFamily: 'Mogena',
                    fontSize: 128,
                    color: AppColor.primary1,
                  ),
                ),
                Form(
                  key: _key,
                  autovalidateMode: _autovalidate,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 24),
                        child: AppTextField.textField(
                          controller: _emailController,
                          hintText: 'Email',
                          icon: AppIcons.user,
                          onSaved: (value) {
                            _emailController.text = value!.trim();
                          },
                          onChanged: (value) {
                            setState(() {
                              _errorMessage = '';
                            });
                          },
                          validator: (value) {
                            if (value!.trim().isEmpty) {
                              return 'Email must not be empty';
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
                          setState(() {
                            _errorMessage = '';
                          });
                        },
                        validator: (value) {
                          if (value!.trim().isEmpty) {
                            return 'Password must not be empty';
                          }
                          if (value.trim().length < 6) {
                            return 'Password must have at least 6 characters.';
                          }
                          return null;
                        },
                      ),
                      _actionsField(),
                      AppButton.defaultButton(
                        color: AppColor.primary1,
                        child: Text(
                          'Sign in',
                          style: AppTextStyle.headerTitle(
                            AppColor.white,
                          ),
                        ),
                        onPressed: () {
                          _signIn();
                        },
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
                              child: InkWell(
                                child: Text(
                                  'Sign up',
                                  style: AppTextStyle.headerTitle(
                                    AppColor.primary1,
                                  ),
                                ),
                                onTap: () {
                                  navigatorTo(context, signUpRoute);
                                },
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

  Widget _actionsField() {
    return Padding(
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
          // InkWell(
          //   child: Text(
          //     'Forgot Password?',
          //     style: AppTextStyle.mediumBodyText(
          //       AppColor.primary1,
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }

  _signIn() async {
    if (_key.currentState!.validate()) {
      _key.currentState!.save();
      // EmailAuthProvider.credential(email: email, password: password)
      // FirebaseAuth.instance.currentUser.reauthenticateWithCredential(credential)
      FirebaseAuth.instance
          .signInWithEmailAndPassword(
            email: _emailController.text,
            password: _passwordController.text,
          )
          .then((value) => currentUserId = value.user!.uid)
          .catchError(
        (error, stackTrace) {
          setState(() {
            _errorMessage = error.toString();
          });
        },
      ).whenComplete(
        () => navigatorTo(context, homeRoute),
      );
    } else {
      setState(() {
        _autovalidate = AutovalidateMode.onUserInteraction;
      });
    }
  }
}
