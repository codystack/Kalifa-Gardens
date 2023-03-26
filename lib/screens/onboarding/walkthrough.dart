import 'package:flutter/material.dart';
import 'package:kalifa_gardens/components/custom_transition.dart';
import 'package:kalifa_gardens/components/text_component/text_components.dart';
import 'package:kalifa_gardens/model/onboarding/onboarding_model.dart';
import 'package:kalifa_gardens/screens/onboarding.dart';
import 'package:kalifa_gardens/util/constants.dart';
import 'package:kalifa_gardens/util/preference_manager.dart';

class Walkthrough extends StatefulWidget {
  final PreferenceManager manager;
  const Walkthrough({
    Key? key,
    required this.manager,
  }) : super(key: key);

  @override
  State<Walkthrough> createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough> {
  PageController _pageController = PageController(initialPage: 0);
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constants.primaryColor,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 16,
              ),
              Image.asset(
                "assets/images/app_icon.png",
                width: 48,
                height: 48,
                fit: BoxFit.contain,
              ),
              Expanded(
                child: Center(
                  child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentIndex = value;
                      });
                      _pageController.animateToPage(
                        currentIndex,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    itemCount: onboardingList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset(
                            onboardingList[index].image,
                            width: MediaQuery.of(context).size.width * 0.86,
                            height: MediaQuery.of(context).size.height * 0.34,
                            fit: BoxFit.contain,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          TextSpectral(
                            text: onboardingList[index].title,
                            fontSize: 34,
                            lineHeight: 1.1,
                            align: TextAlign.left,
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w500,
                          ),
                          const SizedBox(
                            height: 10.0,
                          ),
                          TextSpectral(
                            text: onboardingList[index].description,
                            fontSize: 15,
                            align: TextAlign.justify,
                            color: Colors.white70,
                            fontWeight: FontWeight.w400,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: currentIndex == 3
                        ? null
                        : () {
                            Navigator.of(context).push(
                              customRouteTransition(
                                Onboarding(
                                  manager: widget.manager,
                                ),
                              ),
                            );
                          },
                    child: TextSpectral(
                      text: "skip",
                      fontSize: 30,
                      color: currentIndex == 3 ? Colors.grey : Colors.white,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: onboardingList.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () => _pageController.animateToPage(
                            entry.key,
                            duration: const Duration(),
                            curve: Curves.easeIn,
                          ),
                          child: Container(
                            width: 12.0,
                            height: 12.0,
                            margin: const EdgeInsets.symmetric(
                              vertical: 8.0,
                              horizontal: 4.0,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: (Theme.of(context).brightness ==
                                          Brightness.dark
                                      ? Colors.white
                                      : Constants.accentColor)
                                  .withOpacity(
                                currentIndex == entry.key ? 0.9 : 0.4,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      if (currentIndex == 3) {
                        Navigator.of(context).push(
                          customRouteTransition(
                            Onboarding(
                              manager: widget.manager,
                            ),
                          ),
                        );
                      } else {
                        _pageController.animateToPage(
                          currentIndex + 1,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      }
                    },
                    child: TextSpectral(
                      text: "next",
                      fontSize: 30,
                      color: Colors.white,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
