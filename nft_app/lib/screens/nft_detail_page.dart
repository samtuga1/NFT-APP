import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:glass_kit/glass_kit.dart';
import 'package:nft_app/screens/confirmed_screen.dart';
import 'package:nft_app/screens/nft_page.dart';
import 'package:nft_app/widgets/fade_in_animation.dart';

import '../widgets/reveal_route.dart';

class NftDetailPage extends StatelessWidget {
  const NftDetailPage({Key? key, required this.image}) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              width: double.infinity,
              child: Hero(
                tag: image,
                child: Image.asset(
                  image,
                  width: 200,
                  height: 200,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            FadeAnimation(
              intervalStart: 0.4,
              child: GlassContainer.clearGlass(
                borderWidth: 0.4,
                borderRadius: BorderRadius.circular(10),
                height: 120,
                width: double.infinity,
                child: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  height: 120,
                  child: Column(children: [
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Samuel',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 16.5,
                              ),
                            ),
                            Text(
                              'Offered to you',
                              style: TextStyle(
                                height: 1.5,
                                color: Colors.white70,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            image,
                            height: 50,
                            width: 50,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Row(
                      children: const [
                        Text(
                          'Amount',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 14,
                          ),
                        ),
                        Spacer(),
                        Text(
                          '8.34ETH',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 16.5,
                          ),
                        ),
                      ],
                    )
                  ]),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const FadeAnimation(
              intervalStart: 0.5,
              child: _InfoTile(
                title: 'Flat Amount',
                subtitle: '3,235,345 USD',
              ),
            ),
            const FadeAnimation(
              intervalStart: 0.6,
              child: _InfoTile(
                title: 'Order Number',
                subtitle: 'scduwwiu87eyce7',
              ),
            ),
            const FadeAnimation(
              intervalStart: 0.7,
              child: _InfoTile(
                title: 'Network',
                subtitle: 'Balance Smart Chain',
              ),
            ),
            const Spacer(),
            Row(
              children: [
                const SizedBox(
                  width: 10,
                ),
                Row(
                  children: const [
                    Icon(
                      CupertinoIcons.folder_open,
                      color: Colors.white,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Icon(
                      CupertinoIcons.money_dollar_circle,
                      color: Colors.white,
                    ),
                  ],
                ),
                const Spacer(),
                FloatingActionButton(
                  backgroundColor: const Color(
                    0xff30000ff,
                  ),
                  elevation: 8,
                  onPressed: () {
                    Navigator.push(
                      context,
                      RevealRoute(
                        page: const ConfirmedScreen(),
                        maxRadius: 800,
                        centerAlignment: Alignment.bottomRight,
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios_outlined,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
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
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white70,
        ),
      ),
      trailing: Text(
        subtitle,
        style: const TextStyle(
          fontSize: 17,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }
}
