import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {

  String? value = ""; //function value
  String? history = ""; //to display history
  int? firstValue, secondValue; //first and second integer value
  String? result; //stores result
  String? operation; //operation to perform

  Widget customButton(String value){
    //custom button widget

    return Expanded(
        child: SizedBox(
          height: 90,
          width: 50,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.white12),
              ),
              child: Text(value,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold
                ),
              ),
              onPressed: () => clickedButtonOperation(value),
            ),
          ),
        )
    );
  }

  void clickedButtonOperation(String buttonText) {

    //function for calculator operations (/, *, -, +)

    if (buttonText == "AC") {
      result = "";
      value = "";
      history = "";
      firstValue = 0;
      secondValue = 0;
    }
    else if (buttonText == "/" || buttonText == "x" || buttonText == "-" || buttonText == "+") {
      firstValue = int.parse(value!);
      result = "";
      operation = buttonText;
    }
    else if (buttonText == "=") {
      secondValue = int.parse(value!);
      if (operation == "/") {
        //division operation
        result = (firstValue! / secondValue!).toString();
        history = (firstValue.toString() + operation.toString() + secondValue.toString());
      }
      if (operation == "x") {
        //multiplication operation
        result = (firstValue! * secondValue!).toString();
        history = (firstValue.toString() + operation.toString() + secondValue.toString());
      }
      if (operation == "-") {
        //difference operation
        result = (firstValue! - secondValue!).toString();
        history = (firstValue.toString() + operation.toString() + secondValue.toString());
      }
      if (operation == "+") {
        //addition operation
        result = (firstValue! + secondValue!).toString();
        history = (firstValue.toString() + operation.toString() + secondValue.toString());
      }
    }
    else {
      result = int.parse(value! + buttonText).toString();
    }
    setState(() {
      value = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,

      //app bar of the application
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("Calculator",
          style: TextStyle(
            fontSize: 35
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget> [

          //to display the history of calculation
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              child: Text(history!,
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white38
                ),
              ),
            ),
          ),

          //to display the result
          Container(
            alignment: Alignment.bottomRight,
            child: Text(value!,
              style: const TextStyle(
                  fontSize: 70,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
              ),
            ),
          ),

          //rows to display numbers and operations of the calculator
          Row(
            children: <Widget> [
              customButton("7"),
              customButton("8"),
              customButton("9"),
              customButton("/"),
            ],
          ),
          Row(
            children: <Widget> [
              customButton("4"),
              customButton("5"),
              customButton("6"),
              customButton("x"),
            ],
          ),
          Row(
            children: <Widget> [
              customButton("1"),
              customButton("2"),
              customButton("3"),
              customButton("-"),
            ],
          ),
          Row(
            children: <Widget> [
              customButton("C"),
              customButton("0"),
              customButton("="),
              customButton("+"),
            ],
          )
        ],
      ),
    );
  }
}
