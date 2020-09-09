import 'package:flutter/material.dart';


class BooksAndLettersScreen extends StatelessWidget {

  final List<String> _historicalBooks = [
    "Gênesis", "Êxodo", "Levítico",
    "Números", "Deuteronômio", "Josué",
    "Juízes", "Rute", "1 Samuel", "2 Samuel",
    "1 Reis", "2 Reis", "1 Crônicas", "2 Crônicas",
    "Esdras", "Neemias", "Ester", "Mateus", "Marcos",
    "Lucas", "João", "Atos dos Apóstolos"
  ];

  final List<String> _poemWisdomBooks = [
    "Jó", "Salmos", "Provérbios", "Exlesiastes", "Cânticos",
  ];

  final List<String> _prophecyBooks = [
    "Isaías", "Jeremias", "Lamentações", "Ezequiel", "Daniel",
    "Oséias", "Joel", "Amós", "Obadias", "Jonas", "Miquéias",
    "Naum", "Habacuque", "Sofonias", "Ageu", "Zacarias", "Malaquias"
  ];

  final List<String> _cards = [
    "Romanos", "1 Coríntios", "2 Coríntios", "Gálatas", "Efésios",
    "Filipenses", "Colossenses", "1 Tessalonicenses", "2 Tessalonicenses",
    "1 Timóteo", "2 Timóteo", "Tito", "Filemon", "Hebreus", "Tiago", "1 Pedro",
    "2 Pedro", "1 João", "2 João", "3 João", "Judas", "Apocalipse"
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 20,
        ),
        child: Column(
          children: <Widget> [
            _customExpansionTile(
              title: "Livros Históricos",
              list: _historicalBooks
            ),
            _customExpansionTile(
              title: "Livros de Poemas/Sabedoria",
              list: _poemWisdomBooks
            ),
            _customExpansionTile(
              title: "Livros de Profecias",
              list: _prophecyBooks
            ),
            _customExpansionTile(
              title: "Cartas",
              list: _cards
            ),
          ]
        )
      ),
    );
  }

  _customExpansionTile({String title, List<String> list}) {
    return ExpansionTile(
      title: Text(title),
      childrenPadding: const EdgeInsets.all(10),
      children: List.generate(
        list.length,
        (index) {
          return Container(
            alignment: Alignment.topLeft,
            child: Text(list[index]),
          );
        }
      ),
    );
  }
}