import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const pages = [
      (
        '/banner_sticky',
        CupertinoIcons.suit_diamond_fill,
        'Sticky',
      ),
      (
        '/banner_inline',
        CupertinoIcons.square_fill,
        'Inline',
      ),
    ];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Yandex mobile ad'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                children: List.generate(
                  pages.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(8),
                    child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.all(4),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      onPressed: () {
                        Navigator.pushNamed(context, pages[index].$1);
                      },
                      child: Column(
                        children: [
                          Icon(pages[index].$2),
                          Text(pages[index].$3),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
