import 'package:flutter/material.dart';

// External Packages
import 'package:get/get.dart';

// Controller
import '../../controllers/manager_controller.dart';
import '../../controllers/reading_plan_controller.dart';

// Widgets
import 'widgets/tile_widget.dart';

// Screens
import '../setalarm/set_alarm_screen.dart';




class ScreenManager extends StatelessWidget {

  ManagerController controller = Get.put(ManagerController());


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: GetBuilder<ManagerController>(
          builder: (_) {
            return Text(ManagerController.to.title);
          }
        ),
        elevation: 0.0,
        actions: <Widget> [
          GetBuilder<ReadingPlanController>(
            builder: (_) {

              return IconButton(
                icon: Icon(ReadingPlanController.to.remind_me_icon),
                onPressed: () {
                  Get.to(SetAlarmScreen());
                }
              );

            }
          ),
        ]
      ),
      drawer: Drawer(
        child: GetBuilder<ManagerController>(
          builder: (_) {
            return ListView(
              padding: EdgeInsets.zero,
              children: <Widget> [
                DrawerHeader(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: const Text.rich(
                      const TextSpan(
                        text: 'plano de\n', 
                        style: TextStyle(color: Colors.white),
                        children: <TextSpan>[
                          TextSpan(
                            text: ' leitura Bíblica ', 
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 25,
                            )
                          ),
                        ],
                      ),
                    )
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    image: const DecorationImage(
                      image: AssetImage(
                        'assets/images/drawer/background.jpg',
                      ),
                      
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                tileWidget(
                  context: context,
                  selected: ManagerController.to.current_screen == "reading_plan" ? true : false,
                  icon: Icons.chrome_reader_mode,
                  title: "Plano de leitura",
                  onTap: () {
                    ManagerController.to.updateScreen({
                      "title": "Plano de leitura",
                      "current_screen": "reading_plan",
                    });
                  }
                ),
                tileWidget(
                  context: context,
                  selected: ManagerController.to.current_screen == "why_read_the_bible" ? true : false,
                  icon: Icons.help,
                  title: "Por que ler a Bíblia",
                  onTap: () {
                    ManagerController.to.updateScreen({
                      "title": "Por que ler a Bíblia",
                      "current_screen": "why_read_the_bible",
                    });
                  }
                ),
                tileWidget(
                  context: context,
                  selected: ManagerController.to.current_screen == "how_to_read_the_bible" ? true : false,
                  icon: Icons.help,
                  title: "Como ler a Bíblia",
                  onTap: () {
                    ManagerController.to.updateScreen({
                      "title": "Como ler a Bíblia",
                      "current_screen": "how_to_read_the_bible",
                    });
                  }
                ),
                tileWidget(
                  context: context,
                  selected: ManagerController.to.current_screen == "about" ? true : false,
                  icon: Icons.info,
                  title: "Sobre",
                  onTap: () {
                    ManagerController.to.updateScreen({
                      "title": "Sobre o App",
                      "current_screen": "about",
                    });
                  }
                ),
              ]
            );
          }
        ),
      ),
      body: GetBuilder<ManagerController>(
        builder: (_) {
          return ManagerController.to.body;
        }
      ),
    );
  }
}