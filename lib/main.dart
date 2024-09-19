import 'package:flutter/material.dart';
import 'package:yandex_ad_example/pages/banner_ad_page.dart';
import 'package:yandex_ad_example/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const HomePage(),
        // '/app_open': (context) => const AppOpenAdPage(),
        '/banner_sticky': (context) {
          return const BannerAdPage(
            title: 'Sticky banner ad',
          );
        },
        '/banner_inline': (context) {
          return const BannerAdPage(
            title: 'Inline banner ad',
            isInline: true,
          );
        },
        // '/interstitial': (context) => const InterstitialAdPage(),
        // '/rewarded': (context) => const RewardedAdPage(),
        // '/policies': (context) => const PoliciesPage(),
      },
    );
  }
}
