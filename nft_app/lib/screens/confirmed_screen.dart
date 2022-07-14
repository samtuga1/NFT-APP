import 'package:flutter/material.dart';
import 'package:nft_app/screens/landing_page.dart';

import '../widgets/fade_in_animation.dart';

class ConfirmedScreen extends StatelessWidget {
  const ConfirmedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(
        0xff30000ff,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(
            height: 155,
          ),
          const FadeAnimation(
            intervalStart: 0.2,
            child: Text(
              'Great!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 33,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const FadeAnimation(
            intervalStart: 0.3,
            child: Text(
              'We have sent you an email',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 17,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const FadeAnimation(
            intervalStart: 0.5,
            child: Text(
              'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
              style: TextStyle(
                color: Colors.white,
                fontSize: 15,
              ),
            ),
          ),
          const SizedBox(
            height: 160,
          ),
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LandingPage(),
                ),
              );
            },
            child: FadeAnimation(
              intervalStart: 0.6,
              child: Container(
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black87,
                ),
                child: const FadeAnimation(
                  intervalStart: 0.8,
                  child: Text(
                    'Back to home',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
