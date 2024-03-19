import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tic_tac_toe/ViewModel/on_boarding_screen_model.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final obsModel = OnBoardingScreenModel(context: context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Column(
            children: [
              Text('Welcome',
                  style: TextStyle(
                      fontSize: size.width * 0.07,
                      fontStyle: FontStyle.italic,
                      color: Colors.yellow)),
              SizedBox(
                height: size.height * 0.01,
              ),
              Text('Play With Your Friend',
                  style: TextStyle(fontSize: size.width * 0.07,
                      color: Colors.white)),
              SizedBox(
                height: size.height * 0.01,
              ),
              InkWell(
                  onTap: obsModel.onTap,
                  child: Lottie.asset('Assets/Lottie/play.json',
                      width: size.width * 0.6)),
              SizedBox(
                height: size.height * 0.01,
              ),
              ElevatedButton(
                onPressed: obsModel.onTap,
                child: Text(
                  "Play Game",
                  style: TextStyle(fontSize: size.width * 0.07),
                ),
              ),
            ],
          )),
        ],
      ),
    );
  }
}
