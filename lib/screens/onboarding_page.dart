import 'package:flutter/material.dart';
import 'package:skillworker/screens/auth/signup_page.dart';
import 'package:skillworker/screens/home_page.dart';
import 'package:skillworker/screens/intros/page1.dart';
import 'package:skillworker/screens/intros/page2.dart';
import 'package:skillworker/screens/intros/page3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final _controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            // padding: const EdgeInsets.only(bottom: 80),
            child: PageView(
              onPageChanged: (index) {
                setState(() {
                  isLastPage = (index == 2);
                });
              },
              controller: _controller,
              children: const [
                // page 1
                Page1(),

                // page 2
                Page2(),

                // page 3
                Page3(),
              ],
            ),
          ),

          // page controll
          Container(
            alignment: const Alignment(0, 0.85),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // SKIP
                GestureDetector(
                    onTap: () {
                      _controller.jumpToPage(2);
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    )),

                // SMOOTH INDICATOR
                SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: WormEffect(
                    spacing: 10,
                    dotColor: Colors.black87,
                    activeDotColor: Colors.blue.shade800,
                  ),
                  onDotClicked: (index) => _controller.animateToPage(index,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeIn),
                ),

                // NEXT OR PROCEED
                isLastPage
                    ? GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(builder: (context) {
                            return SignupPage();
                          }));
                        },
                        child: Text(
                          'Proceed',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeIn);
                        },
                        child: Text(
                          'Next',
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
              ],
            ),
          )
        ],
      ),

      // bottomSheet: Container(
      //   // padding: const EdgeInsets.symmetric(horizontal: 0),
      //   color: Colors.transparent,
      //   height: 50,
      //   child: Row(
      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //     children: [
      //       TextButton(
      //           onPressed: () => _controller.jumpToPage(2),
      //           child: Text('SKIP')),
      //       Center(
      //         child: SmoothPageIndicator(
      //           controller: _controller,
      //           count: 3,
      //           effect: WormEffect(
      //             spacing: 10,
      //             dotColor: Colors.black26,
      //             activeDotColor: Colors.teal.shade700,
      //           ),
      //           onDotClicked: (index) => _controller.animateToPage(index,
      //               duration: const Duration(milliseconds: 500),
      //               curve: Curves.easeIn),
      //         ),
      //       ),
      //       TextButton(
      //           onPressed: () => _controller.nextPage(
      //               duration: const Duration(milliseconds: 500),
      //               curve: Curves.easeInOut),
      //           child: Text('NEXT')),
      //     ],
      //   ),
      // ),
    );
  }
}
