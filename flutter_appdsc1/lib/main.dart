import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output="0";
  String temp="00";
  double n1=0.0;
  double n2=0.0;
  String op="";
  buttonPressed(String buttonText){
    if(buttonText=="CLEAR"){
      temp="00";
      n1=0.0;
      n2=0.0;
      op="";
    }
    else if(buttonText=="+"||buttonText=="-"||buttonText=="*"||buttonText=="/"){
      n1 = double.parse(output);
      op = buttonText;
      temp="0";
    }
    else if(buttonText=="="){
      n2=double.parse(output);
      if(op=="+"){
        temp=(n1+n2).toString();
      }
      if(op=="-"){
        temp=(n1-n2).toString();
      }
      if(op=="*"){
        temp=(n1*n2).toString();
      }
      if(op=="/"){
        temp=(n1/n2).toString();
      }
      n1=0.0;
      n2=0.0;
      op="";
    }
    else{
      temp=temp+buttonText;
    }
    setState(() {
      output=double.parse(temp).toStringAsPrecision(3);
    });
  }
  Widget makeButton(String buttonText){

    return new Expanded(
      child: new MaterialButton(
        child: Text(buttonText),
        onPressed: (){
          buttonPressed(buttonText);
        },
        color: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: new Container(
          child: new Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(25.0),
                child: new Container(
                  child: new Text(output,style: TextStyle(
                    fontSize: 50.0,
                    fontWeight: FontWeight.bold,
                  ),),alignment: Alignment.bottomRight,
                ),
              ),
              new Expanded(child: new Divider()),
              new Row(
                children: <Widget>[
                  makeButton("7"),
                  makeButton("8"),
                  makeButton("9"),
                  makeButton("+"),
                ],
              ),new Row(
                children: <Widget>[
                  makeButton("4"),
                  makeButton("5"),
                  makeButton("6"),
                  makeButton("-"),
                ],
              ),new Row(
                children: <Widget>[
                  makeButton("1"),
                  makeButton("2"),
                  makeButton("3"),
                  makeButton("*"),
                ],
              ),new Row(
                children: <Widget>[
                  makeButton("0"),
                  makeButton("00"),
                  makeButton("."),
                  makeButton("/"),
                ],
              ),new Row(
                children: <Widget>[
                  makeButton("CLEAR"),
                  makeButton("="),
                ],
              ),
            ],
          ),
        )

    );
  }
}