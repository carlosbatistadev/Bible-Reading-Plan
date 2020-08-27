import 'package:flutter/material.dart';


// Shared
import '../../shared/default_text.dart';



class HowToReadTheBibleScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget> [

            defaultText(
              primaryText: "Antes de iniciar, ore para que Deus o oriente e abençoe na leitura e, ao terminar, agradeça-lhe as bênçãos recebidas através dessa leitura.",
            ),
            defaultText(
              primaryText: "Leia com reverência e humildade e, sempre que possível, procure ler trechos que tenham sentido completo.",
            ),
            defaultText(
              primaryText: "Leia a sua Bíblia todos os dias, medite naquilo que você está lendo e construa sua vida sobre as promessas e os ensinamentos que ela lhe apresenta.",
            ),

          ]
        ),
      ),
    );
  }


}