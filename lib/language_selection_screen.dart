import 'package:beacon_flutter_mobapp/on_boarding_screen.dart';
import 'package:beacon_flutter_mobapp/utils/images.dart';
import 'package:beacon_flutter_mobapp/utils/methods.dart' as methods;
import 'package:flutter/material.dart';

enum Languages { arabic, english, dummy }

class LanguageSelectionScreen extends StatefulWidget {
  const LanguageSelectionScreen({Key? key}) : super(key: key);

  @override
  State<LanguageSelectionScreen> createState() => _LanguageSelectionScreenState();
}

class _LanguageSelectionScreenState extends State<LanguageSelectionScreen> {
  Languages _selectedLanguage = Languages.dummy;
  bool? _isArabicSelected, _isEnglishSelected;
  bool? _isLoading;

  @override
  void initState() {
    super.initState();
    _isArabicSelected = false;
    _isEnglishSelected = false;
    _isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Images.logo, color: Colors.black),
            const Text('B E A C O N', style: TextStyle(fontSize: 40, color: Colors.black)),
            const SizedBox(height: 80),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Select Your Language',
                    style: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Please select your preferred language.Note that all the texts in the app shall be displayed in the selected Language.',
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: double.infinity,
                    height: 58,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: _isArabicSelected! ? Colors.black : Colors.white,
                      border: Border.all(color: Colors.blue.shade100),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Image.asset(Images.arabicIcon),
                        const SizedBox(width: 10),
                        Text('Arabic', style: TextStyle(color: _isArabicSelected! ? Colors.white : null)),
                        const Spacer(),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Transform.scale(
                              scale: 1.5,
                              child: Radio(
                                fillColor: _isArabicSelected!
                                    ? MaterialStateColor.resolveWith((states) => Colors.white)
                                    : null,
                                value: Languages.arabic,
                                groupValue: _selectedLanguage,
                                onChanged: (Languages? value) {
                                  setState(() {
                                    _isArabicSelected = true;
                                    _isEnglishSelected = false;
                                    _selectedLanguage = value!;
                                  });
                                },
                              ),
                            ),
                            Icon(
                              Icons.check,
                              size: 12,
                              color: _isArabicSelected! ? Colors.black : Colors.white,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    height: 58,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                      color: _isEnglishSelected! ? Colors.black : Colors.white,
                      border: Border.all(color: Colors.blue.shade100),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Image.asset(Images.englishIcon),
                        const SizedBox(width: 10),
                        Text('English', style: TextStyle(color: _isEnglishSelected! ? Colors.white : null)),
                        const Spacer(),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Transform.scale(
                              scale: 1.5,
                              child: Radio(
                                fillColor: _isEnglishSelected!
                                    ? MaterialStateColor.resolveWith((states) => Colors.white)
                                    : null,
                                value: Languages.english,
                                groupValue: _selectedLanguage,
                                onChanged: (Languages? value) {
                                  setState(() {
                                    _isEnglishSelected = true;
                                    _isArabicSelected = false;
                                    _selectedLanguage = value!;
                                  });
                                },
                              ),
                            ),
                            Icon(
                              Icons.check,
                              size: 12,
                              color: _isEnglishSelected! ? Colors.black : Colors.white,
                            ),
                            //Image.asset(Images.tickMark),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: _selectedLanguage == Languages.dummy ? Colors.grey.shade200 : Colors.black,
                      minimumSize: const Size(double.infinity, 58),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'PROCEED',
                          style: TextStyle(
                            color: _selectedLanguage == Languages.dummy ? Colors.black38 : Colors.white,
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          Images.rightArrow,
                          color: _selectedLanguage == Languages.dummy ? Colors.black38 : Colors.white,
                        ),
                      ],
                    ),
                    onPressed: () {
                      if (_selectedLanguage == Languages.dummy) {
                        String msg = 'Please select the Language';
                        methods.displaySnackBar(context, msg);
                      } else {
                        setState(() {
                          _isLoading = true;
                        });
                        Future.delayed(const Duration(seconds: 3), () {
                          setState(() {
                            _isLoading = false;
                          });
                          Navigator.push(context, MaterialPageRoute(builder: (_) {
                            return const OnBoardingScreen();
                          }));
                        });
                      }
                    },
                  ),
                  const SizedBox(height: 10),
                  _isLoading! ? const Center(child: CircularProgressIndicator(strokeWidth: 3)) : const SizedBox(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
