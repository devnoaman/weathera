import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:weathera/controllers/weather.dart';
import 'package:weathera/screens/alerts.dart';
import 'package:weathera/screens/splash.dart';

class SettingScreeen extends StatefulWidget {
  const SettingScreeen({Key? key}) : super(key: key);

  @override
  State<SettingScreeen> createState() => _SettingScreeenState();
}

class _SettingScreeenState extends State<SettingScreeen> {
  late TextEditingController _textController;
  String currentCity = 'Baghdad';

  @override
  void initState() {
    super.initState();
    _textController = TextEditingController(text: currentCity);
  }

  List<String> cities = [
    'Baghdad',
    'al-anbar',
    'Arbil',
    'ninawa',
    'al-basra',
  ];
  @override
  Widget build(BuildContext context) {
    Weather c = Get.find<Weather>();

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          // color: Colors.amber,
          gradient: c.getGrideantBG(),
        ),
        child: ListView(
          children: [
            ListTile(
              onTap: () {
                showModalBottomSheet(
                    context: context,
                    isDismissible: false,
                    builder: (BuildContext builder) {
                      return Container(
                          color: Colors.black87,
                          height:
                              MediaQuery.of(context).copyWith().size.height / 3,
                          child: SafeArea(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CupertinoSearchTextField(
                                      itemColor: Colors.white,
                                      controller: _textController,
                                      onChanged: (value) {
                                        currentCity = value;
                                      },
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 20)),
                                ),
                                Expanded(
                                  child: CupertinoPicker(
                                      itemExtent: 25,
                                      magnification: 1.5,
                                      // backgroundColor: Colors.black87,
                                      onSelectedItemChanged: (int value) {
                                        setState(() {
                                          currentCity = cities[value];
                                          _textController.text = cities[value];
                                        });
                                      },
                                      children: cities
                                          .map(
                                            (e) => Text(
                                              e,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20),
                                            ),
                                          )
                                          .toList()),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    CupertinoButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: Text(
                                        'cancel',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                    CupertinoButton(
                                      onPressed: () => Get.offAll(() => Splash(
                                            city: currentCity,
                                          )),
                                      child: Text('Set City'),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ));
                    });
              },
              leading: Icon(Iconsax.home),
              title: Text(
                'Current city: ${c.model.location.name}',
              ),
            ),
            ListTile(
              leading: Icon(Iconsax.notification),
              onTap: () => Get.to(() => Alerts()),
              title: Text(
                'Alerts',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
