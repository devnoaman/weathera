import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weathera/controllers/weather.dart';

class Alerts extends StatelessWidget {
  const Alerts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Weather c = Get.find<Weather>();
    print(c.model.alerts.alert!.length);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          // color: Colors.amber,
          gradient: c.getGrideantBG(),
        ),
        child: ListView.builder(
          itemCount: c.model.alerts.alert!.length,
          itemBuilder: (context, index) {
            print(c.model.alerts.alert!.length);
            return Card(
              child: Column(
                children: [
                  Text(
                    c.model.alerts.alert![index].note.toString(),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
