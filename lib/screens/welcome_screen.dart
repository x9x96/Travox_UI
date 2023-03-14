import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travox/cubit/app_cubit.dart';

import 'package:travox/utils/colors.dart';
import 'package:travox/widgets/app_text.dart';
import 'package:travox/widgets/responsive_button.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = [
    "img1.png",
    "img2.png",
    "img3.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: images.length,
          itemBuilder: (context, index) {
            return Container(
              width: double.maxFinite,
              height: double.maxFinite,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "img/" + images[index],
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(
                  top: 140,
                  left: 20,
                  right: 20,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        BoldLargeText(text: 'Trips'),
                        PrimaryText(
                          text: 'Mountain',
                          size: 30,
                        ),
                        const SizedBox(height: 18),
                        SizedBox(
                          width: 250,
                          child: PrimaryText(
                            text:
                                "Explore the incredible view of the badariya valley mountains in birnin kebbi",
                            color: AppColors.textColor2,
                          ),
                        ),
                        const SizedBox(height: 40),
                        GestureDetector(
                          onTap: () {
                            BlocProvider.of<AppCubits>(context).getData();
                          },
                            child: ResponsiveButton()),
                      ],
                    ),
                    Column(
                      children: List.generate(
                          images.length,
                          (dotsIndex) => Container(
                                margin: const EdgeInsets.only(bottom: 2),
                                width: 8,
                                height: index == dotsIndex ? 25 : 11,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: index == dotsIndex
                                      ? AppColors.mainColor
                                      : AppColors.mainColor.withOpacity(0.3),
                                ),
                              )),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }
}
