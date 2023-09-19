import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:whether/app/controller/main_controller.dart';
import 'package:whether/app/model/current_weather_model.dart';
import 'package:whether/app/model/hour_weather_model.dart';
import 'package:whether/utils/constants/api_const.dart';
import 'package:whether/app/view/bot/ui/bot_page.dart';
import 'package:whether/app/widgets/appbar.dart';
import '../../../controller/location_controller.dart';
import '../../../../utils/constants/images.dart';
import '../../../widgets/drawer_widget.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var controller = Get.put(MainController());
  var locationController = Get.put(LocationController());

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      drawer: const DrawerWidget(),
      body: Container(
          padding: const EdgeInsets.all(12),
          child: FutureBuilder(
              future: controller.currentWeatherData,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  CurrentWeatherData? data =
                      snapshot.data as CurrentWeatherData?;

                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Row(
                              children: [
                                // ignore: unnecessary_string_interpolations
                                "${data!.name}"
                                    .text
                                    .uppercase
                                    .fontFamily("poppins")
                                    .size(36)
                                    .make(),
                                10.widthBox,
                                "location Using API"
                                    .text
                                    .fontFamily("poppins")
                                    .size(15)
                                    .make(),
                              ],
                            ),
                            Row(
                              children: [
                                Image.asset(
                                  "assets/weather/${data.weather[0].icon}.png",
                                  width: 80,
                                  height: 80,
                                ),
                                const SizedBox(
                                  width: 130,
                                ),
                                Text(
                                  "${data.main.temp}$degree",
                                  style: const TextStyle(
                                    fontFamily: "poppins",
                                    fontSize: 64,
                                  ),
                                ),
                                Text(
                                  "${data.weather[0].main}",
                                  style: const TextStyle(
                                    fontFamily: "poppins",
                                    fontSize: 14,
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton.icon(
                                    onPressed: null,
                                    icon: Constants.rounded,
                                    label: Text("${data.main.tempMax}$degree")),
                                TextButton.icon(
                                    onPressed: null,
                                    icon: Constants.expand,
                                    label: Text("${data.main.tempMin}$degree"))
                              ],
                            ),
                          ],
                        ),
                        10.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: List.generate(3, (index) {
                            var IconList = [clouds, humidity, windspeed];
                            var values = [
                              '${data.clouds.all} %',
                              '${data.main.humidity} %',
                              '${data.wind.speed} km/h'
                            ];

                            return Column(
                              children: [
                                Image.asset(
                                  IconList[index],
                                  width: 60,
                                  height: 60,
                                )
                                    .box
                                    .gray200
                                    .padding(const EdgeInsets.all(8))
                                    .roundedSM
                                    .make(),
                                10.heightBox,
                                values[index].text.gray400.make(),
                              ],
                            );
                          }),
                        ),
                        10.heightBox,
                        const Divider(),
                        10.heightBox,
                        FutureBuilder(
                          future: controller.hourWeatherData,
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              HourlyWeatherData hourlyData = snapshot.data;

                              return SizedBox(
                                height: 160,
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: hourlyData.list!.length > 6
                                      ? 6
                                      : hourlyData.list!.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    var time = DateFormat.jm().format(
                                        DateTime.fromMillisecondsSinceEpoch(
                                            hourlyData.list![index].dt!
                                                    .toInt() *
                                                1000));

                                    return Container(
                                      padding: const EdgeInsets.all(8),
                                      margin: const EdgeInsets.only(right: 4),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: Column(
                                        children: [
                                          time.text.make(),
                                          Image.asset(
                                            "assets/weather/${hourlyData.list![index].weather![0].icon}.png",
                                            width: 80,
                                          ),
                                          10.heightBox,
                                          "${hourlyData.list![index].main!.temp}$degree"
                                              .text
                                              .make(),
                                        ],
                                      ),
                                    );
                                  },
                                ),
                              );
                            }
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        ),
                        10.heightBox,
                        const Divider(),
                        10.heightBox,
                        Obx(
                          () => Row(
                            children: [
                              locationController.city.value.text.uppercase
                                  .fontFamily("poppins")
                                  .size(15)
                                  .make(),
                              10.widthBox,
                              "using Geolocator"
                                  .text
                                  .fontFamily("poppins")
                                  .size(10)
                                  .make(),
                            ],
                          ),
                        ),
                        10.heightBox,
                        const Divider(),
                        20.heightBox,
                        Column(
                          children: [
                            " AccuBot is Here to help You! "
                                .text
                                .fontFamily("poppins_light")
                                .size(25)
                                .make(),
                            IconButton(
                              icon: Image.asset('assets/icons/robot.gif'),
                              iconSize: 70,
                              onPressed: () {
                                Get.off(() =>const BotPage());
                              },
                            )
                          ],
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              })),
    );
  }
}
