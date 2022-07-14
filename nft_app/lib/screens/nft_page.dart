import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:nft_app/screens/nft_detail_page.dart';

import '../widgets/fade_in_animation.dart';

class NftPage extends StatefulWidget {
  NftPage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;

  @override
  State<NftPage> createState() => _NftPageState();
}

class _NftPageState extends State<NftPage> {
  double textOpacity = 1;

  double blurOpacity = 1;

  double buttonOpacity = 1;

  int duration = 1000;
  double buttonWidth = 8;
  double buttonHeight = 20;

  Future<void> animateBlurToZero() async {
    setState(() {
      blurOpacity = 0;
    });
  }

  Future<void> animateTextToZero() async {
    setState(() {
      textOpacity = 0;
    });
  }

  Future<void> animateButtonToZero() async {
    setState(() {
      buttonOpacity = 0;
      buttonWidth = 140;
      buttonHeight = 0;
    });
  }

  void placeBid() {
    animateBlurToZero().then(
      (_) {
        Timer(
          Duration(milliseconds: duration),
          () => animateTextToZero().then(
            (_) {
              Timer(
                Duration(milliseconds: duration),
                () => animateButtonToZero()
                    .then(
                      (_) => {
                        Timer(
                          const Duration(milliseconds: 1),
                          () {
                            setState(() {
                              blurOpacity = 1;
                              buttonOpacity = 1;
                              textOpacity = 1;
                              buttonWidth = 8;
                              buttonHeight = 20;
                            });
                          },
                        ),
                      },
                    )
                    .then((_) => {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) {
                                return NftDetailPage(image: widget.image);
                              },
                            ),
                          )
                        }),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(
          children: [
            SizedBox(
              width: double.infinity,
              height: 375,
              child: Hero(
                tag: widget.image,
                child: Image.asset(widget.image),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: FadeAnimation(
                  intervalStart: 0.1,
                  child: AnimatedOpacity(
                    duration: Duration(milliseconds: duration),
                    opacity: blurOpacity,
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 10,
                        sigmaY: 10,
                      ),
                      child: Container(
                        height: 50,
                        width: 150,
                        alignment: Alignment.center,
                        child: const Text(
                          'Digital NFT Art',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15.5,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: AnimatedOpacity(
            duration: Duration(milliseconds: duration),
            opacity: textOpacity,
            child: const FadeAnimation(
              intervalStart: 0.3,
              child: Text(
                'Monkey #271',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: AnimatedOpacity(
            opacity: textOpacity,
            duration: Duration(milliseconds: duration),
            child: const FadeAnimation(
              intervalStart: 0.35,
              child: Text(
                'Owned by Samuel',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14.5,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: AnimatedOpacity(
            opacity: textOpacity,
            duration: Duration(milliseconds: duration),
            child: FadeAnimation(
              intervalStart: 0.4,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  InfoTile(title: '3d 5h 23m', subtitle: 'Remaining Time'),
                  InfoTile(title: '16.7 ETH', subtitle: 'Highest Bid'),
                ],
              ),
            ),
          ),
        ),
        const Spacer(),
        GestureDetector(
          onTap: () {
            placeBid();
          },
          child: AnimatedOpacity(
            opacity: buttonOpacity,
            duration: Duration(milliseconds: duration),
            child: FadeAnimation(
              intervalStart: 0.6,
              child: AnimatedPadding(
                duration: const Duration(milliseconds: 800),
                padding: EdgeInsets.symmetric(horizontal: buttonWidth),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff30000ff),
                  ),
                  child: FadeAnimation(
                    intervalStart: 0.8,
                    child: AnimatedPadding(
                      duration: const Duration(milliseconds: 800),
                      padding: EdgeInsets.symmetric(vertical: buttonHeight),
                      child: const Text(
                        'Place Bid',
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
            ),
          ),
        ),
      ]),
    );
  }
}

class InfoTile extends StatelessWidget {
  const InfoTile({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          subtitle,
          style: const TextStyle(
            color: Colors.white70,
          ),
        ),
      ],
    );
  }
}
