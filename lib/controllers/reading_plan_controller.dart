import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';

// External Packages
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

// Shared
import '../shared/data.dart';



class ReadingPlanController extends GetxController {

  static ReadingPlanController get to => Get.find();

  AndroidFlutterLocalNotificationsPlugin androidFlutterLocalNotificationsPlugin;
  AndroidNotificationDetails androidPlatformChannelSpecifics;

  bool remind_me;
  Time set_time;
  IconData remind_me_icon = Icons.notifications;


  List<dynamic> data = [];


  File jsonFile;
  Directory dir;
  final String fileName = "data.json";
  bool fileExists = false;
  bool isLoading = false;


  void _changeIsLoading() {isLoading = !isLoading; update();}


  void getDatas() { 
    if(data.isNotEmpty) return;
    _changeIsLoading(); // True

    getApplicationDocumentsDirectory().then((Directory directory) {

      dir = directory;
      jsonFile = File(dir.path + "/" + fileName);
      fileExists = jsonFile.existsSync();

      if(!fileExists) {

        // Create File
        final File file = File(dir.path + "/" + fileName);
        file.createSync();
        file.writeAsStringSync(json.encode(defaultDATA));
        fileExists = true;

      }

      if (fileExists) {
        final Map<String, dynamic> _dataJSON = json.decode(jsonFile.readAsStringSync());

        data = _dataJSON["annual_reading_plan"];
        set_time = _formatTime(_dataJSON["timeAlarm"], toString: false);
        remind_me = _dataJSON["alarmActivated"];

        _changeAlarmIcon(remind_me);

      }

      _changeIsLoading(); // False

    });

  }


  Map<String, dynamic> calculateHowMuchToFinish(List<dynamic> data) {
   
    double _value = 0.0;
    int _read = 0;
    int _books = data.length;
    _books -= 1;

    for(var book in data) {

      if(book is String || book is int) continue;

      if(book[2]) _read++;

    }
    _value = (_read / _books) * 100;

    return {
     "inString" : '${_value.round()}%',
     "inInt" : _value.round()
    };
  }

  _formatTime(var time, {toString=true}) {
    if(time == null) return;

    if(toString) {
      return "${time.hour}:${time.minute}:${time.second}";

    } else {
      final List<String> _result = time.split(":");

      return Time(
        int.parse(_result[0]), 
        int.parse(_result[1]),
        int.parse(_result[2]),
      );
    }


  }

  void changeCheckedAndChangeAlarm({
    int idMonth, int idDay, Time timeAlarm, bool alarmActivated

    }) {
    _changeIsLoading(); // True


    if(idMonth != null && idDay != null){
      data[idMonth][idDay][2] = !data[idMonth][idDay][2];

      if(data[idMonth][idDay][2]) {
        Get.rawSnackbar(
          message: "Parabéns! Continue assim!", 
          backgroundColor: Colors.green,
        );
      } 
    }

    if (fileExists) {
      final Map<String, dynamic> jsonFileContent = json.decode(jsonFile.readAsStringSync());

      if(idMonth != null && idDay != null) {
        jsonFileContent.addAll({"annual_reading_plan": data});

      } else {
        jsonFileContent.addAll({
          "alarmActivated": alarmActivated,
          "timeAlarm": _formatTime(timeAlarm)
        });

      }

      jsonFile.writeAsStringSync(json.encode(jsonFileContent));

    }

    final Map<String, dynamic> _dataJSON = json.decode(jsonFile.readAsStringSync());
        
    data = _dataJSON["annual_reading_plan"];
    set_time = _formatTime(_dataJSON["timeAlarm"], toString: false);
    remind_me = _dataJSON["alarmActivated"];

    _changeIsLoading(); // False

  }

  void changeTime(DateTime dateTime) {

    set_time = Time(

      dateTime.hour,
      dateTime.minute,
      dateTime.second,

    );

    update();

  }

  void _changeAlarmIcon(bool value) {

    if(value == null) {
      remind_me_icon = Icons.notifications;

    } else if(value) {
      remind_me_icon = Icons.notifications_active;

    } else {
      remind_me_icon = Icons.notifications_off;
    }

  }

  Future<void> saveAlarm() async {

    if(androidFlutterLocalNotificationsPlugin == null) {

      androidFlutterLocalNotificationsPlugin = AndroidFlutterLocalNotificationsPlugin();
      AndroidInitializationSettings initializationSettingsAndroid = 
        AndroidInitializationSettings('app_icon');

      await androidFlutterLocalNotificationsPlugin.initialize(initializationSettingsAndroid);

      androidPlatformChannelSpecifics = AndroidNotificationDetails(
        '0',
        'Standard notification', 
        'Notification that appears every day at a specific time',
        importance: Importance.Max,
        priority: Priority.High,
        visibility: NotificationVisibility.Public,
        ticker: 'ticker'
      );

    } else {

      final _pendingNotificationRequests = 
        await androidFlutterLocalNotificationsPlugin.pendingNotificationRequests();

      if(_pendingNotificationRequests.isNotEmpty)
        await _cancelScheduledAlarms();

    }


    await androidFlutterLocalNotificationsPlugin.showDailyAtTime(
      10,
      "A paz do senhor!",
      'Está na hora, vamos ler a bíblia ?',
      Time(set_time.hour, set_time.minute, set_time.second),
      androidPlatformChannelSpecifics,
    );


    changeCheckedAndChangeAlarm(
      timeAlarm: set_time,
      alarmActivated: true,
    );

    remind_me = true;
    _changeAlarmIcon(remind_me);

    update();
    Get.back();

  }

  Future<void> _cancelScheduledAlarms() async {

    if(androidFlutterLocalNotificationsPlugin != null) {
      await androidFlutterLocalNotificationsPlugin.cancelAll();

    }

  }

  Future<void> disableAlarm() async {

    changeCheckedAndChangeAlarm(
      timeAlarm: set_time,
      alarmActivated: false,
    );

    remind_me = false;
    _changeAlarmIcon(remind_me);

    update();
    Get.back();

  }

}