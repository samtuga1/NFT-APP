import 'package:flutter/material.dart';
import "dart:math" show pi;
import '../widgets/nft_list.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF010101),
      body: Stack(
        children: [
          Positioned.fill(
            child: ShaderMask(
              blendMode: BlendMode.dstOut,
              shaderCallback: (rect) {
                return LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.transparent,
                      Colors.black.withOpacity(0.6),
                      Colors.black.withOpacity(0.9),
                      Colors.black,
                    ],
                    stops: const [
                      0,
                      0.63,
                      0.69,
                      0.87,
                      1,
                    ]).createShader(rect);
              },
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    NftList(
                      indexStart: 0,
                      duration: 20,
                    ),
                    NftList(
                      indexStart: 10,
                      duration: 30,
                    ),
                    NftList(
                      indexStart: 20,
                      duration: 30,
                    ),
                    NftList(
                      indexStart: 30,
                      duration: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 24,
            right: 24,
            bottom: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Arts with NFTs',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const Text(
                  'Checkout out this raffle for you guys only! new coin minted show some love',
                  style: TextStyle(
                    height: 1.2,
                    fontSize: 14.4,
                    color: Colors.white70,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  height: 55,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: const Color(0xFF3000Ff)),
                  child: const Center(
                    child: Text(
                      'Discover',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 17.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
