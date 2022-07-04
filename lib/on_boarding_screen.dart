import 'package:beacon_flutter_mobapp/sign_in_screen.dart';
import 'package:beacon_flutter_mobapp/utils/images.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: onBoardData.length,
              onPageChanged: (index) {
                setState(() {
                  _pageIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return OnBoardContent(
                  image: onBoardData[index].image!,
                  title: onBoardData[index].title!,
                  description: onBoardData[index].description!,
                  isBackgroundImagePresent: (index == 0)||(index == 2) ? true : false,
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ...List.generate(
                onBoardData.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: DotIndicator(isActive: index == _pageIndex),
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: _pageIndex != 2
                ? Row(
                    children: [
                      skipText(),
                      const Spacer(),
                      GestureDetector(
                        child: Row(
                          children: [
                            const Text('NEXT', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                            const SizedBox(width: 5),
                            Image.asset(Images.nextArrow),
                          ],
                        ),
                        onTap: () {
                          _pageController.nextPage(
                            curve: Curves.ease,
                            duration: const Duration(microseconds: 300),
                          );
                        },
                      ),
                      /*ElevatedButton(
                        child: const Text('→'),
                        style: ElevatedButton.styleFrom(primary: Colors.black, shape: const CircleBorder()),
                        onPressed: () {
                          _pageController.nextPage(
                            curve: Curves.ease,
                            duration: const Duration(microseconds: 300),
                          );
                        },
                      ),*/
                    ],
                  )
                : ElevatedButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('PROCEED', style: TextStyle(fontSize: 17)),
                        const SizedBox(width: 10),
                        Image.asset(Images.rightArrow, color: Colors.white),
                      ],
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      minimumSize: const Size(double.infinity, 58),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (_) {
                        return const SignInScreen();
                      }));
                    },
                  ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget skipText() {
    return GestureDetector(
      child: const Text('SKIP', style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return const SignInScreen();
        }));
      },
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({Key? key, this.isActive = false}) : super(key: key);
  final bool? isActive;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 40,
      width: 18,
      decoration: BoxDecoration(
        color: isActive! ? Colors.black : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        width: 7,
        decoration: BoxDecoration(
          color: isActive! ? Colors.white : Colors.black,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class OnBoard {
  String? image;
  String? title;
  String? description;

  OnBoard(this.image, this.title, this.description);
}

List<OnBoard> onBoardData = [
  OnBoard(
    Images.onBoardImage1,
    'Intro title will be here',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
  ),
  OnBoard(
    Images.onBoardImage2,
    'Intro title will be here',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
  ),
  OnBoard(
    Images.onBoardImage3,
    'Intro title will be here',
    'Lorem Ipsum is simply dummy text of the printing and typesetting industry.',
  ),
];

class OnBoardContent extends StatelessWidget {
  const OnBoardContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    this.isBackgroundImagePresent = false,
  }) : super(key: key);

  final String image, title, description;
  final bool? isBackgroundImagePresent;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        isBackgroundImagePresent!
            ? Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(Images.boardingPolygon),
                  Image.asset(image),
                ],
              )
            : Image.asset(image),
        const Spacer(),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title, style: const TextStyle(fontSize: 23)),
              const SizedBox(height: 10),
              Text(description, style: const TextStyle(fontSize: 20)),
              const SizedBox(height: 10),
              const Divider(color: Colors.black, thickness: 5, endIndent: 280),
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
