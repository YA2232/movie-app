import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_app/common/widgets/appbar/basic_app_bar.dart';
import 'package:movie_app/common/widgets/theme_switcher/theme_switcher.dart';
import 'package:movie_app/core/config/assets/images/app_images.dart';
import 'package:movie_app/core/config/assets/vectors/app_vectors.dart';
import 'package:movie_app/core/config/theme/app_color.dart';
import 'package:movie_app/core/extensions/extensions.dart';
import 'package:movie_app/presentation/home/widgets/now_playing_movie_widget.dart';
import 'package:movie_app/presentation/home/widgets/popular_movie_widget.dart';
import 'package:movie_app/presentation/home/widgets/category_text.dart';
import 'package:movie_app/presentation/home/widgets/popular_tv_widget.dart';
import 'package:startapp_sdk/startapp.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var startAppSdk = StartAppSdk();
  StartAppBannerAd? bannerAd;

  @override
  void initState() {
    super.initState();
    // showStartAds();
  }

  @override
  void dispose() {
    // _bannerAd?.dispose();
    super.dispose();
  }

  // void showStartAds() {
  //   startAppSdk.setTestAdsEnabled(true);
  //   startAppSdk.loadBannerAd(StartAppBannerType.BANNER).then((bannerAd) {
  //     setState(() {
  //       this.bannerAd = bannerAd;
  //     });
  //   }).onError<StartAppException>((ex, stackTrace) {
  //     debugPrint("Error loading Banner ad: ${ex.message}");
  //   }).onError((error, stackTrace) {
  //     debugPrint("Error loading Banner ad: $error");
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: BasicAppbar(
        centerTitle: false,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Image.asset(
            AppImages.iconImage,
            width: 50,
          ),
        ),
        actions: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
                color: context.isDarkMode
                    ? AppColor.secondaryBackGround
                    : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(20)),
            child: IconButton(
              onPressed: () {
                context.push("/search");
              },
              icon: const Icon(Icons.search),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          ThemeSwitcher()
        ],
        hideBack: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CategoryText(text: 'Popular'),
                  const PopularMovieWidget(),
                  const SizedBox(height: 16),
                  CategoryText(text: 'Now Playing'),
                  const SizedBox(height: 16),
                  const NowPlayingMovieWedgit(),
                  const SizedBox(height: 16),
                  CategoryText(text: 'Popular Tv'),
                  const SizedBox(height: 16),
                  const PopularTvWidget(),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),
          bannerAd != null ? StartAppBanner(bannerAd!) : Container(),
        ],
      ),
    );
  }
}

BannerAd? _bannerAd;

//  if (_bannerAd != null)
//             Container(
//               width: _bannerAd!.size.width.toDouble(),
//               height: _bannerAd!.size.height.toDouble(),
//               child: AdWidget(ad: _bannerAd!),
//             ),



    // _bannerAd = BannerAd(
    //   adUnitId: 'ca-app-pub-3940256099942544/6300978111',
    //   size: AdSize.banner,
    //   request: AdRequest(),
    //   listener: BannerAdListener(
    //     onAdLoaded: (_) {
    //       setState(() {});
    //     },
    //     onAdFailedToLoad: (ad, error) {
    //       ad.dispose();
    //     },
    //   ),
    // )..load();