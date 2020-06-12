import 'package:flutter/material.dart';

class TipCalculator extends StatefulWidget {
  @override
  TipCalculator({Key key}) : super(key: key);
  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  TextStyle estilo = TextStyle(fontSize: 25);
  double billAmount = 0.0;
  double tipPrecentage = 0.0;
  double calculateTip = 0.0;
  double total = 0.0;

  @override
  Widget build(BuildContext context) {
    TextField billAmountField = TextField(
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        try {
          billAmount = double.tryParse(value);
        } catch (exception) {
          billAmount = 0.0;
        }
      },
    );
    TextField tipAmount = TextField(
      decoration: InputDecoration(labelText: "tip %", hintText: "10"),
      keyboardType: TextInputType.number,
      onChanged: (String value) {
        try {
          tipPrecentage = double.tryParse(value);
        } catch (exception) {
          tipPrecentage = 0.0;
        }
      },
    );
    RaisedButton calculateButton = RaisedButton(
      child: Text("Calculate"),
      onPressed: () {
        setState(() {
          calculateTip = billAmount * tipPrecentage / 100;
          total = billAmount + calculateTip;
        });
        //AlertDialog dialog = AlertDialog(content: Text("tip \$$calculateTip total\$$total"));
        //showDialog(context: context, builder: (BuildContext context) => dialog);
      },
    );

    Text textTotal = Text('tip \$$calculateTip total: \$$total', style: estilo);

    Column resultado = Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[textTotal]);
    Container container = Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
          children: [billAmountField, tipAmount, calculateButton, Center(child: resultado)]),
    );
    AppBar appBar = AppBar(title: Text("Tip calculator"));

    Scaffold scaffold = Scaffold(appBar: appBar, body: container);
    return scaffold;
  }
}
