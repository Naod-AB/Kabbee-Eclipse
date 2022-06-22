import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/routes/router.gr.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:url_launcher/url_launcher.dart';

class Data {
  var name, urlImage, url;
  Data({this.name, this.urlImage, this.url});
}

List<Data> webviewdata = [
  Data(
      name: 'HTML',
      urlImage: 'assets/icons/html.svg',
      url: 'https://www.w3schools.com/html'),
  Data(
      name: 'dart',
      urlImage: 'assets/icons/dart.svg',
      url: 'https://dart.dev/guides'),
  Data(
      name: 'flutter',
      urlImage: 'assets/icons/flutter.svg',
      url: 'https://flutter.dev'),
  Data(
      name: 'Machine',
      urlImage: 'assets/icons/Machine_logo.svg',
      url: 'https://www.simplilearn.com/tutorials/machine-learning-tutorial'),
  Data(
      name: 'computing',
      urlImage: "assets/icons/computing_icon.svg",
      url: 'https://www.w3schools.com/html'),
  Data(
      name: 'analytics',
      urlImage: "assets/icons/analytics_logo.svg",
      url: 'https://www.w3schools.com/html'),
  Data(
      name: 'javascript',
      urlImage: "assets/icons/javascript_icon.svg",
      url: 'https://www.w3schools.com/js'),
  Data(
      name: 'monogodb',
      urlImage: "assets/icons/monogodb_icon.svg",
      url: 'https://www.w3schools.com/html'),
  Data(
      name: 'atlas',
      urlImage: "assets/icons/atlas_icon.svg",
      url: 'https://www.w3schools.com/html'),
];

class Webslider extends StatefulWidget {
  const Webslider({Key? key}) : super(key: key);

  @override
  State<Webslider> createState() => _WebsliderState();
}

class _WebsliderState extends State<Webslider> {
  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    //List<Data>? data;
    //print('lenght  ${data!.length}');
    //String? urlImages;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommendation'),
        centerTitle: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'CLICK THE ICON BELOW',
              style: TextStyle(
                  fontSize: 32,
                  fontFamily: GoogleFonts.roboto().fontFamily,
                  fontWeight: FontWeight.w900,
                  color: Colors.amber),
            ),
            const SizedBox(
              height: 15,
            ),
            CarouselSlider.builder(
              itemCount: webviewdata.length,
              options: CarouselOptions(
                height: 400,
                autoPlay: true,
                enlargeCenterPage: true,
                onPageChanged: (index, reason) =>
                    setState(() => activeIndex = index),
                // autoPlayAnimationDuration: const Duration(seconds: 2)
              ),
              itemBuilder: (context, index, realIndex) {
                launchweb() async {
                  String urll = webviewdata[index].url;

                  print("launchingUrl: $urll");
                  if (await canLaunchUrl(Uri.parse(
                    urll,
                  ))) {
                    await launchUrl(Uri.parse(urll),
                        mode: LaunchMode.inAppWebView);
                    print('works');
                  } else {
                    print('nope');
                  }
                }

                return buildImage(webviewdata[index].urlImage, launchweb,
                    webviewdata[index].name);
              },
            ),
            const SizedBox(
              height: 32,
            ),
            buildIndicator()
          ],
        ),
      ),
    );
  }

  Widget buildImage(String? urlImage, launchweb, name) => InkWell(
        onTap: () => launchweb(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              name.toString().toUpperCase(),
              style: const TextStyle(
                  fontSize: 42,
                  fontWeight: FontWeight.w900,
                  color: Colors.amber),
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              width: 300,
              height: 280,
              //color: Color.fromARGB(255, 74, 78, 81),
              child: SvgPicture.asset(
                urlImage!,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      );

  Widget buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: webviewdata.length,
        effect: const WormEffect(
            dotWidth: 20,
            dotHeight: 20,
            activeDotColor: Colors.orange,
            dotColor: Colors.grey),
      );
}
