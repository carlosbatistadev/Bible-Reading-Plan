import 'package:flutter/material.dart';

// External Packages
import 'package:get/get.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

// Controller
import '../../controllers/reading_plan_controller.dart';



class SetAlarmScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Definir Alarme"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 20,
          ),
          child: GetBuilder<ReadingPlanController>(
            builder: (_) {

              return Column(
                children: <Widget> [
                  const SizedBox(height: 20,),

                  if(ReadingPlanController.to.remindMe == null && 
                    ReadingPlanController.to.setTime == null
                    )
                    Text(
                      "Escolha um horário para ser lembrado todos os dias...",
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),

                  if(ReadingPlanController.to.setTime != null)
                    const Text('Horário definido para todos os dias às:',),
                  const SizedBox(height: 10,),
                  FlatButton(
                    child: Text(
                      ReadingPlanController.to.setTime == null ?
                      "00:00:00" : 
                      "${ReadingPlanController.to.setTime?.hour}:" +
                      "${ReadingPlanController.to.setTime?.minute}:" +
                      "${ReadingPlanController.to.setTime?.second}",
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 19,
                      ),
                    ),
                    onPressed: () async {
                      final DateTime _now = DateTime.now();

                      await DatePicker.showTimePicker(
                        context,
                        locale: LocaleType.pt,
                        currentTime: ReadingPlanController.to.setTime != null ? 
                        DateTime(
                          _now.year,
                          _now.month,
                          _now.day,
                          ReadingPlanController.to.setTime.hour,
                          ReadingPlanController.to.setTime.minute,
                          ReadingPlanController.to.setTime.second,
                          
                        ) : _now,
                        onConfirm: (time) {

                          ReadingPlanController.to.changeTime(time);

                        },
                      );

                    },
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    ReadingPlanController.to.remindMe != null && 
                    !ReadingPlanController.to.remindMe ? 
                    "Mas o alarme está desativado..." :
                    "",
                  ),
                  const SizedBox(height: 60,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget> [
                      if(ReadingPlanController.to.setTime != null)
                        RaisedButton(
                          color: Theme.of(context).buttonColor,
                          textColor: Colors.white,
                          child: Text(
                            ReadingPlanController.to.remindMe != null && 
                            !ReadingPlanController.to.remindMe ?
                            "Ativar" : "Pronto",
                          ),
                          onPressed: () async {

                            await ReadingPlanController.to.saveAlarm();

                          },
                        ),
                      if(ReadingPlanController.to.setTime != null && 
                        ReadingPlanController.to.remindMe != null && 
                        ReadingPlanController.to.remindMe)
                        Padding(
                          padding: const EdgeInsets.only(left: 5,),
                          child: RaisedButton(
                            textColor: Colors.white,
                            color: Theme.of(context).buttonColor,
                            child: const Text("Desativar"),
                            onPressed: () {

                              ReadingPlanController.to.disableAlarm();

                            },
                          ),
                        ),
                    ]
                  ),

                ]
              );
            }
          ),
        ),
      )
    );
  }
}