import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:graduate_thesis/main.dart';
import 'package:graduate_thesis/routes/route_names.dart';
import 'package:graduate_thesis/themes/theme.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _checkController = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  AutovalidateMode _autovalidate = AutovalidateMode.disabled;
  bool _passwordSecure = true;
  bool _checkSecure = true;
  bool isEmail = true;
  String _errorMessage = '';
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SafeArea(
          child: Container(
            height: screenSize.height,
            margin: const EdgeInsets.symmetric(horizontal: 16),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          splashColor: AppColor.transparent,
                          highlightColor: AppColor.transparent,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Center(
                                  child: AppIcon(
                                    AppIcons.backIOS,
                                    color: AppColor.black,
                                    size: 24,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 8),
                                  child: Text(
                                    'Sign in',
                                    style: AppTextStyle.boldBodyText(
                                        AppColor.black),
                                  ),
                                )
                              ],
                            ),
                          ),
                          onTap: () {
                            navigatorTo(context, signInRoute);
                          },
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(32, 56, 32, 63),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 8),
                          child: Text(
                            isEmail ? 'Sign up' : 'Almost done!',
                            style: TextStyle(
                              fontFamily: 'PlusJakartaSans',
                              fontWeight: FontWeight.w800,
                              color: AppColor.primary1,
                              fontSize: 32,
                            ),
                          ),
                        ),
                        Text(
                          isEmail
                              ? 'Feel free to register your account accessing all of our services.'
                              : 'Enter your  password to complete the process.',
                          style: AppTextStyle.mediumBodyText(AppColor.text2),
                        ),
                      ],
                    ),
                  ),
                  Form(
                    key: _key,
                    autovalidateMode: _autovalidate,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        if (isEmail)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            child: Container(
                              constraints: const BoxConstraints(minHeight: 56),
                              child: AppTextField.textField(
                                controller: _emailController,
                                hintText: 'Enter your email',
                                icon: AppIcons.email,
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
                          ),
                        if (!isEmail) _buildPassword(),
                        if (_errorMessage.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24),
                            child: Text(
                              _errorMessage,
                              style: AppTextStyle.normalText(
                                AppColor.primary5,
                              ),
                            ),
                          ),
                        AppButton.roundedButton(
                          color: AppColor.primary1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AppIcon(
                                AppIcons.checkCir,
                                color: AppColor.white,
                                size: 24,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 12),
                                child: Text(
                                  isEmail ? 'Next' : 'Complete!',
                                  style: AppTextStyle.headerTitle(
                                    AppColor.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          onPressed: () {
                            if (_key.currentState!.validate()) {
                              _key.currentState!.save();
                              if (isEmail) {
                                setState(() {
                                  isEmail = false;
                                });
                              } else {
                                _signUp();
                              }
                            } else {
                              setState(() {
                                _autovalidate =
                                    AutovalidateMode.onUserInteraction;
                              });
                            }
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _buildPassword() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Column(
        children: [
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
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: AppTextField.passwordField(
              controller: _checkController,
              hintText: 'Re-enter password',
              obscureText: _checkSecure,
              passwordIconOnPressed: () {
                setState(() {
                  _checkSecure = !_checkSecure;
                });
              },
              onSaved: (value) {},
              onChanged: (value) {
                setState(() {
                  _errorMessage = '';
                });
              },
              validator: (value) {
                if (value!.trim().isEmpty) {
                  return 'Re-enter password must not be empty';
                }
                if (value.trim() != _passwordController.text) {
                  return 'Password do not match';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }

  _signUp() {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    )
        .then((value) {
      FirebaseFirestore.instance.collection('users').doc(value.user!.uid).set(
        {
          'email': _emailController.text,
          'password': _passwordController.text,
        },
      );
    }).catchError(
      (error, stackTrace) {
        setState(() {
          _errorMessage = error.toString();
        });
      },
    ).whenComplete(
      () => navigatorTo(context, signInRoute),
    );
  }
}
