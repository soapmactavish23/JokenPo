import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Jogo extends StatefulWidget {
  @override
  _JogoState createState() => _JogoState();
}

class _JogoState extends State<Jogo> {

  var _imagemApp = AssetImage("imagens/padrao.png");
  var _msg = "Escolha do App";

  void _opcaoSelecionada(String escolhaJogador){

    var opcoes = ["pedra", "papel", "tesoura"];
    var num = Random().nextInt(3);
    var escolhaApp = opcoes[num];
    
    switch(escolhaApp){
      case "pedra":
        setState(() {
          this._imagemApp = AssetImage("imagens/" + escolhaApp + ".png");
        });
        break;
      case "papel":
        setState(() {
          this._imagemApp = AssetImage("imagens/" + escolhaApp + ".png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imagemApp = AssetImage("imagens/" + escolhaApp + ".png");
        });
        break;
    }

    //Validando o ganhador
    if(
    (escolhaJogador == "pedra" && escolhaApp == "tesoura") ||
        (escolhaJogador == "tesoura" && escolhaApp == "papel") ||
        (escolhaJogador == "papel" && escolhaApp == "pedra")
    ){
      setState(() {
        this._msg = "Parabéns você venceu";
      });
    }else if(
    (escolhaJogador == "pedra" && escolhaApp == "pedra") ||
        (escolhaJogador == "tesoura" && escolhaApp == "tesoura") ||
        (escolhaJogador == "papel" && escolhaApp == "papel")
    ){
      setState(() {
        this._msg = "Empatou";
      });
    }else{
      setState(() {
        this._msg = "Você Perdeu";
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 32, bottom: 16),
              child: Text(
                this._msg,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),
          ),
          Image(image: this._imagemApp,),
          Padding(
              padding: EdgeInsets.only(top: 16, bottom: 16),
            child: Text(
              "Escolha uma opção a baixo",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              GestureDetector(
                onTap: () => _opcaoSelecionada("pedra"),
                child: Image.asset("imagens/pedra.png", height: 100),
              ),
              GestureDetector(
                  onTap: () => _opcaoSelecionada("papel"),
                  child: Image.asset("imagens/papel.png", height: 100),
              ),
              GestureDetector(
                onTap: () => _opcaoSelecionada("tesoura"),
                child: Image.asset("imagens/tesoura.png", height: 100),
              ),
            ],
          )
          //imagens
        ],
      ),
    );
  }
}
