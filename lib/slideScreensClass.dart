import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/scrollbar_behavior_enum.dart';
import 'webViewClass.dart';

bool seen = false;

class SlideScreens extends StatefulWidget {
  const SlideScreens({Key? key}) : super(key: key);

  @override
  _SlideScreensState createState() => new _SlideScreensState();
}

class _SlideScreensState extends State<SlideScreens> {
  List<Slide> slides = [];
  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "Acheter",
        styleTitle: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Avec REBORN YOUR SHOES vous disposez d'un large choix de chaussures à acheter.",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontStyle: FontStyle.normal,
            fontFamily: 'RobotoMono'),
        centerWidget: Image.asset('images/buy.png'),
        backgroundImage: "rebornyourshoes",
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,
      ),
    );
    slides.add(
      new Slide(
        title: "Vendre",
        styleTitle: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "Avec REBORN YOUR SHOES vous pouvez vendre vos chaussures.",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontStyle: FontStyle.normal,
            fontFamily: 'RobotoMono'),
        centerWidget: Image.asset('images/sell.png'),
        backgroundImage: "rebornyourshoes",
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,
      ),
    );
    slides.add(
      new Slide(
        title: "Sécurité",
        styleTitle: TextStyle(
            color: Colors.black,
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
            "l'utilisation de reborn your shoes est sécurisée à la fois pour l'acheteur et le vendeur.",
        styleDescription: TextStyle(
            color: Colors.black,
            fontSize: 20.0,
            fontStyle: FontStyle.normal,
            fontFamily: 'RobotoMono'),
        centerWidget: Image.asset('images/safe.png'),
        backgroundImage: "rebornyourshoes",
        directionColorBegin: Alignment.topCenter,
        directionColorEnd: Alignment.bottomCenter,
        maxLineTextDescription: 3,
      ),
    );
  }

  void onDonePress() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => MainPage()),
      (Route<dynamic> route) => false,
    );
  }

  Widget renderNextBtn() {
    return Icon(
      Icons.navigate_next,
      color: Color(0xffF3B4BA),
      size: 35.0,
    );
  }

  Widget renderDoneBtn() {
    return Icon(
      Icons.done,
      color: Colors.white,
    );
  }

  Widget renderSkipBtn() {
    return Icon(
      Icons.skip_next,
      color: Color(0xffF3B4BA),
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
      backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
      overlayColor: MaterialStateProperty.all<Color>(Colors.black),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      skipButtonStyle: myButtonStyle(),
      showSkipBtn: false,

      // Next button
      renderNextBtn: this.renderNextBtn(),
      nextButtonStyle: myButtonStyle(),
      showNextBtn: false,

      // Done button
      renderDoneBtn: this.renderDoneBtn(),
      onDonePress: this.onDonePress,
      doneButtonStyle: myButtonStyle(),

      // Dot indicator
      colorDot: Colors.black38,
      colorActiveDot: Colors.black,
      sizeDot: 13.0,

      // Show or hide status bar
      hideStatusBar: true,
      backgroundColorAllSlides: Colors.white,

      // Scrollbar
      verticalScrollbarBehavior: scrollbarBehavior.SHOW_ALWAYS,
    );
  }
}
