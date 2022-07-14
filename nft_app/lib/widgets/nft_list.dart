import 'dart:async';
import 'dart:math' show pi;
import 'package:flutter/material.dart';
import 'package:nft_app/screens/nft_page.dart';

class NftList extends StatefulWidget {
  const NftList({Key? key, this.indexStart = 0, this.duration = 30})
      : super(key: key);
  final int indexStart;
  final int duration;
  @override
  State<NftList> createState() => _NftListState();
}

class _NftListState extends State<NftList> {
  late final _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.hasClients) {
        autoScroll();
      }
    });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      autoScroll();
    });
  }

  void autoScroll() {
    final currentScrollPosition = _scrollController.offset;
    final endScrollPosition = _scrollController.position.maxScrollExtent;
    final beginScrollPosition = _scrollController.position.minScrollExtent;
    scheduleMicrotask(() {
      if (currentScrollPosition == endScrollPosition) {
        _scrollController.animateTo(
          beginScrollPosition,
          duration: const Duration(seconds: 30),
          curve: Curves.linear,
        );
      }
      if (currentScrollPosition == beginScrollPosition) {
        _scrollController.animateTo(
          endScrollPosition,
          duration: const Duration(seconds: 30),
          curve: Curves.linear,
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.removeListener(() {
      autoScroll();
    });
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi * 1.96,
      child: SizedBox(
        height: 130,
        child: ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            itemCount: 10,
            itemBuilder: (context, index) {
              String image =
                  'assets/images/${index + 1 + widget.indexStart}.png';
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => NftPage(
                        image: image,
                      ),
                    ),
                  );
                },
                child: SizedBox(
                  child: Hero(
                    tag: image,
                    child: Image.asset(
                      image,
                      width: 130,
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
