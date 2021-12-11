import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String output="0";
  String _output= "0";
  double num1=0;
  double num2=0;
  String operand= "";

  btnPressed(String text){
    print(text);

    if(text=="C"){
      _output= "0";
      num1=0;
      num2=0;
      operand= "";
    }else if(text=="+" || text=="-" || text=="X" || text=="/"){
      num1= double.parse(output);
      operand= text;
      _output= "0";
    }else if(text=='.'){
      if(_output.contains('.')){
        return;
      }else{
        _output += text;
      }
    }else if(text=='='){
      num2= double.parse(output);
      if(operand=='+'){
        _output = (num1+num2).toString();
      }else if(operand=='-'){
        _output = (num1-num2).toString();
      }else if(operand=='X'){
        _output = (num1*num2).toString();
      }else{
        _output = (num1/num2).toString();
      }

      num1=0;
      num2=0;
      // _output= "0";
      operand= "";
    }else if(text=="0" || text=="1" || text=="2" || text=="3" ||
        text=="4" || text=="5" || text=="6" || text=="7" || text=="8" || text=="9"){
      _output += text;
    }

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
    });

  }

  Widget buildButton(String text){
    return Expanded(child: MaterialButton(
      shape: const CircleBorder(),
      onPressed: (){
        btnPressed(text);
      },
      color: Colors.grey,
      height: 60,
      child: Text(text, style: const TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CALCULATOR', style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 18
        ),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
              child: Text(
                output,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold
                ),
              )
          ),
          const Expanded(child: Divider()),
          Row(
            children: [
              buildButton("C"),
              buildButton("()"),
              buildButton("%"),
              buildButton("/"),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              buildButton("7"),
              buildButton("8"),
              buildButton("9"),
              buildButton("X"),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              buildButton("4"),
              buildButton("5"),
              buildButton("6"),
              buildButton("-"),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              buildButton("1"),
              buildButton("2"),
              buildButton("3"),
              buildButton("+"),
            ],
          ),
          const SizedBox(height: 10,),
          Row(
            children: [
              buildButton("+/-"),
              buildButton("0"),
              buildButton("."),
              buildButton("="),
            ],
          ),
          const SizedBox(height: 10,),
        ],
      ),
    );
  }
}

