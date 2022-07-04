import 'package:beacon_flutter_mobapp/phone_verification_screen.dart';
import 'package:beacon_flutter_mobapp/sign_in_screen.dart';
import 'package:beacon_flutter_mobapp/utils/images.dart';
import 'package:beacon_flutter_mobapp/utils/methods.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController? _fullNameController;
  TextEditingController? _phoneNumberController;
  TextEditingController? _passwordController;
  bool? _isLoading, _isAllTextsFilled;
  bool? _isPasswordVisible;

  @override
  void initState() {
    super.initState();
    _fullNameController = TextEditingController();
    _phoneNumberController = TextEditingController();
    _passwordController = TextEditingController();
    _isLoading = false;
    _isAllTextsFilled = false;
    _isPasswordVisible = false;
  }

  @override
  void dispose() {
    _fullNameController?.dispose();
    _phoneNumberController?.dispose();
    _passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 60),
            Image.asset(Images.logo, color: Colors.black),
            const Text('B E A C O N', style: TextStyle(fontSize: 40, color: Colors.black)),
            const SizedBox(height: 30),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Set up your account',
                    style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text('Please Set up your Account', style: TextStyle(fontSize: 15)),
                  const SizedBox(height: 50),
                  TextFormField(
                    controller: _fullNameController,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.account_circle_outlined),
                      labelText: 'Full Name (As in your National ID)',
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty &&
                          _phoneNumberController!.text.trim().isNotEmpty &&
                          _passwordController!.text.trim().isNotEmpty) {
                        setState(() {
                          _isAllTextsFilled = true;
                        });
                      } else {
                        setState(() {
                          _isAllTextsFilled = false;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone_android),
                      labelText: 'Phone Number',
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty &&
                          _fullNameController!.text.trim().isNotEmpty &&
                          _passwordController!.text.trim().isNotEmpty) {
                        setState(() {
                          _isAllTextsFilled = true;
                        });
                      } else {
                        setState(() {
                          _isAllTextsFilled = false;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  TextFormField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible!,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.key),
                      suffixIcon: IconButton(
                        icon: _isPasswordVisible!
                            ? const Icon(Icons.visibility)
                            : const Icon(Icons.visibility_off),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible!;
                          });
                        },
                      ),
                      labelText: 'Password',
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty &&
                          _fullNameController!.text.trim().isNotEmpty &&
                          _phoneNumberController!.text.trim().isNotEmpty) {
                        setState(() {
                          _isAllTextsFilled = true;
                        });
                      } else {
                        setState(() {
                          _isAllTextsFilled = false;
                        });
                      }
                    },
                  ),
                  termsConditionsRow(),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: _isAllTextsFilled! ? Colors.black87 : Colors.grey.shade200,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text(
                      'SUBMIT →',
                      style: TextStyle(color: _isAllTextsFilled! ? Colors.white : Colors.black38),
                    ),
                    onPressed: () {
                      if (_fullNameController!.text.trim().isEmpty) {
                        displaySnackBar(context, 'Please enter full name');
                      } else if (_phoneNumberController!.text.trim().isEmpty) {
                        displaySnackBar(context, 'Please enter phone number');
                      } else if (_passwordController!.text.trim().isEmpty) {
                        displaySnackBar(context, 'Please enter password');
                      } else {
                        setState(() {
                          _isLoading = true;
                        });
                        Future.delayed(const Duration(seconds: 5), () {
                          setState(() {
                            _isLoading = false;
                          });
                          Navigator.push(context, MaterialPageRoute(builder: (_) {
                            return const PhoneVerificationScreen();
                          }));
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  _isLoading! ? const Center(child: CircularProgressIndicator()) : const SizedBox(),
                  alreadyHaveAccount(context),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget termsConditionsRow() {
    return Row(
      children: [
        SizedBox(
          width: 25,
          child: Checkbox(
            value: true,
            onChanged: (bool? value) {
              if (kDebugMode) {
                print(kDebugMode);
                print(value);
              }
            },
          ),
        ),
        const Flexible(
          child: FittedBox(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(text: 'I agree to the '),
                  TextSpan(text: 'Terms & Conditions ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: 'of Beacon'),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget alreadyHaveAccount(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Text.rich(
          TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: 'Already have an Account?',
                style: TextStyle(
                  color: Colors.blue.shade200,
                  decoration: TextDecoration.none,
                ),
              ),
              const TextSpan(
                text: ' LOGIN!',
                style: TextStyle(
                  color: Colors.black87,
                  decoration: TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return const SignInScreen();
        }));
      },
    );
  }
}
