import 'package:flutter/material.dart';
import 'package:running_app/page/main_page.dart';
import 'package:running_app/service/location_service.dart';
import 'package:running_app/theme.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(),
      body: Column(
        children: [
          Text(
            "RUNNING APP",
            style: primaryTextStyle.copyWith(
              fontSize: 24,
              fontWeight: bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 50,
              vertical: 30,
            ),
            child: AspectRatio(
              aspectRatio: 267 / 173,
              child: Image.asset("assets/image_welcome.png"),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: secondaryColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
              ),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Let's Monitor Your Sport Activity!",
                    textAlign: TextAlign.center,
                    style: whiteTextStyle.copyWith(
                      fontSize: 20,
                      fontWeight: semibold,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 40),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(200, 50),
                        alignment: Alignment.center,
                        backgroundColor: primaryColor,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(
                              12,
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {
                        LocationService().requestPermission();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => const MainPage())),
                        );
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Let's Start",
                            style: whiteTextStyle.copyWith(
                              fontWeight: semibold,
                              fontSize: 18,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: backgroundColor,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
