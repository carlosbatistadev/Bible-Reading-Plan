import 'package:flutter/material.dart';


// Shared
import '../../shared/default_text.dart';


class WhyReadTheBibleScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget> [

            defaultText(
              primaryText: '-- Porque por meio dela conhecemos a Deus e ficamos sabendo oque ele exige de nós e também oque ele nos promete:',
              secundaryText: '\nToda a Escritura é divinamente inspirada, e proveitosa para ensinar, ' + 
              'para redargüir, para corrigir, para instruir em justiça (ACF - 2 Timóteo 3:16);\n\n ' + 
              'Examinais as Escrituras, porque vós cuidais ter nelas a vida eterna, e são elas que de' + 
              'mim testificam (ACF - João 5.39);\n\nPor intermédio destas ele nos deu as suas grandiosas' + 
              'e preciosas promessas, para que por elas vocês se tornassem participantes da natureza divina' +
              ' e fugissem da corrupção que há no mundo, causada pela cobiça. (NVI - 2 Pedro 1.4)\n\n'
            ),
            const Divider(),
            defaultText(
              primaryText: '-- Porque nela se encontra revelado o amor de Deus pelo ser humano:',
              secundaryText: '\nPorque Deus amou o mundo de tal maneira que deu o seu Filho unigênito, para que todo aquele que nele crê não pereça, mas tenha a vida eterna. (ACF - João 3:16);\n\n' +
              'Jesus realizou na presença dos seus discípulos muitos outros sinais miraculosos, que não estão registrados neste livro. Mas estes foram escritos para que vocês creiam que Jesus é o Cristo,' + 
              'o Filho de Deus e, crendo, tenham vida em seu nome. (NVI - João 20:30,31)\n\n',
            ),
            const Divider(),
            defaultText(
              primaryText: '-- Porque nela somos ensinados e habilitados a viver o mais alto conceito de amor:',
              secundaryText: ' Mateus 5.43-48; 1 Coríntions 13; Romanos 12.9-21\n\n',
            ),
            const Divider(),
            defaultText(
              primaryText: '-- Porque nela encontramos mensagens de consolo e de paz: ',
              secundaryText: '\nNão se turbe o vosso coração; credes em Deus, crede também em mim.' + 
              ' Na casa de meu Pai há muitas moradas; se não fosse assim, eu vo-lo teria dito. Vou preparar-vos lugar. (ACF - João 14:1,2... completo)\n\n',
            ),
            const Divider(),
            defaultText(
              primaryText: '-- Porque suas palavras falam ao coração angustiado e o consolam:',
              secundaryText: '\nBendize, ó minha alma, ao SENHOR, e tudo o que há em mim bendiga o seu santo nome. ' + 
              'Bendize, ó minha alma, ao Senhor, e não te esqueças de nenhum de seus benefícios. (ACF - Salmos 103:1,2... completo )\n\n'
            ),
            const Divider(),
            defaultText(
              primaryText: '-- Porque nela se encontram os princípios para uma vida de felicidade e harmonia no lar:',
              secundaryText: ' Efésios 5.22--6.4\n\n',
            ),
          ]
        ),
      ),
    );
  }
}