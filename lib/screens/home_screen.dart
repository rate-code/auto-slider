import 'package:carousel_slider/carousel_slider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_movie_app/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF23272E),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Trending Places',
              style: GoogleFonts.aBeeZee(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Divider(
              indent: 25.w,
              endIndent: 25.w,
              thickness: 4,
              height: 2.5.w,
            ),
            Divider(
              indent: 35.w,
              endIndent: 35.w,
              thickness: 4,
              height: 2.5.w,
            ),
            Divider(
              indent: 45.w,
              endIndent: 45.w,
              thickness: 4,
              height: 2.5.w,
            ),
            SizedBox(height: 10.w),
            SizedBox(
              child: CarouselSlider.builder(
                itemCount: data.length,
                options: CarouselOptions(
                  height: 300,
                  autoPlay: true,
                  viewportFraction: 0.55,
                  enlargeCenterPage: true,
                  pageSnapping: true,
                  autoPlayCurve: Curves.easeInCubic,
                  autoPlayAnimationDuration: const Duration(seconds: 1),
                ),
                itemBuilder: (context, index, _) {
                  final item = data[index];

                  return GestureDetector(
                    onTap: () {},
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        children: [
                          SizedBox(
                            height: 300,
                            width: 200,
                            child: Image.network(
                              item["posterPath"],
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  const Center(
                                child: Icon(
                                  Icons.broken_image,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 300,
                            width: 200,
                            color: Colors.black.withValues(alpha: 0.85),
                            padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  item["title"] ?? "",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.sp,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(height: 2.5.w),
                                Text(
                                  item["address"] ?? "",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
