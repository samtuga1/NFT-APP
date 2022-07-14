import 'dart:ui';
import 'package:flutter/material.dart';

import '../widgets/fade_in_animation.dart';

class NftPage extends StatelessWidget {
  const NftPage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Stack(
          children: [
            Hero(
              tag: image,
              child: SizedBox(
                width: double.infinity,
                height: 375,
                child: Image.asset(image),
              ),
            ),
            Positioned(
              bottom: 10,
              left: 10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: FadeAnimation(
                  intervalStart: 0.1,
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
          ],
        ),
        const SizedBox(height: 30),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: FadeAnimation(
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
        const SizedBox(height: 5),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: FadeAnimation(
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
        const SizedBox(height: 50),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: FadeAnimation(
            intervalStart: 0.4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const <Widget>[
                _InfoTile(title: '3d 5h 23m', subtitle: 'Remaining Time'),
                _InfoTile(title: '16.7 ETH', subtitle: 'Highest Bid'),
              ],
            ),
          ),
        ),
        const Spacer(),
        FadeAnimation(
          intervalStart: 0.6,
          child: Container(
            width: double.infinity,
            height: 50,
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xff3000ff),
            ),
            child: const FadeAnimation(
              intervalStart: 0.8,
              child: Text(
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
        const SizedBox(height: 50),
      ]),
    );
  }
}

class _InfoTile extends StatelessWidget {
  const _InfoTile({Key? key, required this.title, required this.subtitle})
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
