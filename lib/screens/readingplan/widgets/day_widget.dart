import 'package:flutter/material.dart';

// External Packages
import 'package:get/get.dart';

// Controller
import '../../../controllers/reading_plan_controller.dart';


Widget dayWidget({

  BuildContext context,
  int idMonth,
  int idDay,
  String day,
  String content,
  bool checked,

}) {

  List<String> separate_content = content.split(";");

  return InkWell(
    onLongPress: () {

      if(!ReadingPlanController.to.isLoading) {
        ReadingPlanController.to.changeCheckedAndChangeAlarm(
          idMonth: idMonth, 
          idDay: idDay,
        );
      }
        

    },
    splashColor: Theme.of(context).primaryColor.withOpacity(0.5),
    highlightColor: Theme.of(context).accentColor.withOpacity(0.5),
    child: Stack(
      children: <Widget> [
        Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget> [
                  Text(
                    "DIA: " + day,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ]
              ),
              const SizedBox(height: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  separate_content.length,
                  (books) {
                    return Text(
                      separate_content[books].trim(),
                    );
                  }
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
        if(checked)
        Container(
          width: MediaQuery.of(context).size.width,
          height: 110,
          decoration: BoxDecoration(
            color: Theme.of(context).accentColor.withOpacity(0.7),
            border: Border.all(
              color: Theme.of(context).primaryColor,
              width: 0.5,
            ),
          ),
          child: Center(
            child: const Text(
              "Concluido!",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              )
            ),
          ),
        ),
      ]
    ),
  );
}