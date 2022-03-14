import 'package:flutter/material.dart';
import 'package:get/get.dart';

import './variable.dart';
import 'buttons.dart';
import 'model.dart';
import 'name_list.dart';

class AdminOut extends StatelessWidget {
  const AdminOut({Key? key}) : super(key: key);

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
                        if (x.data![index].checkStatus == false &&
                            x.data![index].role == 'Admin')
                          NameButtons(
                            name: x.data![index].name,
                            delete: () {
                              timeController.greeting();
                              timeController.updateTime();
                              var gize = timeController.time;

                              updateJsonTime(
                                  id: x.data![index].id,
                                  checkStatus: true,
                                  time: x.data![index].time);

                              Get.offNamed(
                                  '/checkout?name=${x.data![index].name}&savedtime=${x.data![index].time}&timeGreet=${timeController.timeGreet}&current=$gize');
                            },
                          ),
                      ]))),
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

class StaffOut extends StatelessWidget {
  const StaffOut({Key? key}) : super(key: key);

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
                        if (x.data![index].checkStatus == false &&
                            x.data![index].role == 'Staff')
                          NameButtons(
                            name: x.data![index].name,
                            delete: () {
                              timeController.greeting();
                              timeController.updateTime();
                              var gize = timeController.time;

                              updateJsonTime(
                                  id: x.data![index].id,
                                  checkStatus: true,
                                  time: x.data![index].time);

                              Get.offNamed(
                                  '/checkout?name=${x.data![index].name}&savedtime=${x.data![index].time}&timeGreet=${timeController.timeGreet}&current=$gize');
                            },
                          ),
                      ]))),
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

class StudentOut extends StatelessWidget {
  const StudentOut({Key? key}) : super(key: key);

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
                        if (x.data![index].checkStatus == false &&
                            x.data![index].role == 'Student')
                          NameButtons(
                            name: x.data![index].name,
                            delete: () {
                              timeController.greeting();
                              timeController.updateTime();
                              var gize = timeController.time;

                              updateJsonTime(
                                  id: x.data![index].id,
                                  checkStatus: true,
                                  time: x.data![index].time);

                              Get.offNamed(
                                  '/checkout?name=${x.data![index].name}&savedtime=${x.data![index].time}&timeGreet=${timeController.timeGreet}&current=$gize');
                            },
                          ),
                      ]))),
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
