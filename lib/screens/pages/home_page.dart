import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travox/cubit/app_cubit.dart';
import 'package:travox/utils/colors.dart';
import 'package:travox/widgets/app_text.dart';

import '../../cubit/app_cubit_states.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var images = {
    "balloning.png" : "balloning",
    "kayaking.png" : "kayaking",
    "hiking.png" : "hiking",
    "snorkling.png" : "snorkling",
  };

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<AppCubits, CubitStates> (
        builder: (context, state) {
          if(state is LoadedState) {
            var info = state.places;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //menu
                Padding(
                  padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Icon(
                        Icons.menu,
                        color: Colors.black,
                        size: 30,
                      ),
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.withOpacity(0.3),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                    height: 25
                ),
                //Discover text
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: BoldLargeText(text: "Discover"),
                ),
                const SizedBox(
                    height: 16
                ),
                //tab bar
                TabBar(
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  isScrollable: true,
                  labelPadding: const EdgeInsets.only(left: 20, right: 16),
                  indicatorSize: TabBarIndicatorSize.label,
                  indicator: CircleTabBarIndicator(
                    color: AppColors.mainColor,
                    radius: 4,
                  ),
                  tabs: [
                    Tab(
                      text: "Places",
                    ),
                    Tab(
                      text: "Inspration",
                    ),
                    Tab(
                      text: "Emotions",
                    ),
                  ],
                ),
                //tab bar
                Container(
                  padding: const EdgeInsets.only(
                    left: 20,
                  ),
                  height: 250,
                  width: double.maxFinite,
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      ListView.builder(
                        itemCount: info.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              BlocProvider.of<AppCubits>(context).detailPage(info[index]);
                            },
                            child: Container(
                              height: 300,
                              width: 180,
                              margin: const EdgeInsets.only(
                                top: 10,
                                right: 15,
                              ),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage("http://mark.bslmeiyu.com/uploads/" + info[index].img),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          );
                        },
                      ),
                      Tab(
                        text: "Emotions",
                      ),
                      Tab(
                        text: "Inspration",
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                    height: 25
                ),
                //Explore more text
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BoldLargeText(
                        text: "Explore more",
                        size: 18,
                      ),
                      PrimaryText(
                        text: "see all",
                        color: AppColors.textColor1,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                    height: 25
                ),
                //SmallBoxes listview
                Container(
                  height: 120,
                  width: double.maxFinite,
                  padding: const EdgeInsets.only(left: 20),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: images.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 25),
                          child: Column(
                            children: [
                              Container(
                                height: 80,
                                width: 80,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: AssetImage("img/" + images.keys.elementAt(index),),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 7),
                              PrimaryText(text: images.values.elementAt(index), color: AppColors.textColor2,)
                            ],
                          ),
                        );
                      }),
                ),
              ],
            );
          } else {
            return LinearProgressIndicator();
          }
        },
      )
    );
  }
}

class CircleTabBarIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabBarIndicator({
    required this.color,
    required this.radius,
  });

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({
    required this.color,
    required this.radius,
  });

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    final Offset circleOffset = Offset(
        configuration.size!.width / 2 + radius / 2,
        configuration.size!.height - 3);

    canvas.drawCircle(offset + circleOffset, radius, _paint);
  }
}

/*Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //menu
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Icon(
                  Icons.menu,
                  color: Colors.black,
                  size: 30,
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey.withOpacity(0.3),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25
          ),
          //Discover text
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: BoldLargeText(text: "Discover"),
          ),
          const SizedBox(
            height: 16
          ),
          //tab bar
          TabBar(
            controller: _tabController,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            isScrollable: true,
            labelPadding: const EdgeInsets.only(left: 20, right: 16),
            indicatorSize: TabBarIndicatorSize.label,
            indicator: CircleTabBarIndicator(
              color: AppColors.mainColor,
              radius: 4,
            ),
            tabs: [
              Tab(
                text: "Places",
              ),
              Tab(
                text: "Inspration",
              ),
              Tab(
                text: "Emotions",
              ),
            ],
          ),
          //tab bar
          Container(
            padding: const EdgeInsets.only(
              left: 20,
            ),
            height: 250,
            width: double.maxFinite,
            child: TabBarView(
              controller: _tabController,
              children: [
                ListView.builder(
                  itemCount: 3,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 300,
                      width: 180,
                      margin: const EdgeInsets.only(
                        top: 10,
                        right: 15,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          image: const DecorationImage(
                            image: AssetImage("img/mountain.jpeg"),
                            fit: BoxFit.cover,
                          )),
                    );
                  },
                ),
                Tab(
                  text: "Emotions",
                ),
                Tab(
                  text: "Inspration",
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25
          ),
          //Explore more text
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                BoldLargeText(
                  text: "Explore more",
                  size: 18,
                ),
                PrimaryText(
                  text: "see all",
                  color: AppColors.textColor1,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 25
          ),
          //SmallBoxes listview
          Container(
            height: 120,
            width: double.maxFinite,
            padding: const EdgeInsets.only(left: 20),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.only(right: 25),
                    child: Column(
                      children: [
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: AssetImage("img/" + images.keys.elementAt(index),),
                                fit: BoxFit.cover,
                              ),
                          ),
                        ),
                        const SizedBox(height: 7),
                        PrimaryText(text: images.values.elementAt(index), color: AppColors.textColor2,)
                      ],
                    ),
                  );
                }),
          ),
        ],
      ), */