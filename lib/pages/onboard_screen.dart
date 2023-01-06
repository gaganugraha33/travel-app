import 'package:flutter/material.dart';
import 'package:travel_app/model/onboard_model.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  _OnboardScreenState createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  int pageView = 0;
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          onPageChanged: (value) {
            setState(() {
              pageView = value;
            });
          },
          controller: pageController,
          children: List.generate(
              onboardList.length,
              (index) => Stack(
                    children: [
                      Image.asset(
                        'assets/images/${onboardList[index].image}',
                        height: MediaQuery.of(context).size.height,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            onboardList.length - 1 != index
                                ? Container(
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 7,
                                      horizontal: 15,
                                    ),
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        width: 1.5,
                                        color: Colors.white,
                                      ),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: const Text(
                                      'Skip',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  )
                                : Container(),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Explore indonesia with us.',
                                  style: TextStyle(
                                    fontSize: 72,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'We Traveling are ready to help you on\n vacation around Indonesia',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                    height: 1.5,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
        ),
        extendBody: true,
        bottomNavigationBar: SizedBox(
          height: 190,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                    onboardList.length,
                    (index) => GestureDetector(
                          onTap: () {
                            if (pageController.hasClients) {
                              pageController.animateToPage(index,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut);
                            }
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 500),
                            height: 5,
                            width: 20,
                            margin: const EdgeInsets.only(right: 5),
                            decoration: BoxDecoration(
                              color: pageView == index
                                  ? Colors.white
                                  : Colors.white.withOpacity(0.4),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        )),
              ),
              const SizedBox(
                height: 15,
              ),
              ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(30)),
                child: Container(
                  height: 170,
                  color: Colors.white,
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 5),
                  child: Column(
                    children: [
                      Container(
                        height: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.black,
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                'Let\'s Get Started',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Icon(
                                Icons.arrow_forward,
                                color: Colors.white,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text.rich(TextSpan(children: [
                        TextSpan(
                            text: 'already have account? ',
                            style: TextStyle(
                                color: Colors.black.withOpacity(0.6),
                                fontSize: 12)),
                        const TextSpan(
                            text: 'Login',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.blue,
                              fontWeight: FontWeight.w600,
                            )),
                      ])),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        height: 5,
                        width: MediaQuery.of(context).size.width * 0.4,
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(18),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
