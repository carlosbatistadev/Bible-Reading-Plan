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

                  if(ReadingPlanController.to.remind_me == null && 
                    ReadingPlanController.to.set_time == null
                    )
                    Text(
                      "Escolha um horário para ser lembrado todos os dias...",
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                      ),
                    ),

                  if(ReadingPlanController.to.set_time != null)
                    const Text('Horário definido para todos os dias às:',),
                  const SizedBox(height: 10,),
                  FlatButton(
                    child: Text(
                      ReadingPlanController.to.set_time == null ?
                      "00:00:00" : 
                      "${ReadingPlanController.to.set_time?.hour}:" +
                      "${ReadingPlanController.to.set_time?.minute}:" +
                      "${ReadingPlanController.to.set_time?.second}",
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
                        currentTime: ReadingPlanController.to.set_time != null ? 
                        DateTime(
                          _now.year,
                          _now.month,
                          _now.day,
                          ReadingPlanController.to.set_time.hour,
                          ReadingPlanController.to.set_time.minute,
                          ReadingPlanController.to.set_time.second,
                          
                        ) : _now,
                        onConfirm: (time) {

                          ReadingPlanController.to.changeTime(time);

                        },
                      );

                    },
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    ReadingPlanController.to.remind_me != null && 
                    !ReadingPlanController.to.remind_me ? 
                    "Mas o alarme está desativado..." :
                    "",
                  ),
                  const SizedBox(height: 60,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget> [
                      if(ReadingPlanController.to.set_time != null)
                        RaisedButton(
                          color: Theme.of(context).buttonColor,
                          textColor: Colors.white,
                          child: Text(
                            ReadingPlanController.to.remind_me != null && 
                            !ReadingPlanController.to.remind_me ?
                            "Ativar" : "Pronto",
                          ),
                          onPressed: () async {

                            await ReadingPlanController.to.saveAlarm();

                          },
                        ),
                      if(ReadingPlanController.to.set_time != null && 
                        ReadingPlanController.to.remind_me != null && 
                        ReadingPlanController.to.remind_me)
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