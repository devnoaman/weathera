import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:weathera/controllers/weather.dart';
import 'package:weathera/screens/setting.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> items = ["1", "2", "3", "4", "5", "6", "7", "8"];

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    items.add((items.length + 1).toString());
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    Weather c = Get.find<Weather>();
    // WeatherModel model = WeatherModel.fromJson(c.myData);

    return RefreshConfiguration(
      headerTriggerDistance: 80.0, // header trigger refresh trigger distance
      springDescription: SpringDescription(
          stiffness: 170,
          damping: 16,
          mass:
              1.9), // custom spring back animate,the props meaning see the flutter api
      maxOverScrollExtent:
          100, //The maximum dragging range of the head. Set this property if a rush out of the view area occurs
      maxUnderScrollExtent: 0, // Maximum dragging range at the bottom
      enableScrollWhenRefreshCompleted:
          true, //This property is incompatible with PageView and TabBarView. If you need TabBarView to slide left and right, you need to set it to true.
      enableLoadingWhenFailed:
          true, //In the case of load failure, users can still trigger more loads by gesture pull-up.
      hideFooterWhenNotFull:
          false, // Disable pull-up to load more functionality when Viewport is less than one screen
      enableBallisticLoad: true, // trigger load more by BallisticScrollActivity

      headerBuilder: () => WaterDropHeader(),
      child: Scaffold(
        // appBar: AppBar(),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            // color: Colors.amber,
            gradient: (c.model.current.isDay == 1)
                ? c.getGrideantBG()
                : LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: const [0.1, 0.9],
                    colors: [
                      Color(0xff053D75),
                      Color(0xFF00027C),
                    ],
                  ),
          ),
          child: SafeArea(
            child: Stack(
              children: [
                Opacity(
                  opacity: 0.3,
                  child: Center(
                    child: Transform.scale(
                      scale: 8.2,
                      child: Image.network(
                          'https:' + c.model.current.condition.icon),
                    ),
                    // child: SvgPicture.asset(
                    //   c.imagePath,
                    //   width: 800,
                    //   height: 800,
                    //   color: Colors.black,
                    //   fit: BoxFit.cover,
                    // ),
                  ),
                ),
                ListView(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: const Text(
                              'Weather App',
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 60,
                                color: const Color(0xffffffff),
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          Text(
                            c.model.location.name,
                            style: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 40,
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.center,
                          ), // Adobe XD layer: 'Icon weather-day-su…' (shape)
                          Padding(
                            padding: const EdgeInsets.all(35.0),
                            child: Row(
                              children: [
                                Transform.scale(
                                  scale: 2.2,
                                  child: Image.network('https:' +
                                      c.model.current.condition.icon),
                                ),
                                // SvgPicture.asset(
                                //   c.imagePath,
                                //   allowDrawingOutsideViewBox: true,
                                //   fit: BoxFit.fill,
                                // ),
                                // Image.network(
                                //   c.model.current.condition.icon,
                                //   fit: BoxFit.fill,
                                // ),
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 65,
                                color: const Color(0xffffffff),
                              ),
                              children: [
                                TextSpan(
                                  text: c.model.current.tempC.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                TextSpan(
                                  text: '֯֯֯֯֯֯֯֯֯֯֯֯C',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.center,
                          ),
                          Text.rich(
                            TextSpan(
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                color: const Color(0xffffffff),
                              ),
                              children: [
                                TextSpan(
                                  text: c.model.current.tempF.toString(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: '֯֯֯֯֯֯֯֯֯֯֯֯ F',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                            textHeightBehavior: TextHeightBehavior(
                                applyHeightToFirstAscent: false),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            c.model.current.condition.text,
                            style: const TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 15,
                              color: Color(0xffffffff),
                              fontWeight: FontWeight.w300,
                            ),
                            textAlign: TextAlign.center,
                          ),

                          SizedBox(
                            height: 30,
                          ),
                          // Text(
                          //   DateFormat('EEEEE', 'en_US')
                          //       .format(DateTime.parse(c.model.location.localtime))
                          //       .split(',')
                          //       .single,
                          //   style: const TextStyle(
                          //     fontFamily: 'Montserrat',
                          //     fontSize: 15,
                          //     color: Color(0xffffffff),
                          //     fontWeight: FontWeight.w300,
                          //   ),
                          //   textAlign: TextAlign.center,
                          // ),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 120,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true,
                                itemCount:
                                    c.model.forecast.forecastday[0].hour.length,
                                itemBuilder: (context, index) {
                                  var data = c.model.forecast.forecastday[0]
                                      .hour[index];
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return Padding(
                                        padding: EdgeInsets.only(
                                            left: (index == 0) ? 32.0 : 0.0),
                                        child: Container(
                                            width: 100,
                                            // width:
                                            //     MedilkjaQuery.of(context).size.width * 0.5,
                                            margin: EdgeInsets.symmetric(
                                              horizontal: 5.0,
                                            ),
                                            decoration: BoxDecoration(
                                                color: Color(0xFFC2ADAD),
                                                borderRadius:
                                                    BorderRadius.circular(15)),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    DateFormat('hh:mm', 'en_US')
                                                        .format(DateTime.parse(
                                                            data.time))
                                                        .split(',')
                                                        .single,
                                                    style: const TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      fontSize: 15,
                                                      color: Color(0xffffffff),
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                                    textAlign: TextAlign.center,

                                                    // style: TextStyle(fontSize: 16.0),
                                                  ),
                                                  Transform.scale(
                                                    scale: 1,
                                                    child: Image.network(
                                                        'https:' +
                                                            data.condition
                                                                .icon),
                                                  ),
                                                  FittedBox(
                                                    child: Text(
                                                      data.condition.text,
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontSize: 15,
                                                        color:
                                                            Color(0xffffffff),
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,

                                                      // style: TextStyle(fontSize: 16.0),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )),
                                      );
                                    },
                                  );
                                }),
                          ),

                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            '֯֯֯֯֯֯֯֯֯֯֯֯more',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Icon(
                            Iconsax.arrow_bottom,
                            color: Colors.white,
                          ),
                          SizedBox(
                            height: 45,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        // height: 120,
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: c.model.forecast.forecastday.length,
                            itemBuilder: (context, index) {
                              var data =
                                  c.model.forecast.forecastday[index].day;
                              return Builder(
                                builder: (BuildContext context) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                        width: 100,
                                        // width:
                                        //     MedilkjaQuery.of(context).size.width * 0.5,
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 5.0,
                                        ),
                                        decoration: BoxDecoration(
                                            color: Color(0xFFC2ADAD),
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                DateFormat('EEEEE', 'en_US')
                                                    .format(DateTime.parse(c
                                                        .model
                                                        .forecast
                                                        .forecastday[index]
                                                        .date))
                                                    .split(',')
                                                    .single,
                                                style: const TextStyle(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 15,
                                                  color: Color(0xffffffff),
                                                  fontWeight: FontWeight.w300,
                                                ),
                                                textAlign: TextAlign.center,

                                                // style: TextStyle(fontSize: 16.0),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: [
                                                  Transform.scale(
                                                    scale: 1,
                                                    child: Image.network(
                                                        'https:' +
                                                            data.condition
                                                                .icon),
                                                  ),
                                                  FittedBox(
                                                    child: Text(
                                                      data.condition.text,
                                                      style: const TextStyle(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontSize: 15,
                                                        color:
                                                            Color(0xffffffff),
                                                        fontWeight:
                                                            FontWeight.w300,
                                                      ),
                                                      textAlign:
                                                          TextAlign.center,

                                                      // style: TextStyle(fontSize: 16.0),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        )),
                                  );
                                },
                              );
                            }),
                      ),
                    )
                  ],
                ),
                Positioned(
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                          onPressed: () => Get.to(() => SettingScreeen()),
                          icon: Icon(Iconsax.setting)),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
