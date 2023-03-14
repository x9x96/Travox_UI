import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travox/cubit/app_cubit_states.dart';

import '../cubit/app_cubit.dart';
import '../utils/colors.dart';
import '../widgets/app_text.dart';
import '../widgets/app_button.dart';
import '../widgets/responsive_button.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, CubitStates>(builder: (context, state) {
      DetailState detail = state as DetailState;
      return Scaffold(
        body: SizedBox(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      image: DecorationImage(
                        image: NetworkImage("http://mark.bslmeiyu.com/uploads/" + detail.place.img),
                        fit: BoxFit.cover,
                      )),
                ),
              ),
              Positioned(
                  left: 20,
                  top: 20,
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          BlocProvider.of<AppCubits>(context).goHome();
                        },
                        icon: const Icon(Icons.menu),
                      ),
                    ],
                  )),
              Positioned(
                  top: 240,
                  child: Container(
                    padding: const EdgeInsets.only(left: 20, right: 22, top: 20),
                    width: MediaQuery.of(context).size.width,
                    height: 500,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(46),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            BoldLargeText(
                              text: detail.place.name,
                              color: Colors.black54,
                            ),
                            BoldLargeText(
                              text: "\$${detail.place.price}",
                              color: AppColors.mainColor,
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on,
                              color: AppColors.mainColor,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: PrimaryText(
                                text: detail.place.location,
                                color: AppColors.textColor1,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Row(
                          children: [
                            Wrap(
                              children: List.generate(5, (index) {
                                return Icon(Icons.star,
                                    color: detail.place.stars > index
                                        ? AppColors.starColor
                                        : AppColors.textColor2);
                              }),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 7),
                              child: PrimaryText(
                                text: "(${detail.place.stars})",
                                color: AppColors.textColor2,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        BoldLargeText(
                          text: "People",
                          color: Colors.black.withOpacity(0.7),
                          size: 18,
                        ),
                        const SizedBox(height: 5),
                        PrimaryText(
                          text: "Number of people in your town are: ${detail.place.people}",
                          color: AppColors.mainTextColor,
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          children: List.generate(5, (index) {
                            return InkWell(
                              onTap: () {
                                setState(() {
                                  selectedIndex = index;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10),
                                child: AppButton(
                                  size: 50,
                                  icon_text_Color: selectedIndex == index
                                      ? Colors.white
                                      : Colors.black,
                                  backgroundColor: selectedIndex == index
                                      ? Colors.black
                                      : AppColors.buttonBackground,
                                  borderColor: AppColors.buttonBackground,
                                  text: (index + 1).toString(),
                                ),
                              ),
                            );
                          }),
                        ),
                        const SizedBox(height: 20),
                        BoldLargeText(
                          text: "Description",
                          color: Colors.black.withOpacity(0.7),
                          size: 18,
                        ),
                        const SizedBox(height: 5),
                        PrimaryText(
                          text: detail.place.description,
                          color: AppColors.mainTextColor,
                        ),
                      ],
                    ),
                  )),
              Positioned(
                  left: 20,
                  bottom: 10,
                  right: 20,
                  child: Row(
                    children: [
                      AppButton(
                        size: 50,
                        icon_text_Color: AppColors.textColor1,
                        backgroundColor: Colors.white,
                        borderColor: AppColors.textColor1,
                        isIcon: true,
                        icon: Icons.favorite_border,
                      ),
                      const SizedBox(width: 16),
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<AppCubits>(context).goHome();
                        },
                        child: ResponsiveButton(
                          isResponsive: true,
                          text: "Go Back Home",

                        ),
                      ),
                    ],
                  ))
            ],
          ),
        ),
      );
    });
  }
}
