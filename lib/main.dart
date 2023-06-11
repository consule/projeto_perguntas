import 'package:flutter/material.dart';
import 'package:projeto_perguntas/resposta.dart';
import './questao.dart';

main() => runApp(PerguntaApp());

class _PerguntaAppState extends State<PerguntaApp> {
  // Gerenciador do estado
  int _perguntaSelecionada = 0;
  void _responder() {
    setState(() {
      _perguntaSelecionada++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final perguntas = [
      {
        'texto': 'Qual é a sua cor favorita?',
        'respostas': ['Verde', 'Amarelo', 'Azul', 'Branco', 'Vermelho']
      },
      {
        'texto': 'Qual é o seu animal favorito?',
        'respostas': ['Galinha', 'Codorna', 'Capivara', 'Elefante']
      },
      {
        'texto': 'Qual seu estilo de música preferido?',
        'respostas': ['Pagode', 'Samba', 'Rock', 'Funk (nem fodendo que é esse!)']
      }
    ];

    List<Widget> respostas = [];

    for (String textoResposta in perguntas[_perguntaSelecionada]['respostas'] as List) {
      respostas.add(Resposta(textoResposta, _responder));
    }

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Perguntas do tio Cri 2'),
          ),
          body: Column(
            children: <Widget>[
              Questao(perguntas[_perguntaSelecionada]['texto'].toString()),
              ...respostas,
            ],
          )),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
