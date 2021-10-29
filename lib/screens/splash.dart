import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:weathera/controllers/weather.dart';
import 'package:weathera/screens/home.dart';
import 'package:weathera/screens/setting.dart';

class Splash extends StatefulWidget {
  final String city;
  const Splash({
    Key? key,
    this.city = 'Baghdad',
  }) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  Weather c = Get.find<Weather>();

  @override
  void initState() {
    super.initState();
    Future.microtask(() => c.getHttp(city: widget.city)).then((value) {
      if (value == '') {
        Get.offAll(() => MyHomePage());
      } else {
        showCupertinoDialog<void>(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: const Text('Alert'),
            content: Text(value),
            actions: <CupertinoDialogAction>[
              CupertinoDialogAction(
                child: const Text('No'),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              CupertinoDialogAction(
                child: const Text('Yes'),
                isDestructiveAction: true,
                onPressed: () {
                  // Do something destructive.
                  Get.offAll(() => SettingScreeen());
                },
              )
            ],
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
