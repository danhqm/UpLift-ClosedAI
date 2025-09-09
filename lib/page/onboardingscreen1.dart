import 'package:flutter/material.dart';
import 'package:uplift/page/signinscreen.dart';

class Onboarding1 extends StatefulWidget {
  const Onboarding1({super.key});

  @override
  State<Onboarding1> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<Onboarding1> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Map<String, dynamic>> onboardingData = [
    {
      "title": "Personalize Your Mental Health State With AI",
      "color": const Color(0xFFBBE2EC),
      "image": "media/Onboarding1.png",
      "imageWidth": 300.0,
      "imageHeight": 340.0,
      "nextRoute": null,
    },
    {
      "title": "Personalize Your Mental Health State With AI",
      "color": const Color(0xFFE5EAD7),
      "image": "media/Onboarding2.png",
      "imageWidth": 450.0,
      "imageHeight": 450.0,
      "nextRoute": null,
    },
    {
      "title": "Personalize Your Mental Health State With AI",
      "color": const Color(0xFFFFEBC2),
      "image": "media/Onboarding3.png",
      "imageWidth": 500.0,
      "imageHeight": 500.0,
      "nextRoute": "/signin",
    },
  ];

  void _nextPage() {
    final nextRoute = onboardingData[_currentPage]['nextRoute'];

    if (_currentPage < onboardingData.length - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else if (nextRoute != null){
      Navigator.pushReplacementNamed(context, nextRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        itemCount: onboardingData.length,
        onPageChanged: (index) {
          setState(() => _currentPage = index);
        },
        itemBuilder: (context, index) {
          return Container(
            color: onboardingData[index]['color'] as Color,
            width: double.infinity,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [

                Expanded(
                  flex: 7,
                  child: Center(
                    child: OverflowBox(
                      maxWidth: double.infinity,
                      child: Image.asset(
                        onboardingData[index]['image']! as String,
                        width: onboardingData[index]['imageWidth'] as double,
                        height: onboardingData[index]['imageHeight'] as double,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),


                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      children: [
                        const SizedBox(height: 16),


                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            onboardingData.length,
                                (dotIndex) => AnimatedContainer(
                              duration:
                              const Duration(milliseconds: 250),
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 4),
                              width:
                              _currentPage == dotIndex ? 64 : 32,
                              height: 8,
                              decoration: BoxDecoration(
                                color: _currentPage == dotIndex
                                    ? const Color(0xFF3A7D44)
                                    : Colors.grey[400],
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                          ),
                        ),

                        const SizedBox(height: 24),


                        SizedBox(
                          width: 340,
                          child: RichText(
                            textAlign: TextAlign.center,
                            text: const TextSpan(
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Inter',
                              ),
                              children: [
                                TextSpan(
                                  text: "Personalize Your ",
                                  style: TextStyle(color: Color(0xFF4F3422)),
                                ),
                                TextSpan(
                                  text: "Mental Health State ",
                                  style: TextStyle(color: Color(0xFF3A7D44)),
                                ),
                                TextSpan(
                                  text: "With AI",
                                  style: TextStyle(color: Color(0xFF4F3422)),
                                ),
                              ],
                            ),
                          ),
                        ),


                        const SizedBox(height: 24),


                        Padding(
                          padding:
                          const EdgeInsets.only(bottom: 40.0),
                          child: ElevatedButton(
                            onPressed: _nextPage,
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                              const Color(0xFFDF6D14),
                              shape: const CircleBorder(),
                              padding: const EdgeInsets.all(20),
                            ),
                            child: const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                              size: 28,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
