import 'package:currency_convertor/home_page.dart';
import 'package:flutter/material.dart';
import 'package:intro_slider/dot_animation_enum.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';

class OnBoardingScreen extends StatefulWidget {
  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  List<Slide> slides = [];
  Function goToTab;

  @override
  void initState() {
    super.initState();
    slides.add(
      Slide(
        title: "Currency Convertor",
        styleTitle: TextStyle(
          color: Colors.pink,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontFamily: 'Hello_Pirates',
        ),
        description:
            "Currency convertor is software application that provides the easy conversion of currency values based on present-day exchange rates. It can quickly convert the value of one currency to another.",
        styleDescription: TextStyle(
          color: Colors.indigo.shade400,
          fontSize: 20,
          fontFamily: 'Gready',
        ),
        pathImage: 'assets/boarding1.png',
      ),
    );
    slides.add(
      Slide(
        title: "Currency Convertor",
        styleTitle: TextStyle(
          color: Colors.blueAccent,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontFamily: 'Hello_Pirates',
        ),
        description:
            "Currency convertor typically use the most recent market prices in the foreign exchange market. Currency convertor are useful to tourists, multi-national businesses, and forex traders.",
        styleDescription: TextStyle(
          color: Colors.red.shade300,
          fontSize: 20,
          fontFamily: 'StruckBase',
        ),
        pathImage: 'assets/onboarding2.gif',
      ),
    );
    slides.add(
      Slide(
        title: 'Currency Convertor',
        styleTitle: TextStyle(
          color: Colors.green,
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontFamily: 'Hello_Pirates',
        ),
        description:
            " The convertor is simple to use - traders select the current currency, the destined currency and the amount to be converted. Calculations are performed using live market rates. More over its FREE",
        styleDescription: TextStyle(
          color: Colors.purple.shade300,
          fontSize: 20,
          fontFamily: 'Hello_Giraffe',
        ),
        pathImage: 'assets/onboarding3.png',
      ),
    );
  }

  Widget renderNextButton() {
    return Icon(
      Icons.navigate_next_rounded,
      color: Colors.teal,
      size: 35,
    );
  }

  Widget renderDoneButton() {
    return Icon(
      Icons.done,
      color: Colors.amber,
    );
  }

  Widget renderSkipButton() {
    return Icon(
      Icons.skip_next_rounded,
      color: Colors.teal,
    );
  }

  ButtonStyle skipButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(
        StadiumBorder(),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(
        Colors.white,
      ),
      overlayColor: MaterialStateProperty.all<Color>(
        Colors.amber,
      ),
    );
  }

  ButtonStyle nextButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(
        StadiumBorder(),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(
        Colors.white,
      ),
      overlayColor: MaterialStateProperty.all<Color>(
        Colors.amber,
      ),
    );
  }

  ButtonStyle doneButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(
        StadiumBorder(),
      ),
      backgroundColor: MaterialStateProperty.all<Color>(
        Colors.white,
      ),
      overlayColor: MaterialStateProperty.all<Color>(
        Colors.amber,
      ),
    );
  }

  void onCompleteButton() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return HomePage();
        },
      ),
    );
  }

  List<Widget> renderListTabs() {
    List<Widget> tabs = [];
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Container(
              margin: EdgeInsets.only(
                bottom: 60,
                top: 60,
              ),
              child: ListView(
                children: [
                  GestureDetector(
                    child: Image.asset(
                      currentSlide.pathImage,
                      width: 200,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    child: Text(
                      currentSlide.title,
                      style: currentSlide.styleTitle,
                      textAlign: TextAlign.center,
                    ),
                    margin: EdgeInsets.only(
                      top: 20,
                    ),
                  ),
                  Container(
                    child: Text(
                      currentSlide.description,
                      style: currentSlide.styleDescription,
                      textAlign: TextAlign.center,
                      maxLines: 10,
                      overflow: TextOverflow.ellipsis,
                    ),
                    margin: EdgeInsets.only(
                      top: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
    return tabs;
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      renderSkipBtn: renderSkipButton(),
      skipButtonStyle: skipButtonStyle(),
      renderNextBtn: renderNextButton(),
      nextButtonStyle: nextButtonStyle(),
      renderDoneBtn: renderDoneButton(),
      doneButtonStyle: doneButtonStyle(),
      onDonePress: onCompleteButton,
      colorActiveDot: Colors.blue,
      colorDot: Colors.green,
      sizeDot: 14,
      typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,
      listCustomTabs: renderListTabs(),
      backgroundColorAllSlides: Colors.white,
      refFuncGoToTab: (refFun) {
        this.goToTab = refFun;
      },
      scrollPhysics: BouncingScrollPhysics(),
      hideStatusBar: true,
    );
  }
}
