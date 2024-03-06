import 'package:client/design/app_colors.dart';
import 'package:client/features/chat/chat_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';

class onBoardingPage extends StatelessWidget {
  const onBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.greenBgColor,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              SizedBox(
                height: 200,
                width: 240,
                child: SvgPicture.asset(
                  'assets/openai.svg',
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Welcome to ChatGpt',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppColors.pinkBgColor),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'AI technology comes with tremendous benefits, along with serious risk of misuse. Our Charter guides every aspect of our work to ensure that we prioritize the development of safe and beneficial AI.',
                style: TextStyle(fontSize: 18, color: AppColors.pinkBgColor),
                textAlign: TextAlign.center,
              ),
              Spacer(),
              SizedBox(
                height: 52,
                child: ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.transparent),
                        elevation: MaterialStateProperty.all(0),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            side: BorderSide(
                          color: AppColors.pinkBgColor,
                        )))),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => ChatPage()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Try ChatGpt',
                          style: TextStyle(
                              fontSize: 18, color: AppColors.pinkBgColor),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.arrow_forward,
                          color: AppColors.pinkBgColor,
                        ),
                      ],
                    )),
              ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
