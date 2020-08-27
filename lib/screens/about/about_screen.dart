import 'package:flutter/material.dart';

// External Packages
import 'package:url_launcher/url_launcher.dart';



class AboutScreen extends StatelessWidget {
    
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget> [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.all(Radius.circular(100)),
                image: DecorationImage(
                  image: AssetImage(
                    'assets/images/logo/caffee.png',
                  ),
                )
              ),
            ),
            const Text("CAFFEE tec",
              style: const TextStyle(
                fontSize: 20,
              )
            ),
            const SizedBox(height: 18,),
            const Text(
              "Este aplicativo foi desenvolvido para pessoas que querem ler a " + 
              "bíblia toda em um ano, esse plano de leitura e os outros textos, foram " + 
              "obetidos por uma bíblia (ARA), confira informações:\n" +
              "sbb ( SOCIEDADE BÍBLICA DO BRASIL)\n" + 
              "SEDE: Av Ceci, 706 - Tamboré - Barueri, SP - 06560-120\n" +
              "Cx. Postal 330 - 06453-970\n" +
              "Fone: (11) 4195-9590 - Fax: (11) 4195-9591\n" +
              "Visite o site na internet: www.sbb.org.br",
            ),
            const Divider(),
            const SizedBox(height: 20),
            const Text(
              "Para acompanhar as atualizações, Sugerir melhorias e " + 
              "Acompanhar nossos projetos: ",
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Wrap(
                children: <Widget> [
                  ActionChip(
                    label: const Text("Instagram", style: TextStyle(color: Colors.white)),
                    backgroundColor: Theme.of(context).accentColor,
                    onPressed: () async {
                      await launch('https://www.instagram.com/caffee-tec');
                    }
                  ),
                  const SizedBox(width: 10,),
                  ActionChip(
                    label:const Text("WhatsApp", style: TextStyle(color: Colors.white)),
                    backgroundColor: Theme.of(context).accentColor,
                    onPressed: () async {
                      await launch(
                        'https://api.whatsapp.com/send?phone=5583996299413&text=Ol%C3%A1.%20Tudo%20bem%3F%20venho%20do%20seu%20App!'
                      );
                    }
                  ),
                ]
              ),
            ),
            const Text(
              "suporte.caffee@gmail.com",
              style: TextStyle(
                color: Colors.grey,
              ),
            )
          ]
        ),
      ),
    );
  }
}
