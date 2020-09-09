import 'package:flutter/material.dart';

// External Packages
import 'package:get/get.dart';

// Controller
import '../../controllers/reading_plan_controller.dart';

// Widgets
import 'widgets/day_widget.dart';



class ReadingPlanScreen extends StatelessWidget {


  final ReadingPlanController controller = Get.put(ReadingPlanController());

  @override
  Widget build(BuildContext context) {


    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: GetBuilder<ReadingPlanController>(
          initState: (_) {

            ReadingPlanController.to.getDatas();

          },
          builder: (_) {

            if(ReadingPlanController.to.data.isEmpty)
              return LinearProgressIndicator();

            bool _alreadyStartedOpen = false;
            bool _initiallyExpanded = false;

            return Column(
              children: List.generate(
                ReadingPlanController.to.data.length,
                (month) {
                  Color _percentageColor = Colors.grey;
                  final _percentageText = ReadingPlanController.to.calculateHowMuchToFinish(
                    ReadingPlanController.to.data[month]
                  );

                  if(_percentageText["inInt"] >= 50) _percentageColor = Colors.orange;
                  if(_percentageText["inInt"] >= 90) _percentageColor = Colors.green;

                  if(!_alreadyStartedOpen) {
                    if(_percentageText["inInt"] != 100){
                      _initiallyExpanded = true;
                      _alreadyStartedOpen = true;
                    }
                  } else {
                    _initiallyExpanded = false;
                  }


                  return ExpansionTile(
                    initiallyExpanded: _initiallyExpanded,
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget> [

                        Text(
                          ReadingPlanController.to.data[month][0],
                          style: const TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),

                        Text(
                          _percentageText["inString"],
                          style: TextStyle(
                            color: _percentageColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),

                      ]
                    ),
                    children: List.generate(
                      ReadingPlanController.to.data[month].length,
                      (day) {

                        if(ReadingPlanController.to.data[month][day] is String ||
                          ReadingPlanController.to.data[month][day] is int
                        ) {
                          return Container();
                        }
                        
                        return dayWidget(
                          context: context,
                          idMonth: month,
                          idDay: day,
                          day: ReadingPlanController.to.data[month][day][0],
                          content: ReadingPlanController.to.data[month][day][1],
                          checked: ReadingPlanController.to.data[month][day][2],
                        );
                      }
                    ),
                  );
                }
              ),
            );
          }
        ),
      ),
    );
  }
}