import 'package:beacon_flutter_mobapp/dashboard_screen.dart';
import 'package:beacon_flutter_mobapp/utils/images.dart';
import 'package:beacon_flutter_mobapp/utils/methods.dart';
import 'package:flutter/material.dart';

class PhoneVerificationScreen extends StatefulWidget {
  const PhoneVerificationScreen({Key? key}) : super(key: key);

  @override
  State<PhoneVerificationScreen> createState() => _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen> {
  String? textOne = '', textTwo = '', textThree = '', textFour = '';
  String? enteredOtp = '';
  bool? isAllDigitsEntered = false;
  bool? _isLoading = false;

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
                    'Verify your phone number',
                    style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text('Please verify your Phone number', style: TextStyle(fontSize: 15)),
                  const SizedBox(height: 50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _otpTextField(context, first: true, last: false, index: 0),
                      _otpTextField(context, first: false, last: false, index: 1),
                      _otpTextField(context, first: false, last: false, index: 2),
                      _otpTextField(context, first: false, last: true, index: 3),
                    ],
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: isAllDigitsEntered! ? Colors.black87 : Colors.grey.shade200,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child:
                        Text('VERIFY →', style: TextStyle(color: isAllDigitsEntered! ? Colors.white : Colors.black38)),
                    onPressed: () {
                      if (enteredOtp!.isEmpty) {
                        displaySnackBar(context, 'Pleased enter the OTP, received on your phone');
                        return;
                      }
                      setState(() {
                        _isLoading = true;
                      });
                      if (enteredOtp == '1234') {
                        Future.delayed(const Duration(seconds: 5), () {
                          setState(() {
                            _isLoading = false;
                          });
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) {
                            return const DashboardScreen();
                          }), (route) => false);
                        });
                      } else {
                        Future.delayed(const Duration(seconds: 5), () {
                          setState(() {
                            _isLoading = false;
                          });
                          displaySnackBar(context, 'Invalid OTP');
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 20),
                  _isLoading! ? const Center(child: CircularProgressIndicator()) : const SizedBox(),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            const Text('02:50', style: TextStyle(fontSize: 15)),
            const SizedBox(height: 20),
            const Text('RESEND OTP', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _otpTextField(BuildContext context, {bool? first, last, int? index}) {
    return SizedBox(
      height: 85,
      child: AspectRatio(
        aspectRatio: 0.8,
        child: TextField(
          autofocus: true,
          showCursor: false,
          readOnly: false,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          keyboardType: TextInputType.number,
          maxLength: 1,
          decoration: const InputDecoration(
            counter: Offstage(),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.black12),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(width: 2, color: Colors.purple),
            ),
          ),
          onChanged: (value) {
            if (value.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            }
            if (value.isEmpty && first == false) {
              FocusScope.of(context).previousFocus();
            }
            switch (index) {
              case 0:
                textOne = value;
                break;
              case 1:
                textTwo = value;
                break;
              case 2:
                textThree = value;
                break;
              case 3:
                textFour = value;
                break;
            }
            enteredOtp = textOne! + textTwo! + textThree! + textFour!;
            if (enteredOtp!.length == 4) {
              setState(() {
                isAllDigitsEntered = true;
              });
            } else {
              setState(() {
                isAllDigitsEntered = false;
              });
            }
          },
        ),
      ),
    );
  }
}
