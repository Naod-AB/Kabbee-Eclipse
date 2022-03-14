import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './variable.dart';
import 'buttons.dart';
import 'model.dart';

TimeController timeController = Get.put(TimeController());

class AdminList extends StatelessWidget {
  AdminList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NameListJson>>(
        future: timeController.fetchNameList(),
        builder: (context, x) {
          if (x.hasData) {
            return Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: x.data!.length,
                itemBuilder: ((context, index) => Column(children: [
                      if (x.data![index].checkStatus == true &&
                          x.data![index].role == "Admin")
                        NameButtons(
                          name: x.data![index].name,
                          delete: () {
                            timeController.greeting();
                            timeController.updateTime();

                            var gize = timeController.time;
                            updateJsonTime(
                                time: gize.toString(),
                                id: x.data![index].id,
                                checkStatus: false);

                            Get.offNamed(
                                '/checkin?name=${x.data![index].name}&time=$gize&timeGreet=${timeController.timeGreet}');
                          },
                        ),
                    ])),
              ),
            );
          } else if (x.hasError) {
            return Chip(
              avatar: Icon(Icons.error),
              label: Text('${x.error}'),
            );
          }

          return const CircularProgressIndicator();
        });
  }
}

class StaffList extends StatelessWidget {
  const StaffList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NameListJson>>(
        future: timeController.fetchNameList(),
        builder: (context, x) {
          if (x.hasData) {
            return Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: x.data!.length,
                itemBuilder: ((context, index) => Column(children: [
                      if (x.data![index].checkStatus == true &&
                          x.data![index].role == "Staff")
                        NameButtons(
                          name: x.data![index].name,
                          delete: () {
                            timeController.greeting();
                            timeController.updateTime();
                            var gize = timeController.time;
                            updateJsonTime(
                                time: gize.toString(),
                                id: x.data![index].id,
                                checkStatus: false);

                            Get.offNamed(
                                '/checkin?name=${x.data![index].name}&time=$gize&timeGreet=${timeController.timeGreet}');
                          },
                        ),
                    ])),
              ),
            );
          } else if (x.isBlank!) {
            return Chip(
              avatar: Icon(Icons.error),
              label: Text('${x.error}'),
            );
          }

          return const CircularProgressIndicator();
        });
  }
}

class StudentList extends StatelessWidget {
  const StudentList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<NameListJson>>(
        future: timeController.fetchNameList(),
        builder: (context, x) {
          if (x.hasData) {
            return Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: x.data!.length,
                itemBuilder: ((context, index) => Column(children: [
                      if (x.data![index].checkStatus == true &&
                          x.data![index].role == "Student")
                        NameButtons(
                          name: x.data![index].name,
                          delete: () {
                            timeController.greeting();
                            timeController.updateTime();
                            var gize = timeController.time;
                            updateJsonTime(
                                time: gize.toString(),
                                id: x.data![index].id,
                                checkStatus: false);

                            Get.offNamed(
                                '/checkin?name=${x.data![index].name}&time=$gize&timeGreet=${timeController.timeGreet}');
                          },
                        ),
                    ])),
              ),
            );
          } else if (x.hasError) {
            return Chip(
              avatar: Icon(Icons.error),
              label: Text('${x.error}'),
            );
          }

          return const CircularProgressIndicator();
        });
  }
}
