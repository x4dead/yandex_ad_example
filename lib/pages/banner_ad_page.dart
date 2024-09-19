import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yandex_mobileads/mobile_ads.dart';

class BannerAdPage extends StatefulWidget {
  const BannerAdPage({super.key, this.isInline = false, required this.title});
  final bool isInline;
  final String title;
  @override
  State<BannerAdPage> createState() => _BannerAdPageState();
}

class _BannerAdPageState extends State<BannerAdPage> {
  @override
  void initState() {
    super.initState();
    MobileAds.initialize();
  }

  late BannerAd banner;
  bool isBannerLoaded = false;
  _loadAd() {
    banner = _createBanner();
    setState(() {
      isBannerLoaded = true;
    });

    banner.loadAd(adRequest: const AdRequest());
  }

  BannerAdSize getBannerSize() {
    final width = MediaQuery.of(context).size.width.round();
    if (widget.isInline) {
      return BannerAdSize.inline(width: width, maxHeight: 300);
    }
    return BannerAdSize.sticky(width: width);
  }

  _createBanner() {
    return BannerAd(
      adRequest: const AdRequest(),
      adUnitId: 'demo-banner-yandex',
      adSize: getBannerSize(),
      onAdLoaded: () {
        if (!mounted) {
          banner.destroy();
          return;
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      floatingActionButton: isBannerLoaded
          ? null
          : FloatingActionButton(
              onPressed: _loadAd,
              child: const Icon(CupertinoIcons.arrow_down_to_line),
            ),
      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),
            if (isBannerLoaded)
              AdWidget(
                bannerAd: banner,
              ),
          ],
        ),
      ),
    );
  }
}
