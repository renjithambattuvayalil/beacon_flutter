import 'package:beacon_flutter_mobapp/dashboard_screen.dart';
import 'package:beacon_flutter_mobapp/sign_up_screen.dart';
import 'package:beacon_flutter_mobapp/utils/images.dart';
import 'package:beacon_flutter_mobapp/utils/methods.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController? _phoneNumberController;
  TextEditingController? _passwordController;
  bool? _isLoading, _isAllValuesEntered;
  bool? _isPasswordVisible;

  @override
  void initState() {
    super.initState();
    _phoneNumberController = TextEditingController();
    _passwordController = TextEditingController();
    _isLoading = false;
    _isAllValuesEntered = false;
    _isPasswordVisible = false;
  }

  @override
  void dispose() {
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
                    'Sign In to your account',
                    style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text('Please Sign In to your Account', style: TextStyle(fontSize: 15)),
                  const SizedBox(height: 50),
                  TextFormField(
                    controller: _phoneNumberController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.phone_android),
                      labelText: 'Phone Number',
                    ),
                    onChanged: (value) {
                      if (value.isNotEmpty && _passwordController!.text.trim().isNotEmpty) {
                        setState(() {
                          _isAllValuesEntered = true;
                        });
                      } else {
                        setState(() {
                          _isAllValuesEntered = false;
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
                      if (value.isNotEmpty && _phoneNumberController!.text.trim().isNotEmpty) {
                        setState(() {
                          _isAllValuesEntered = true;
                        });
                      } else {
                        setState(() {
                          _isAllValuesEntered = false;
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  Container(
                    alignment: Alignment.centerRight,
                    child: const Text('Forgot Password?'),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: _isAllValuesEntered! ? Colors.black87 : Colors.grey.shade200,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text(
                      'SIGN IN →',
                      style: TextStyle(color: _isAllValuesEntered! ? Colors.white : Colors.black38),
                    ),
                    onPressed: () {
                      if (_phoneNumberController!.text.trim().isEmpty) {
                        displaySnackBar(context, 'Please enter phone number');
                      } else if (_passwordController!.text.trim().isEmpty) {
                        displaySnackBar(context, 'Please enter password');
                      } else {
                        setState(() {
                          _isLoading = true;
                        });
                        if (_phoneNumberController!.text.trim() != '9876543210' ||
                            _passwordController!.text.trim() != 'admin') {
                          Future.delayed(const Duration(seconds: 5), () {
                            setState(() {
                              _isLoading = false;
                            });
                            displaySnackBar(context, 'Invalid Credentials!');
                          });
                        } else {
                          Future.delayed(const Duration(seconds: 5), () {
                            setState(() {
                              _isLoading = false;
                            });
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) {
                              return const DashboardScreen();
                            }), (route) => false);
                          });
                        }
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  _isLoading! ? const Center(child: CircularProgressIndicator()) : const SizedBox(),
                  //const SizedBox(height: 70),
                  const SizedBox(height: 10),
                  createNewAccount(context),
                  const SizedBox(height: 10),
                  useAnonymously(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget useAnonymously() {
    return Center(
      child: Text.rich(
        TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: "Don't want to Register?",
              style: TextStyle(
                color: Colors.blue.shade200,
                decoration: TextDecoration.none,
              ),
            ),
            const TextSpan(
              text: ' USE ANONYMOUSLY!',
              style: TextStyle(
                color: Colors.black87,
                decoration: TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget createNewAccount(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Text.rich(
          TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: "Don't have an Account?",
                style: TextStyle(
                  color: Colors.blue.shade200,
                  decoration: TextDecoration.none,
                ),
              ),
              const TextSpan(
                text: ' CREATE NEW!',
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
          return const SignUpScreen();
        }));
      },
    );
  }
}
